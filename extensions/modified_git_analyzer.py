#!/usr/bin/env python3
"""
Modified Git Impact Analyzer - 支持跳过LLM分析的版本
"""

import os
import re
import json
import subprocess
from datetime import datetime
from typing import List, Dict, Optional, Any

# 清除代理设置
for proxy_var in ['ALL_PROXY', 'all_proxy', 'http_proxy', 'https_proxy', 'HTTP_PROXY', 'HTTPS_PROXY']:
    if proxy_var in os.environ:
        del os.environ[proxy_var]

from neo4j import GraphDatabase
from neo4j_graphrag.generation import GraphRAG
from neo4j_graphrag.retrievers import Text2CypherRetriever
from neo4j_graphrag.llm.ollama_llm import OllamaLLM
from neo4j_graphrag.generation.prompts import RagTemplate

class GitChangeAnalyzer:
    """Git变更分析器"""
    
    def __init__(self, repo_path: str = "."):
        self.repo_path = repo_path
    
    def get_latest_commits(self, count: int = 5) -> List[Dict]:
        """获取最新的提交记录"""
        try:
            cmd = ["git", "-C", self.repo_path, "log", f"--max-count={count}", 
                   "--pretty=format:%H|%an|%ad|%s", "--date=short"]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            
            commits = []
            for line in result.stdout.strip().split('\n'):
                if line:
                    parts = line.split('|')
                    if len(parts) >= 4:
                        commits.append({
                            'hash': parts[0],
                            'author': parts[1],
                            'date': parts[2],
                            'message': parts[3]
                        })
            return commits
        except subprocess.CalledProcessError as e:
            print(f"获取提交记录失败: {e}")
            return []

    def get_commit_diff(self, commit_hash: str) -> str:
        """获取指定提交的差异"""
        try:
            cmd = ["git", "-C", self.repo_path, "show", commit_hash]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            return result.stdout
        except subprocess.CalledProcessError as e:
            print(f"获取提交差异失败: {e}")
            return ""

    def parse_diff_for_changes(self, diff: str) -> Dict[str, List[str]]:
        """解析差异信息，提取变更的文件、变量和函数"""
        changes = {
            'modified_files': [],
            'changed_variables': [],
            'changed_functions': []
        }
        
        # 提取修改的文件
        file_pattern = r'^diff --git a/(.+) b/(.+)'
        for line in diff.split('\n'):
            match = re.match(file_pattern, line)
            if match:
                file_path = match.group(2)
                if file_path.endswith('.m'):  # MATLAB文件
                    changes['modified_files'].append(file_path)
        
        # 提取变量和函数变更（简化版本）
        # 这里可以根据需要添加更复杂的解析逻辑
        for line in diff.split('\n'):
            if line.startswith('+') or line.startswith('-'):
                # 查找变量赋值
                var_match = re.search(r'(\w+)\s*=', line)
                if var_match:
                    var_name = var_match.group(1)
                    if var_name not in changes['changed_variables']:
                        changes['changed_variables'].append(var_name)
                
                # 查找函数定义
                func_match = re.search(r'function\s+(\w+)', line)
                if func_match:
                    func_name = func_match.group(1)
                    if func_name not in changes['changed_functions']:
                        changes['changed_functions'].append(func_name)
        
        return changes


