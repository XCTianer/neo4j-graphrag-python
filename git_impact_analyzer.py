#!/usr/bin/env python3
"""
Git仓库代码变更影响分析系统
使用Neo4j数据库和GraphRAG分析Git变更的影响范围
生成分析报告和完整影响链路查询
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
        """获取特定提交的差异"""
        try:
            cmd = ["git", "-C", self.repo_path, "show", commit_hash]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            return result.stdout
        except subprocess.CalledProcessError as e:
            print(f"获取提交差异失败: {e}")
            return ""
    
    def get_diff_between_commits(self, commit1: str, commit2: str) -> str:
        """获取两个提交之间的差异"""
        try:
            cmd = ["git", "-C", self.repo_path, "diff", commit1, commit2]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            return result.stdout
        except subprocess.CalledProcessError as e:
            print(f"获取差异失败: {e}")
            return ""
    
    def parse_diff_for_changes(self, diff_output: str) -> Dict[str, List[str]]:
        """解析diff输出，识别代码变更"""
        changes = {
            'modified_files': [],
            'added_files': [],
            'deleted_files': [],
            'changed_variables': [],
            'changed_functions': [],
            'changed_scripts': []
        }
        
        lines = diff_output.split('\n')
        current_file = None
        
        for line in lines:
            # 解析文件头
            if line.startswith('diff --git'):
                parts = line.split()
                if len(parts) >= 3:
                    current_file = parts[2].replace('b/', '')
                    if current_file.endswith('.m'):  # MATLAB文件
                        changes['modified_files'].append(current_file)
                        changes['changed_scripts'].append(os.path.basename(current_file))
            
            # 解析具体的代码变更
            elif line.startswith('+') and not line.startswith('+++'):
                # 识别MATLAB变量变更
                var_match = re.search(r'(\w+)\s*=\s*[^%#\n]+', line)
                if var_match:
                    var_name = var_match.group(1)
                    if var_name not in changes['changed_variables']:
                        changes['changed_variables'].append(var_name)
                
                # 识别MATLAB函数定义变更
                func_match = re.search(r'function\s+(\w+)', line)
                if func_match:
                    func_name = func_match.group(1)
                    if func_name not in changes['changed_functions']:
                        changes['changed_functions'].append(func_name)
            
            elif line.startswith('-') and not line.startswith('---'):
                # 识别删除的变量
                var_match = re.search(r'(\w+)\s*=\s*[^%#\n]+', line)
                if var_match:
                    var_name = var_match.group(1)
                    if var_name not in changes['changed_variables']:
                        changes['changed_variables'].append(var_name)
                
                # 识别删除的函数定义
                func_match = re.search(r'function\s+(\w+)', line)
                if func_match:
                    func_name = func_match.group(1)
                    if func_name not in changes['changed_functions']:
                        changes['changed_functions'].append(func_name)
        
        return changes

class Neo4jImpactAnalyzer:
    """Neo4j影响分析器"""
    
    def __init__(self, neo4j_uri: str = "bolt://localhost:7687", 
                 username: str = "neo4j", password: str = "kotei$88"):
        self.driver = GraphDatabase.driver(neo4j_uri, auth=(username, password))
        
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
                result = session.run("CALL db.labels() YIELD label RETURN collect(label) as labels")
                labels = result.single()['labels']
                
                # 获取关系类型
                result = session.run("CALL db.relationshipTypes() YIELD relationshipType RETURN collect(relationshipType) as types")
                types = result.single()['types']
                
                # 获取属性模式
                schema_info = []
                for label in labels:
                    result = session.run(f"MATCH (n:{label}) RETURN keys(n) as properties LIMIT 1")
                    record = result.single()
                    if record:
                        schema_info.append(f"{label}: {record['properties']}")
                
                schema = f"""
                Node Labels: {labels}
                Relationship Types: {types}
                Node Properties: {schema_info}
                """
                return schema
        except Exception as e:
            print(f"获取数据库模式失败: {e}")
            return "代码关系图包含Variable、Function、Script节点和RELATES_TO、IMPLEMENTED_IN关系"
    
    def analyze_changes_with_graphrag(self, changes: Dict[str, Any]) -> Dict[str, Any]:
        """使用GraphRAG分析变更的影响范围"""
        print("=== 使用GraphRAG分析变更影响范围 ===")
        
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
            
            # 生成综合影响分析
            if changes.get('modified_files') or changes.get('changed_variables') or changes.get('changed_functions'):
                print("生成综合影响分析...")
                
                # 构建综合查询
                change_summary = []
                if changes.get('modified_files'):
                    change_summary.append(f"修改了 {len(changes['modified_files'])} 个文件")
                if changes.get('changed_variables'):
                    change_summary.append(f"变更了 {len(changes['changed_variables'])} 个变量")
                if changes.get('changed_functions'):
                    change_summary.append(f"变更了 {len(changes['changed_functions'])} 个函数")
                
                comprehensive_query = f"综合分析MATLAB代码变更的影响范围：{', '.join(change_summary)}。请分析这些变更对整个代码库的完整影响链路，包括直接和间接影响。"
                
                result = self.analyze_with_graphrag(comprehensive_query)
                if result:
                    analysis_results['impact_analysis'].append({
                        'type': 'comprehensive',
                        'target': 'all_changes',
                        'analysis': result
                    })
            
            print(f"GraphRAG分析完成，生成了 {len(analysis_results['impact_analysis'])} 个分析结果")
            
        except Exception as e:
            print(f"GraphRAG分析过程中出现错误: {e}")
            analysis_results['error'] = str(e)
        
        return analysis_results

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
            # 如果查询无效，生成一个基本的查询
            print(f"生成的查询无效，使用默认查询: {query[:100]}...")
            return """
            MATCH (n)
            WHERE n.name IS NOT NULL
            RETURN n
            LIMIT 10
            """.strip()
        
        return query.strip()

    def analyze_with_graphrag(self, query: str) -> Optional[Dict[str, Any]]:
        """使用GraphRAG进行单次分析"""
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

    def validate_cypher_query(self, cypher_query: str) -> bool:
        """验证Cypher查询语法"""
        try:
            # 基本语法检查
            query_upper = cypher_query.upper().strip()
            
            # 检查是否包含基本的关键字
            if not any(keyword in query_upper for keyword in ['MATCH', 'RETURN']):
                return False
            
            # 检查括号匹配
            if cypher_query.count('(') != cypher_query.count(')'):
                return False
            
            # 检查引号匹配
            if cypher_query.count("'") % 2 != 0:
                return False
            
            # 尝试解析查询（简单验证）
            with self.driver.session() as session:
                # 使用EXPLAIN来验证查询语法，不实际执行
                try:
                    session.run("EXPLAIN " + cypher_query)
                    return True
                except Exception:
                    return False
                    
        except Exception:
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
                                'properties': dict(value)
                            })
                        elif hasattr(value, 'type'):  # Neo4j关系
                            impact_data['relationships'].append({
                                'type': value.type,
                                'properties': dict(value)
                            })
                
                return impact_data
                
        except Exception as e:
            print(f"执行影响查询失败: {e}")
            return {'error': str(e)}

    def generate_impact_queries(self, changes: Dict[str, Any]) -> Dict[str, Any]:
        """基于GraphRAG分析结果生成影响查询"""
        print("=== 生成基于GraphRAG分析的影响查询 ===")
        
        impact_queries = {
            'variable_impact_queries': [],
            'function_impact_queries': [],
            'script_impact_queries': [],
            'comprehensive_impact_queries': []
        }
        
        try:
            # 为每个变更生成专门的GraphRAG查询
            for variable in changes.get('changed_variables', []):
                print(f"为变量 {variable} 生成GraphRAG影响查询...")
                
                # 使用GraphRAG生成变量影响查询
                var_query = f"生成Cypher查询来分析MATLAB变量 {variable} 的完整影响链路，包括所有依赖关系和调用链"
                result = self.analyze_with_graphrag(var_query)
                
                if result and result.get('cypher_query'):
                    impact_queries['variable_impact_queries'].append({
                        'variable': variable,
                        'query': result['cypher_query'],
                        'description': f"变量 {variable} 的完整影响链路分析"
                    })
                else:
                    # 备用方案：生成基本的变量影响查询
                    fallback_query = f"""
                    // 变量 {variable} 的完整影响链路分析
                    MATCH (v:Variable {{name: '{variable}'}})
                    OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
                    OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
                    OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
                    OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
                    OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
                    OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
                    OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
                    RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
                    ORDER BY v.name, f.name, s.name
                    """.strip()
                    
                    impact_queries['variable_impact_queries'].append({
                        'variable': variable,
                        'query': fallback_query,
                        'description': f"变量 {variable} 的完整影响链路分析（备用查询）"
                    })
            
            for function in changes.get('changed_functions', []):
                print(f"为函数 {function} 生成GraphRAG影响查询...")
                
                # 使用GraphRAG生成函数影响查询
                func_query = f"生成Cypher查询来分析MATLAB函数 {function} 的完整影响链路，包括所有调用关系和依赖链"
                result = self.analyze_with_graphrag(func_query)
                
                if result and result.get('cypher_query'):
                    impact_queries['function_impact_queries'].append({
                        'function': function,
                        'query': result['cypher_query'],
                        'description': f"函数 {function} 的完整影响链路分析"
                    })
                else:
                    # 备用方案：生成基本的函数影响查询
                    fallback_query = f"""
                    // 函数 {function} 的完整影响链路分析
                    MATCH (f:Function {{name: '{function}'}})
                    OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
                    OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
                    OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
                    OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
                    OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
                    OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
                    OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
                    RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
                    ORDER BY f.name, s.name
                    """.strip()
                    
                    impact_queries['function_impact_queries'].append({
                        'function': function,
                        'query': fallback_query,
                        'description': f"函数 {function} 的完整影响链路分析（备用查询）"
                    })
            
            for file_path in changes.get('modified_files', []):
                print(f"为文件 {file_path} 生成GraphRAG影响查询...")
                
                # 使用GraphRAG生成脚本影响查询
                script_query = f"生成Cypher查询来分析MATLAB文件 {file_path} 的完整影响链路，包括所有相关的变量、函数和依赖关系"
                result = self.analyze_with_graphrag(script_query)
                
                if result and result.get('cypher_query'):
                    impact_queries['script_impact_queries'].append({
                        'script': file_path,
                        'query': result['cypher_query'],
                        'description': f"文件 {file_path} 的完整影响链路分析"
                    })
                else:
                    # 备用方案：生成基本的脚本影响查询
                    script_name = os.path.basename(file_path)
                    fallback_query = f"""
                    // 脚本 {script_name} 的完整影响链路分析
                    MATCH (s:Script {{name: '{script_name}'}})
                    OPTIONAL MATCH (s)-[r1:RELATES_TO]->(f:Function)
                    OPTIONAL MATCH (s)-[r2:RELATES_TO]->(v:Variable)
                    OPTIONAL MATCH (f)-[r3:IMPLEMENTED_IN]->(s2:Script)
                    OPTIONAL MATCH (s2)-[r4:RELATES_TO]->(f2:Function)
                    OPTIONAL MATCH (s2)-[r5:RELATES_TO]->(v2:Variable)
                    OPTIONAL MATCH (f2)-[r6:IMPLEMENTED_IN]->(s3:Script)
                    OPTIONAL MATCH (s3)-[r7:RELATES_TO]->(f3:Function)
                    OPTIONAL MATCH (s3)-[r8:RELATES_TO]->(v3:Variable)
                    RETURN s, f, v, s2, f2, v2, s3, f3, v3, r1, r2, r3, r4, r5, r6, r7, r8
                    ORDER BY s.name, f.name
                    """.strip()
                    
                    impact_queries['script_impact_queries'].append({
                        'script': file_path,
                        'query': fallback_query,
                        'description': f"文件 {file_path} 的完整影响链路分析（备用查询）"
                    })
            
            # 生成综合影响查询
            if changes.get('modified_files') or changes.get('changed_variables') or changes.get('changed_functions'):
                print("生成综合GraphRAG影响查询...")
                
                comprehensive_query = f"生成Cypher查询来分析以下MATLAB代码变更的综合影响范围：文件变更 {changes.get('modified_files', [])}，变量变更 {changes.get('changed_variables', [])}，函数变更 {changes.get('changed_functions', [])}。查询应该显示完整的依赖关系和影响链路。"
                
                result = self.analyze_with_graphrag(comprehensive_query)
                if result and result.get('cypher_query'):
                    impact_queries['comprehensive_impact_queries'].append({
                        'query': result['cypher_query'],
                        'description': "所有变更的综合影响分析",
                        'changes': changes
                    })
                else:
                    # 备用方案：生成综合影响查询
                    variables = changes.get('changed_variables', [])
                    functions = changes.get('changed_functions', [])
                    scripts = [os.path.basename(f) for f in changes.get('modified_files', [])]
                    
                    fallback_query = f"""
                    // 所有变更的综合影响分析
                    MATCH (n)
                    WHERE (n:Variable AND n.name IN {variables})
                       OR (n:Function AND n.name IN {functions})
                       OR (n:Script AND n.name IN {scripts})
                    OPTIONAL MATCH (n)-[r1:RELATES_TO]->(related1)
                    OPTIONAL MATCH (n)-[r2:IMPLEMENTED_IN]->(related2)
                    OPTIONAL MATCH (related1)-[r3:RELATES_TO]->(related3)
                    OPTIONAL MATCH (related1)-[r4:IMPLEMENTED_IN]->(related4)
                    OPTIONAL MATCH (related2)-[r5:RELATES_TO]->(related5)
                    OPTIONAL MATCH (related2)-[r6:IMPLEMENTED_IN]->(related6)
                    RETURN n, related1, related2, related3, related4, related5, related6,
                           r1, r2, r3, r4, r5, r6
                    ORDER BY labels(n), n.name
                    """.strip()
                    
                    impact_queries['comprehensive_impact_queries'].append({
                        'query': fallback_query,
                        'description': "所有变更的综合影响分析（备用查询）",
                        'changes': changes
                    })
            
            print(f"生成了 {len(impact_queries['variable_impact_queries'])} 个变量影响查询")
            print(f"生成了 {len(impact_queries['function_impact_queries'])} 个函数影响查询")
            print(f"生成了 {len(impact_queries['script_impact_queries'])} 个脚本影响查询")
            print(f"生成了 {len(impact_queries['comprehensive_impact_queries'])} 个综合影响查询")
            
        except Exception as e:
            print(f"生成影响查询时出现错误: {e}")
            impact_queries['error'] = str(e)
        
        return impact_queries
    
    def close(self):
        """关闭数据库连接"""
        self.driver.close()

class ImpactAnalysisReport:
    """影响分析报告生成器"""
    
    def __init__(self):
        self.report_data = {}
    
    def generate_report(self, git_analyzer: GitChangeAnalyzer, neo4j_analyzer: Neo4jImpactAnalyzer, 
                       commit_count: int = 3) -> Dict[str, Any]:
        """生成完整的分析报告"""
        print("=== 生成Git变更影响分析报告 ===")
        print(f"分析时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        
        # 1. 获取最新提交
        print("\n1. 获取最新提交记录...")
        commits = git_analyzer.get_latest_commits(commit_count)
        print(f"获取到 {len(commits)} 个提交")
        
        all_analyses = []
        
        for i, commit in enumerate(commits):
            print(f"\n2.{i+1} 分析提交: {commit['hash'][:8]} - {commit['message']}")
            
            # 获取提交差异
            diff = git_analyzer.get_commit_diff(commit['hash'])
            if diff:
                # 解析变更
                changes = git_analyzer.parse_diff_for_changes(diff)
                print(f"   变更文件: {len(changes['modified_files'])} 个")
                print(f"   变更变量: {len(changes['changed_variables'])} 个")
                print(f"   变更函数: {len(changes['changed_functions'])} 个")
                
                # 使用GraphRAG分析
                if changes['modified_files'] or changes['changed_variables'] or changes['changed_functions']:
                    print(f"   使用GraphRAG分析影响范围...")
                    analysis_result = neo4j_analyzer.analyze_changes_with_graphrag(changes)
                    
                    # 生成影响查询
                    impact_queries = neo4j_analyzer.generate_impact_queries(changes)
                    
                    analysis_data = {
                        'commit_info': commit,
                        'changes': changes,
                        'analysis_result': analysis_result,
                        'impact_queries': impact_queries
                    }
                    all_analyses.append(analysis_data)
                else:
                    print(f"   无相关变更")
            else:
                print(f"   无法获取差异信息")
        
        return {
            'analysis_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            'commits_analyzed': len(commits),
            'analyses': all_analyses
        }
    
    def save_report(self, report_data: Dict[str, Any], filename: str):
        """保存分析报告"""
        with open(filename, 'w', encoding='utf-8') as f:
            f.write("# Git变更影响范围分析报告\n\n")
            f.write(f"**生成时间**: {report_data['analysis_time']}\n")
            f.write(f"**目标仓库**: {report_data['target_repo']}\n")
            f.write(f"**分析提交数**: {report_data['commits_analyzed']}\n\n")
            
            f.write("---\n\n")
            
            for i, analysis in enumerate(report_data['analyses'], 1):
                commit_info = analysis['commit_info']
                changes = analysis['changes']
                analysis_result = analysis.get('analysis_result', {})
                impact_queries = analysis.get('impact_queries', {})
                
                f.write(f"## 提交 {i}: {commit_info['hash'][:8]} - {commit_info['message']}\n\n")
                
                f.write("**提交信息**:\n")
                f.write(f"- 哈希: {commit_info['hash']}\n")
                f.write(f"- 作者: {commit_info['author']}\n")
                f.write(f"- 时间: {commit_info['date']}\n")
                f.write(f"- 消息: {commit_info['message']}\n\n")
                
                f.write("**变更概述**:\n")
                f.write(f"- 修改文件: {len(changes.get('modified_files', []))} 个\n")
                f.write(f"- 变更变量: {len(changes.get('changed_variables', []))} 个\n")
                f.write(f"- 变更函数: {len(changes.get('changed_functions', []))} 个\n")
                f.write(f"- 变更脚本: {len(changes.get('changed_scripts', []))} 个\n\n")
                
                if changes.get('modified_files'):
                    f.write("**修改文件**:\n")
                    for file_path in changes['modified_files']:
                        f.write(f"- {file_path}\n")
                    f.write("\n")
                
                if changes.get('changed_variables'):
                    f.write("**变更变量**:\n")
                    for var in changes['changed_variables']:
                        f.write(f"- {var}\n")
                    f.write("\n")
                
                if changes.get('changed_functions'):
                    f.write("**变更函数**:\n")
                    for func in changes['changed_functions']:
                        f.write(f"- {func}\n")
                    f.write("\n")
                
                # GraphRAG分析结果
                f.write("**GraphRAG影响分析**:\n")
                if analysis_result.get('impact_analysis'):
                    for impact in analysis_result['impact_analysis']:
                        f.write(f"- **{impact['type']}**: {impact['target']}\n")
                        if impact.get('analysis', {}).get('impact_data'):
                            impact_data = impact['analysis']['impact_data']
                            f.write(f"  - 影响节点数: {impact_data.get('node_count', 0)}\n")
                            f.write(f"  - 影响关系数: {len(impact_data.get('relationships', []))}\n")
                        f.write("\n")
                elif analysis_result.get('error'):
                    f.write(f"分析失败: {analysis_result['error']}\n\n")
                else:
                    f.write("无GraphRAG分析结果\n\n")
                
                f.write("---\n\n")
            
            print(f"分析报告已保存到: {filename}")

    def save_impact_queries(self, report_data: Dict[str, Any], filename: str):
        """保存影响查询"""
        with open(filename, 'w', encoding='utf-8') as f:
            f.write("-- Git变更影响链路查询\n")
            f.write(f"-- 生成时间: {report_data['analysis_time']}\n")
            f.write(f"-- 目标仓库: {report_data['target_repo']}\n")
            f.write("-- 使用方法: 在Neo4j Browser中复制粘贴以下查询\n\n")
            
            for i, analysis in enumerate(report_data['analyses'], 1):
                commit_info = analysis['commit_info']
                impact_queries = analysis.get('impact_queries', {})
                
                f.write(f"-- ==========================================\n")
                f.write(f"-- 提交 {i}: {commit_info['hash'][:8]} - {commit_info['message']}\n")
                f.write(f"-- ==========================================\n\n")
                
                # 变量影响查询
                if impact_queries.get('variable_impact_queries'):
                    f.write("-- 变量影响查询\n\n")
                    for j, query_data in enumerate(impact_queries['variable_impact_queries'], 1):
                        f.write(f"-- 变量影响查询 {j}\n")
                        f.write(f"-- {query_data['description']}\n")
                        f.write(query_data['query'])
                        f.write("\n\n")
                
                # 函数影响查询
                if impact_queries.get('function_impact_queries'):
                    f.write("-- 函数影响查询\n\n")
                    for j, query_data in enumerate(impact_queries['function_impact_queries'], 1):
                        f.write(f"-- 函数影响查询 {j}\n")
                        f.write(f"-- {query_data['description']}\n")
                        f.write(query_data['query'])
                        f.write("\n\n")
                
                # 脚本影响查询
                if impact_queries.get('script_impact_queries'):
                    f.write("-- 脚本影响查询\n\n")
                    for j, query_data in enumerate(impact_queries['script_impact_queries'], 1):
                        f.write(f"-- 脚本影响查询 {j}\n")
                        f.write(f"-- {query_data['description']}\n")
                        f.write(query_data['query'])
                        f.write("\n\n")
                
                # 综合影响查询
                if impact_queries.get('comprehensive_impact_queries'):
                    f.write("-- 综合影响查询\n\n")
                    for j, query_data in enumerate(impact_queries['comprehensive_impact_queries'], 1):
                        f.write(f"-- 综合影响查询 {j}\n")
                        f.write(f"-- {query_data['description']}\n")
                        f.write(query_data['query'])
                        f.write("\n\n")
                
                f.write("\n")
            
            # 使用说明
            f.write("-- ==========================================\n")
            f.write("-- 使用说明\n")
            f.write("-- ==========================================\n")
            f.write("-- 1. 打开Neo4j Browser: http://localhost:7474\n")
            f.write("-- 2. 复制上述查询到查询框\n")
            f.write("-- 3. 点击运行按钮\n")
            f.write("-- 4. 对于可视化查询，选择'Graph'视图查看图形\n")
            f.write("-- 5. 使用'Table'视图查看详细数据\n")
            f.write("-- 6. 这些查询基于GraphRAG智能分析生成，显示完整的影响链路\n")
            
            print(f"影响链路查询已保存到: {filename}")

def main():
    print("=== Git仓库代码变更影响分析系统 ===")
    
    # 配置 - 修改为分析transformer-models仓库
    repo_path = "."  # 当前目录（已配置transformer-models远程仓库）
    target_repo_url = "https://github.com/XCTianer/transformer-models.git"  # 目标仓库地址
    neo4j_uri = "bolt://localhost:7687"
    neo4j_username = "neo4j"
    neo4j_password = "kotei$88"
    commit_count = 3  # 分析的提交数量
    
    print(f"目标仓库: {target_repo_url}")
    print(f"Neo4j数据库: {neo4j_uri}")
    print(f"分析提交数: {commit_count}")
    
    try:
        # 创建分析器
        git_analyzer = GitChangeAnalyzer(repo_path)
        neo4j_analyzer = Neo4jImpactAnalyzer(neo4j_uri, neo4j_username, neo4j_password)
        report_generator = ImpactAnalysisReport()
        
        # 检查远程仓库配置
        print(f"\n检查远程仓库配置...")
        try:
            cmd = ["git", "remote", "get-url", "transformer-models"]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            current_remote = result.stdout.strip()
            print(f"当前transformer-models远程仓库: {current_remote}")
            
            if current_remote != target_repo_url:
                print(f"更新远程仓库地址...")
                subprocess.run(["git", "remote", "set-url", "transformer-models", target_repo_url], check=True)
                print(f"已更新为: {target_repo_url}")
        except subprocess.CalledProcessError:
            print(f"添加transformer-models远程仓库...")
            subprocess.run(["git", "remote", "add", "transformer-models", target_repo_url], check=True)
            print(f"已添加: {target_repo_url}")
        
        # 获取transformer-models仓库的最新提交
        print(f"\n获取transformer-models仓库的最新提交...")
        try:
            # 获取transformer-models分支的最新提交
            cmd = ["git", "log", "transformer-models/main", f"--max-count={commit_count}", 
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
            
            print(f"获取到 {len(commits)} 个transformer-models提交")
            
            all_analyses = []
            
            for i, commit in enumerate(commits):
                print(f"\n分析提交 {i+1}/{len(commits)}: {commit['hash'][:8]} - {commit['message']}")
                
                # 获取transformer-models提交的差异
                try:
                    cmd = ["git", "show", f"transformer-models/main~{len(commits)-i-1}..transformer-models/main~{len(commits)-i-2}"]
                    result = subprocess.run(cmd, capture_output=True, text=True, check=True)
                    diff = result.stdout
                    
                    if diff:
                        # 解析变更
                        changes = git_analyzer.parse_diff_for_changes(diff)
                        print(f"   变更文件: {len(changes['modified_files'])} 个")
                        print(f"   变更变量: {len(changes['changed_variables'])} 个")
                        print(f"   变更函数: {len(changes['changed_functions'])} 个")
                        
                        # 使用GraphRAG分析
                        if changes['modified_files'] or changes['changed_variables'] or changes['changed_functions']:
                            print(f"   使用GraphRAG分析影响范围...")
                            analysis_result = neo4j_analyzer.analyze_changes_with_graphrag(changes)
                            
                            # 生成影响查询
                            impact_queries = neo4j_analyzer.generate_impact_queries(changes)
                            
                            analysis_data = {
                                'commit_info': commit,
                                'changes': changes,
                                'analysis_result': analysis_result,
                                'impact_queries': impact_queries
                            }
                            all_analyses.append(analysis_data)
                        else:
                            print(f"   无相关变更")
                    else:
                        print(f"   无法获取差异信息")
                        
                except subprocess.CalledProcessError as e:
                    print(f"   获取差异失败: {e}")
                    continue
            
            # 生成报告数据
            report_data = {
                'analysis_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                'target_repo': target_repo_url,
                'commits_analyzed': len(commits),
                'analyses': all_analyses
            }
            
            # 保存报告
            report_filename = 'transformer_models_impact_analysis_report.md'
            query_filename = 'transformer_models_impact_queries.cypher'
            
            report_generator.save_report(report_data, report_filename)
            report_generator.save_impact_queries(report_data, query_filename)
            
            print(f"\n=== 分析完成 ===")
            print(f"目标仓库: {target_repo_url}")
            print(f"分析提交数: {report_data['commits_analyzed']}")
            print(f"成功分析: {len(report_data['analyses'])} 个提交")
            print(f"报告文件: {report_filename}")
            print(f"查询文件: {query_filename}")
            
        except subprocess.CalledProcessError as e:
            print(f"获取transformer-models提交失败: {e}")
            print("请确保transformer-models远程仓库已正确配置")
        
    except Exception as e:
        print(f"分析过程中出现错误: {e}")
    finally:
        # 关闭连接
        if 'neo4j_analyzer' in locals():
            neo4j_analyzer.close()

if __name__ == "__main__":
    main() 