#!/usr/bin/env python3
"""
Direct GraphRAG Analyzer - 直接返回查询结果而不经过大模型分析
"""

import os
import re
import json
import logging
from datetime import datetime
from typing import List, Dict, Optional, Any
from pathlib import Path

from neo4j import GraphDatabase
from neo4j_graphrag.retrievers import Text2CypherRetriever
from neo4j_graphrag.llm.ollama_llm import OllamaLLM

class DirectGraphRAGAnalyzer:
    """直接GraphRAG分析器 - 跳过LLM分析步骤"""
    
    def __init__(self, neo4j_uri: str = "bolt://localhost:7687", 
                 username: str = "neo4j", password: str = "kotei$88"):
        self.driver = GraphDatabase.driver(neo4j_uri, auth=(username, password))
        
        # 创建 LLM (仅用于生成Cypher查询)
        self.llm = OllamaLLM(
            model_name="deepseek-r1:1.5b",
            model_params={
                "temperature": 0.1,
                "num_predict": 1024,
                "num_ctx": 4096,
                "top_p": 0.9,
                "top_k": 40
            }
        )
        
        # 获取数据库模式
        self.schema = self.get_database_schema()
        
        # 创建 Text2Cypher 检索器
        self.retriever = Text2CypherRetriever(
            driver=self.driver,
            llm=self.llm,
            neo4j_schema=self.schema,
            neo4j_database="neo4j"
        )
        
        # 设置日志
        self.setup_logging()
    
    def setup_logging(self):
        """设置日志"""
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
        )
        self.logger = logging.getLogger(__name__)
    
    def get_database_schema(self) -> str:
        """获取Neo4j数据库模式"""
        try:
            with self.driver.session() as session:
                # 获取节点标签
                result = session.run("CALL db.labels() YIELD label RETURN label")
                labels = [record["label"] for record in result]
                
                # 获取关系类型
                result = session.run("CALL db.relationshipTypes() YIELD relationshipType RETURN relationshipType")
                relationship_types = [record["relationshipType"] for record in result]
                
                # 获取属性
                result = session.run("CALL db.propertyKeys() YIELD propertyKey RETURN propertyKey")
                properties = [record["propertyKey"] for record in result]
                
                schema = {
                    "labels": labels,
                    "relationship_types": relationship_types,
                    "properties": properties
                }
                
                return json.dumps(schema, ensure_ascii=False, indent=2)
                
        except Exception as e:
            self.logger.error(f"获取数据库模式失败: {e}")
            return "{}"
    
    def clean_cypher_query(self, cypher_query: str) -> str:
        """清理和验证Cypher查询"""
        if not cypher_query:
            return ""
        
        # 移除可能的标签和格式问题
        query = cypher_query.strip()
        
        # 移除可能的markdown代码块标记
        if query.startswith('```cypher'):
            query = query[9:]
        if query.startswith('```'):
            query = query[3:]
        if query.endswith('```'):
            query = query[:-3]
        
        # 移除可能的XML标签
        query = re.sub(r'<[^>]+>', '', query)
        
        # 移除可能的思考标签
        query = re.sub(r'<think>.*?</think>', '', query, flags=re.DOTALL)
        
        # 确保查询以有效的Cypher关键字开头
        valid_starters = [
            'MATCH', 'OPTIONAL MATCH', 'CREATE', 'MERGE', 'DELETE', 
            'DETACH DELETE', 'SET', 'REMOVE', 'RETURN', 'WITH', 'UNWIND',
            'CALL', 'LOAD', 'START', 'STOP'
        ]
        
        query_upper = query.upper().strip()
        is_valid = any(query_upper.startswith(starter) for starter in valid_starters)
        
        if not is_valid:
            self.logger.warning(f"生成的查询无效，使用默认查询: {query[:100]}...")
            return """
            MATCH (n)
            WHERE n.name IS NOT NULL
            RETURN n
            LIMIT 10
            """.strip()
        
        return query.strip()
    
    def validate_cypher_query(self, cypher_query: str) -> bool:
        """验证Cypher查询语法"""
        try:
            with self.driver.session() as session:
                # 尝试解析查询（不执行）
                session.run("EXPLAIN " + cypher_query)
                return True
        except Exception as e:
            self.logger.warning(f"查询语法验证失败: {e}")
            return False
    
    def execute_query_directly(self, cypher_query: str) -> Dict[str, Any]:
        """直接执行Cypher查询并返回结构化结果"""
        try:
            with self.driver.session() as session:
                result = session.run(cypher_query)
                records = list(result)
                
                # 结构化查询结果
                structured_result = {
                    'query': cypher_query,
                    'execution_time': datetime.now().isoformat(),
                    'record_count': len(records),
                    'records': [],
                    'nodes': [],
                    'relationships': [],
                    'summary': {}
                }
                
                # 处理每条记录
                for record in records:
                    record_data = {}
                    nodes_in_record = []
                    relationships_in_record = []
                    
                    for key, value in record.items():
                        if hasattr(value, 'labels'):  # Neo4j节点
                            node_data = {
                                'id': value.id,
                                'labels': list(value.labels),
                                'properties': dict(value)
                            }
                            record_data[key] = node_data
                            nodes_in_record.append(node_data)
                            
                        elif hasattr(value, 'type'):  # Neo4j关系
                            rel_data = {
                                'id': value.id,
                                'type': value.type,
                                'properties': dict(value),
                                'start_node_id': value.start_node.id,
                                'end_node_id': value.end_node.id
                            }
                            record_data[key] = rel_data
                            relationships_in_record.append(rel_data)
                            
                        else:  # 其他值（字符串、数字等）
                            record_data[key] = value
                    
                    structured_result['records'].append(record_data)
                    structured_result['nodes'].extend(nodes_in_record)
                    structured_result['relationships'].extend(relationships_in_record)
                
                # 生成摘要统计
                node_types = {}
                for node in structured_result['nodes']:
                    for label in node['labels']:
                        node_types[label] = node_types.get(label, 0) + 1
                
                rel_types = {}
                for rel in structured_result['relationships']:
                    rel_type = rel['type']
                    rel_types[rel_type] = rel_types.get(rel_type, 0) + 1
                
                structured_result['summary'] = {
                    'node_types': node_types,
                    'relationship_types': rel_types,
                    'total_nodes': len(structured_result['nodes']),
                    'total_relationships': len(structured_result['relationships'])
                }
                
                return structured_result
                
        except Exception as e:
            self.logger.error(f"执行查询失败: {e}")
            return {
                'error': str(e),
                'query': cypher_query,
                'execution_time': datetime.now().isoformat()
            }
    
    def analyze_without_llm(self, query: str) -> Dict[str, Any]:
        """使用GraphRAG生成查询但不使用LLM分析结果"""
        try:
            self.logger.info(f"分析查询: {query}")
            
            # 使用Text2CypherRetriever生成Cypher查询
            result = self.retriever.search(query_text=query)
            
            if hasattr(result, 'cypher_query') and result.cypher_query:
                # 清理Cypher查询
                cypher_query = self.clean_cypher_query(result.cypher_query)
                
                # 验证查询语法
                if not self.validate_cypher_query(cypher_query):
                    self.logger.warning("查询语法验证失败，使用默认查询")
                    cypher_query = """
                    MATCH (n)
                    WHERE n.name IS NOT NULL
                    RETURN n
                    LIMIT 10
                    """.strip()
                
                # 直接执行查询并返回结果
                query_result = self.execute_query_directly(cypher_query)
                
                return {
                    'original_query': query,
                    'generated_cypher': cypher_query,
                    'query_result': query_result,
                    'analysis_method': 'direct_query_execution'
                }
            else:
                self.logger.warning("GraphRAG未生成有效的Cypher查询")
                return {
                    'error': 'No valid Cypher query generated',
                    'original_query': query
                }
                
        except Exception as e:
            self.logger.error(f"分析失败: {e}")
            return {
                'error': str(e),
                'original_query': query
            }
    
    def analyze_changes_directly(self, changes: Dict[str, Any]) -> Dict[str, Any]:
        """直接分析变更而不使用LLM"""
        self.logger.info("=== 直接分析变更影响范围（跳过LLM分析）===")
        
        analysis_results = {
            'direct_queries': [],
            'query_results': [],
            'summary': {}
        }
        
        try:
            # 为每个变更生成直接查询
            for file_path in changes.get('modified_files', []):
                self.logger.info(f"分析文件变更: {file_path}")
                
                file_query = f"分析MATLAB文件 {file_path} 的变更对整个代码库的影响范围，包括变量、函数和脚本的依赖关系"
                result = self.analyze_without_llm(file_query)
                if result:
                    analysis_results['direct_queries'].append({
                        'type': 'file_change',
                        'target': file_path,
                        'query': result
                    })
            
            # 分析变量变更的影响
            for variable in changes.get('changed_variables', []):
                self.logger.info(f"分析变量变更: {variable}")
                
                var_query = f"分析MATLAB变量 {variable} 的变更对整个代码库的影响范围，找出所有依赖这个变量的函数、脚本和其他变量"
                result = self.analyze_without_llm(var_query)
                if result:
                    analysis_results['direct_queries'].append({
                        'type': 'variable_change',
                        'target': variable,
                        'query': result
                    })
            
            # 分析函数变更的影响
            for function in changes.get('changed_functions', []):
                self.logger.info(f"分析函数变更: {function}")
                
                func_query = f"分析MATLAB函数 {function} 的变更对整个代码库的影响范围，找出所有调用这个函数的脚本和其他函数"
                result = self.analyze_without_llm(func_query)
                if result:
                    analysis_results['direct_queries'].append({
                        'type': 'function_change',
                        'target': function,
                        'query': result
                    })
            
            # 生成摘要统计
            total_queries = len(analysis_results['direct_queries'])
            successful_queries = len([q for q in analysis_results['direct_queries'] if 'error' not in q['query']])
            
            analysis_results['summary'] = {
                'total_queries': total_queries,
                'successful_queries': successful_queries,
                'success_rate': f"{successful_queries/total_queries*100:.1f}%" if total_queries > 0 else "0%",
                'analysis_time': datetime.now().isoformat()
            }
            
            self.logger.info(f"直接分析完成，生成了 {total_queries} 个查询，成功率: {analysis_results['summary']['success_rate']}")
            
        except Exception as e:
            self.logger.error(f"直接分析过程中出现错误: {e}")
            analysis_results['error'] = str(e)
        
        return analysis_results
    
    def generate_cypher_only(self, query: str) -> str:
        """仅生成Cypher查询，不执行"""
        try:
            result = self.retriever.search(query_text=query)
            
            if hasattr(result, 'cypher_query') and result.cypher_query:
                return self.clean_cypher_query(result.cypher_query)
            else:
                return ""
                
        except Exception as e:
            self.logger.error(f"生成Cypher查询失败: {e}")
            return ""
    
    def __del__(self):
        """清理资源"""
        if hasattr(self, 'driver'):
            self.driver.close()


def main():
    """主函数示例"""
    # 创建直接分析器
    analyzer = DirectGraphRAGAnalyzer()
    
    # 示例变更数据
    changes = {
        'modified_files': ['src/main.m', 'src/utils.m'],
        'changed_variables': ['config', 'data'],
        'changed_functions': ['process_data', 'validate_input']
    }
    
    # 执行直接分析
    results = analyzer.analyze_changes_directly(changes)
    
    # 输出结果
    print(json.dumps(results, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main() 