class Neo4jImpactAnalyzer:
    """Neo4j影响分析器 - 支持跳过LLM分析"""
    
    def __init__(self, neo4j_uri: str = "bolt://localhost:7687", 
                 username: str = "neo4j", password: str = "kotei$88",
                 skip_llm_analysis: bool = False):
        self.driver = GraphDatabase.driver(neo4j_uri, auth=(username, password))
        self.skip_llm_analysis = skip_llm_analysis
        
        # 创建 LLM
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
        
        # 只有在不跳过LLM分析时才创建GraphRAG
        if not self.skip_llm_analysis:
            # 创建自定义提示模板
            self.impact_analysis_template = RagTemplate(
                system_instructions="""你是一个代码影响范围分析专家。你需要分析Git变更对代码库的影响范围。

你的任务包括：
1. 分析变更的直接影响
2. 识别潜在的风险点
3. 提供测试建议
4. 评估影响范围

请基于Neo4j数据库中的代码关系图进行分析。""",
                template="""基于以下Git变更和Neo4j数据库中的代码关系信息，请进行详细的影响范围分析：

**Git变更信息:**
{query_text}

**相关代码关系信息:**
{context}

**示例:**
{examples}

请提供以下分析：

1. **变更概述**
   - 变更的类型和规模
   - 涉及的代码元素

2. **直接影响分析**
   - 直接受影响的函数、变量、脚本
   - 变更的具体影响

3. **影响范围评估**
   - 影响深度和广度
   - 关键路径识别

4. **风险评估**
   - 潜在风险点
   - 风险等级评估

5. **测试建议**
   - 重点测试模块
   - 测试策略建议

请用中文回答，结构清晰，重点突出关键信息。"""
            )
            
            # 创建 GraphRAG 系统
            self.graphrag = GraphRAG(
                retriever=self.retriever,
                llm=self.llm,
                prompt_template=self.impact_analysis_template
            )
    
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
            print(f"获取数据库模式失败: {e}")
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
            print(f"生成的查询无效，使用默认查询: {query[:100]}...")
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
            print(f"查询语法验证失败: {e}")
            return False

    def execute_impact_query(self, cypher_query: str) -> Dict[str, Any]:
        """执行影响分析查询"""
        try:
            with self.driver.session() as session:
                result = session.run(cypher_query)
                records = list(result)
                
                # 分析查询结果
                impact_data = {
                    'affected_nodes': [],
                    'relationships': [],
                    'impact_chain': [],
                    'node_count': len(records)
                }
                
                for record in records:
                    # 提取节点和关系信息
                    for key, value in record.items():
                        if hasattr(value, 'labels'):  # Neo4j节点
                            impact_data['affected_nodes'].append({
                                'type': list(value.labels)[0] if value.labels else 'Unknown',
                                'id': value.id,
                                'properties': dict(value)
                            })
                        elif hasattr(value, 'type'):  # Neo4j关系
                            impact_data['relationships'].append({
                                'type': value.type,
                                'id': value.id,
                                'properties': dict(value),
                                'start_node': value.start_node.id,
                                'end_node': value.end_node.id
                            })
                
                return impact_data
                
        except Exception as e:
            print(f"执行查询失败: {e}")
            return {'error': str(e)}
    
    def analyze_changes_with_graphrag(self, changes: Dict[str, Any]) -> Dict[str, Any]:
        """使用GraphRAG分析变更的影响范围"""
        if self.skip_llm_analysis:
            print("=== 跳过LLM分析，直接执行查询 ===")
            return self.analyze_changes_directly(changes)
        else:
            print("=== 使用GraphRAG分析变更影响范围 ===")
            return self.analyze_changes_with_llm(changes)
    
    def analyze_changes_directly(self, changes: Dict[str, Any]) -> Dict[str, Any]:
        """直接分析变更，跳过LLM分析"""
        analysis_results = {
            'direct_queries': [],
            'query_results': [],
            'summary': {}
        }
        
        try:
            # 为每个变更生成直接查询
            for file_path in changes.get('modified_files', []):
                print(f"分析文件变更: {file_path}")
                
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
                print(f"分析变量变更: {variable}")
                
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
                print(f"分析函数变更: {function}")
                
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
            
            print(f"直接分析完成，生成了 {total_queries} 个查询，成功率: {analysis_results['summary']['success_rate']}")
            
        except Exception as e:
            print(f"直接分析过程中出现错误: {e}")
            analysis_results['error'] = str(e)
        
        return analysis_results
    
    def analyze_changes_with_llm(self, changes: Dict[str, Any]) -> Dict[str, Any]:
        """使用LLM分析变更（原有逻辑）"""
        analysis_results = {
            'impact_analysis': [],
            'affected_nodes': [],
            'impact_chains': [],
            'graphrag_queries': []
        }
        
        try:
            # 为每个变更生成GraphRAG查询
            for file_path in changes.get('modified_files', []):
                print(f"分析文件变更: {file_path}")
                
                # 生成文件影响分析查询
                file_query = f"分析MATLAB文件 {file_path} 的变更对整个代码库的影响范围，包括变量、函数和脚本的依赖关系"
                result = self.analyze_with_graphrag(file_query)
                if result:
                    analysis_results['impact_analysis'].append({
                        'type': 'file_change',
                        'target': file_path,
                        'analysis': result
                    })
            
            # 分析变量变更的影响
            for variable in changes.get('changed_variables', []):
                print(f"分析变量变更: {variable}")
                
                var_query = f"分析MATLAB变量 {variable} 的变更对整个代码库的影响范围，找出所有依赖这个变量的函数、脚本和其他变量"
                result = self.analyze_with_graphrag(var_query)
                if result:
                    analysis_results['impact_analysis'].append({
                        'type': 'variable_change',
                        'target': variable,
                        'analysis': result
                    })
            
            # 分析函数变更的影响
            for function in changes.get('changed_functions', []):
                print(f"分析函数变更: {function}")
                
                func_query = f"分析MATLAB函数 {function} 的变更对整个代码库的影响范围，找出所有调用这个函数的脚本和其他函数"
                result = self.analyze_with_graphrag(func_query)
                if result:
                    analysis_results['impact_analysis'].append({
                        'type': 'function_change',
                        'target': function,
                        'analysis': result
                    })
            
            print(f"GraphRAG分析完成，生成了 {len(analysis_results['impact_analysis'])} 个分析结果")
            
        except Exception as e:
            print(f"GraphRAG分析过程中出现错误: {e}")
            analysis_results['error'] = str(e)
        
        return analysis_results

    def analyze_without_llm(self, query: str) -> Optional[Dict[str, Any]]:
        """使用GraphRAG生成查询但不使用LLM分析结果"""
        try:
            # 使用Text2CypherRetriever进行查询
            result = self.retriever.search(
                query_text=query
            )
            
            if hasattr(result, 'cypher_query') and result.cypher_query:
                # 清理Cypher查询
                cypher_query = self.clean_cypher_query(result.cypher_query)
                
                # 验证查询语法
                if not self.validate_cypher_query(cypher_query):
                    print(f"查询语法验证失败，使用默认查询")
                    cypher_query = """
                    MATCH (n)
                    WHERE n.name IS NOT NULL
                    RETURN n
                    LIMIT 10
                    """.strip()
                
                # 直接执行查询获取影响范围
                impact_data = self.execute_impact_query(cypher_query)
                
                return {
                    'query': query,
                    'cypher_query': cypher_query,
                    'impact_data': impact_data,
                    'raw_result': str(result)
                }
            else:
                print(f"GraphRAG未生成有效的Cypher查询")
                return None
                
        except Exception as e:
            print(f"GraphRAG分析失败: {e}")
            return None

    def analyze_with_graphrag(self, query: str) -> Optional[Dict[str, Any]]:
        """使用GraphRAG进行单次分析（原有逻辑）"""
        try:
            # 使用Text2CypherRetriever进行查询
            result = self.retriever.search(
                query_text=query
            )
            
            if hasattr(result, 'cypher_query') and result.cypher_query:
                # 清理Cypher查询
                cypher_query = self.clean_cypher_query(result.cypher_query)
                
                # 验证查询语法
                if not self.validate_cypher_query(cypher_query):
                    print(f"查询语法验证失败，使用默认查询")
                    cypher_query = """
                    MATCH (n)
                    WHERE n.name IS NOT NULL
                    RETURN n
                    LIMIT 10
                    """.strip()
                
                # 执行查询获取影响范围
                impact_data = self.execute_impact_query(cypher_query)
                
                return {
                    'query': query,
                    'cypher_query': cypher_query,
                    'impact_data': impact_data,
                    'raw_result': str(result)
                }
            else:
                print(f"GraphRAG未生成有效的Cypher查询")
                return None
                
        except Exception as e:
            print(f"GraphRAG分析失败: {e}")
            return None

    def __del__(self):
        """清理资源"""
        if hasattr(self, 'driver'):
            self.driver.close()


def main():
    """主函数示例"""
    # 创建分析器，设置跳过LLM分析
    analyzer = Neo4jImpactAnalyzer(skip_llm_analysis=True)
    
    # 示例变更数据
    changes = {
        'modified_files': ['src/main.m', 'src/utils.m'],
        'changed_variables': ['config', 'data'],
        'changed_functions': ['process_data', 'validate_input']
    }
    
    # 执行分析
    results = analyzer.analyze_changes_with_graphrag(changes)
    
    # 输出结果
    print(json.dumps(results, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main() 