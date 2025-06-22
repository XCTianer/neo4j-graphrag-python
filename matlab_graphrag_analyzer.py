#!/usr/bin/env python3
"""
MATLAB代码 GraphRAG 影响范围分析系统
使用neo4j_graphrag工作流进行智能检索和影响分析
支持Git集成功能
"""

import os
import re
import json
import subprocess
from datetime import datetime
from typing import List, Dict, Optional, Any

# 清除所有代理设置
for proxy_var in ['ALL_PROXY', 'all_proxy', 'http_proxy', 'https_proxy', 'HTTP_PROXY', 'HTTPS_PROXY']:
    if proxy_var in os.environ:
        del os.environ[proxy_var]

from neo4j import GraphDatabase
from neo4j_graphrag.generation import GraphRAG
from neo4j_graphrag.retrievers import Text2CypherRetriever
from neo4j_graphrag.llm.ollama_llm import OllamaLLM
from neo4j_graphrag.generation.prompts import RagTemplate

class GitIntegration:
    """Git集成功能类"""
    
    def __init__(self, repo_path: str = "."):
        self.repo_path = repo_path
    
    def get_git_diff(self, commit1: str = "HEAD~1", commit2: str = "HEAD") -> str:
        """获取两个提交之间的差异"""
        try:
            cmd = ["git", "-C", self.repo_path, "diff", commit1, commit2]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            return result.stdout
        except subprocess.CalledProcessError as e:
            print(f"获取Git差异失败: {e}")
            return ""
    
    def get_recent_commits(self, count: int = 10) -> List[Dict]:
        """获取最近的提交记录"""
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
            cmd = ["git", "-C", self.repo_path, "show", commit_hash, "--name-only"]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            return result.stdout
        except subprocess.CalledProcessError as e:
            print(f"获取提交差异失败: {e}")
            return ""
    
    def get_file_history(self, file_path: str, count: int = 5) -> List[Dict]:
        """获取文件的提交历史"""
        try:
            cmd = ["git", "-C", self.repo_path, "log", f"--max-count={count}", 
                   "--pretty=format:%H|%an|%ad|%s", "--date=short", "--follow", file_path]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            
            history = []
            for line in result.stdout.strip().split('\n'):
                if line:
                    parts = line.split('|')
                    if len(parts) >= 4:
                        history.append({
                            'hash': parts[0],
                            'author': parts[1],
                            'date': parts[2],
                            'message': parts[3]
                        })
            return history
        except subprocess.CalledProcessError as e:
            print(f"获取文件历史失败: {e}")
            return []
    
    def get_branch_info(self) -> Dict:
        """获取当前分支信息"""
        try:
            # 获取当前分支
            cmd = ["git", "-C", self.repo_path, "branch", "--show-current"]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            current_branch = result.stdout.strip()
            
            # 获取远程分支信息
            cmd = ["git", "-C", self.repo_path, "branch", "-r"]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            remote_branches = [line.strip() for line in result.stdout.strip().split('\n') if line.strip()]
            
            return {
                'current_branch': current_branch,
                'remote_branches': remote_branches
            }
        except subprocess.CalledProcessError as e:
            print(f"获取分支信息失败: {e}")
            return {'current_branch': 'unknown', 'remote_branches': []}
    
    def get_staged_changes(self) -> str:
        """获取暂存区的变更"""
        try:
            cmd = ["git", "-C", self.repo_path, "diff", "--cached"]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            return result.stdout
        except subprocess.CalledProcessError as e:
            print(f"获取暂存区变更失败: {e}")
            return ""
    
    def get_working_directory_changes(self) -> str:
        """获取工作目录的变更"""
        try:
            cmd = ["git", "-C", self.repo_path, "diff"]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            return result.stdout
        except subprocess.CalledProcessError as e:
            print(f"获取工作目录变更失败: {e}")
            return ""

class MATLABGraphRAGAnalyzer:
    """使用GraphRAG工作流的MATLAB代码影响分析器"""
    
    def __init__(self, repo_path: str = "."):
        # Neo4j 连接配置
        self.driver = GraphDatabase.driver("bolt://localhost:7687", auth=("neo4j", "kotei$88"))
        
        # Git集成
        self.git = GitIntegration(repo_path)
        
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
            system_instructions="""你是一个MATLAB代码影响范围分析专家。你需要分析Git变更对MATLAB代码的影响范围。

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
        
        # 创建查询模板
        self.query_templates = {
            'variable_impact': [
                "分析变量 {var_name} 在MATLAB代码中的使用情况和影响范围",
                "查找所有使用变量 {var_name} 的函数和脚本",
                "分析变量 {var_name} 变更可能影响的其他代码元素"
            ],
            'function_impact': [
                "分析函数 {func_name} 的实现和调用关系",
                "查找所有调用函数 {func_name} 的代码",
                "分析函数 {func_name} 变更的影响范围"
            ],
            'script_impact': [
                "分析脚本 {script_name} 中的函数和变量",
                "查找依赖脚本 {script_name} 的其他代码",
                "分析脚本 {script_name} 变更的潜在影响"
            ]
        }
    
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
            return "MATLAB代码关系图包含Variable、Function、Script节点和RELATES_TO、IMPLEMENTED_IN关系"
    
    def parse_git_changes(self, git_diff_output: str) -> Dict[str, List[str]]:
        """解析 Git diff 输出，识别MATLAB代码变更"""
        changes = {
            'modified_files': [],
            'added_files': [],
            'deleted_files': [],
            'changed_variables': [],
            'changed_functions': [],
            'changed_scripts': []
        }
        
        lines = git_diff_output.split('\n')
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
    
    def generate_impact_queries(self, changes: Dict[str, List[str]]) -> List[str]:
        """根据Git变更生成GraphRAG查询"""
        queries = []
        
        # 为变量变更生成查询
        for var_name in changes['changed_variables']:
            for template in self.query_templates['variable_impact']:
                query = template.format(var_name=var_name)
                queries.append(query)
        
        # 为函数变更生成查询
        for func_name in changes['changed_functions']:
            for template in self.query_templates['function_impact']:
                query = template.format(func_name=func_name)
                queries.append(query)
        
        # 为脚本变更生成查询
        for script_name in changes['changed_scripts']:
            for template in self.query_templates['script_impact']:
                query = template.format(script_name=script_name)
                queries.append(query)
        
        return queries
    
    def analyze_with_graphrag(self, query: str, return_context: bool = True) -> Dict[str, Any]:
        """使用GraphRAG进行影响分析"""
        try:
            result = self.graphrag.search(
                query_text=query,
                return_context=return_context
            )
            
            return {
                'success': True,
                'answer': result.answer,
                'context': result.retriever_result if return_context else None,
                'query': query
            }
        except Exception as e:
            return {
                'success': False,
                'error': str(e),
                'query': query
            }
    
    def analyze_git_changes(self, git_diff_output: str) -> Dict[str, Any]:
        """分析Git变更的影响范围"""
        print("=== 使用GraphRAG分析Git变更影响范围 ===")
        print(f"分析时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        
        # 1. 解析Git变更
        print("\n1. 解析Git变更...")
        changes = self.parse_git_changes(git_diff_output)
        print(f"变更文件: {len(changes['modified_files'])} 个")
        print(f"变更变量: {len(changes['changed_variables'])} 个")
        print(f"变更函数: {len(changes['changed_functions'])} 个")
        
        # 2. 生成查询
        print("\n2. 生成GraphRAG查询...")
        queries = self.generate_impact_queries(changes)
        print(f"生成 {len(queries)} 个查询")
        
        # 3. 使用GraphRAG进行分析
        print("\n3. 使用GraphRAG进行智能分析...")
        analysis_results = []
        
        for i, query in enumerate(queries, 1):
            print(f"分析查询 {i}/{len(queries)}: {query[:50]}...")
            result = self.analyze_with_graphrag(query)
            analysis_results.append(result)
        
        # 4. 生成综合报告
        print("\n4. 生成综合影响分析报告...")
        comprehensive_query = f"""
        基于以下Git变更信息，请提供综合的影响范围分析报告：
        
        变更文件: {changes['modified_files']}
        变更变量: {changes['changed_variables']}
        变更函数: {changes['changed_functions']}
        变更脚本: {changes['changed_scripts']}
        
        请分析这些变更对MATLAB代码库的整体影响，包括风险评估和测试建议。
        """
        
        comprehensive_result = self.analyze_with_graphrag(comprehensive_query)
        
        return {
            'changes': changes,
            'queries': queries,
            'analysis_results': analysis_results,
            'comprehensive_analysis': comprehensive_result
        }
    
    def analyze_recent_commits(self, commit_count: int = 5) -> Dict[str, Any]:
        """分析最近的提交"""
        print(f"分析最近 {commit_count} 个提交...")
        
        commits = self.git.get_recent_commits(commit_count)
        all_analyses = []
        
        for i, commit in enumerate(commits):
            print(f"分析提交 {i+1}/{len(commits)}: {commit['hash'][:8]} - {commit['message']}")
            
            # 获取提交差异
            diff = self.git.get_commit_diff(commit['hash'])
            if diff:
                analysis = self.analyze_git_changes(diff)
                analysis['commit_info'] = commit
                all_analyses.append(analysis)
        
        return {
            'commits': commits,
            'analyses': all_analyses
        }
    
    def analyze_staged_changes(self) -> Dict[str, Any]:
        """分析暂存区的变更"""
        print("分析暂存区变更...")
        
        diff = self.git.get_staged_changes()
        if diff:
            analysis = self.analyze_git_changes(diff)
            analysis['change_type'] = 'staged'
            return analysis
        else:
            return {'change_type': 'staged', 'changes': {'modified_files': []}}
    
    def analyze_working_directory_changes(self) -> Dict[str, Any]:
        """分析工作目录的变更"""
        print("分析工作目录变更...")
        
        diff = self.git.get_working_directory_changes()
        if diff:
            analysis = self.analyze_git_changes(diff)
            analysis['change_type'] = 'working_directory'
            return analysis
        else:
            return {'change_type': 'working_directory', 'changes': {'modified_files': []}}
    
    def save_analysis_report(self, analysis_results: Dict[str, Any], filename: str = 'graphrag_impact_report.md'):
        """保存分析报告"""
        with open(filename, 'w', encoding='utf-8') as f:
            f.write("# MATLAB代码 GraphRAG 影响范围分析报告\n\n")
            f.write(f"**生成时间**: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
            f.write("---\n\n")
            
            # 写入变更信息
            if 'changes' in analysis_results:
                changes = analysis_results['changes']
                f.write("## 变更概述\n\n")
                f.write(f"- 修改文件: {len(changes['modified_files'])} 个\n")
                f.write(f"- 变更变量: {len(changes['changed_variables'])} 个\n")
                f.write(f"- 变更函数: {len(changes['changed_functions'])} 个\n")
                f.write(f"- 变更脚本: {len(changes['changed_scripts'])} 个\n\n")
            
            # 写入综合分析结果
            if 'comprehensive_analysis' in analysis_results:
                comp_analysis = analysis_results['comprehensive_analysis']
                f.write("## 综合分析\n\n")
                if comp_analysis['success']:
                    f.write(comp_analysis['answer'])
                else:
                    f.write(f"分析失败: {comp_analysis['error']}")
                f.write("\n\n")
            
            # 写入详细分析结果
            if 'analysis_results' in analysis_results:
                f.write("## 详细分析\n\n")
                for i, result in enumerate(analysis_results['analysis_results'], 1):
                    f.write(f"### 查询 {i}\n\n")
                    f.write(f"**查询**: {result['query']}\n\n")
                    if result['success']:
                        f.write(f"**分析结果**:\n{result['answer']}\n\n")
                    else:
                        f.write(f"**错误**: {result['error']}\n\n")
                    f.write("---\n\n")
        
        print(f"分析报告已保存到: {filename}")
    
    def close(self):
        """关闭数据库连接"""
        self.driver.close()

def main():
    print("=== MATLAB代码 GraphRAG 影响范围分析系统 ===")
    
    # 创建分析器
    analyzer = MATLABGraphRAGAnalyzer()
    
    # 获取Git信息
    print("\n获取Git仓库信息...")
    branch_info = analyzer.git.get_branch_info()
    print(f"当前分支: {branch_info['current_branch']}")
    print(f"远程分支数量: {len(branch_info['remote_branches'])}")
    
    # 分析暂存区变更
    print("\n分析暂存区变更...")
    staged_analysis = analyzer.analyze_staged_changes()
    
    # 分析工作目录变更
    print("\n分析工作目录变更...")
    working_analysis = analyzer.analyze_working_directory_changes()
    
    # 如果有变更，进行影响分析
    if (staged_analysis['changes']['modified_files'] or 
        working_analysis['changes']['modified_files']):
        print("\n发现变更，进行GraphRAG影响分析...")
        
        # 合并变更
        all_changes = {
            'modified_files': (staged_analysis['changes']['modified_files'] + 
                              working_analysis['changes']['modified_files']),
            'changed_variables': (staged_analysis['changes']['changed_variables'] + 
                                 working_analysis['changes']['changed_variables']),
            'changed_functions': (staged_analysis['changes']['changed_functions'] + 
                                 working_analysis['changes']['changed_functions']),
            'changed_scripts': (staged_analysis['changes']['changed_scripts'] + 
                               working_analysis['changes']['changed_scripts'])
        }
        
        # 创建合并的Git diff用于分析
        combined_diff = f"""
        修改文件: {all_changes['modified_files']}
        变更变量: {all_changes['changed_variables']}
        变更函数: {all_changes['changed_functions']}
        变更脚本: {all_changes['changed_scripts']}
        """
        
        # 使用GraphRAG进行分析
        analysis_result = analyzer.analyze_git_changes(combined_diff)
        
        # 保存报告
        analyzer.save_analysis_report(analysis_result, 'graphrag_impact_report.md')
        
        print("\n分析完成！")
        print(f"变更文件: {len(all_changes['modified_files'])} 个")
        print(f"变更变量: {len(all_changes['changed_variables'])} 个")
        print(f"变更函数: {len(all_changes['changed_functions'])} 个")
        print(f"生成查询: {len(analysis_result['queries'])} 个")
        print(f"成功分析: {sum(1 for r in analysis_result['analysis_results'] if r['success'])} 个")
    else:
        print("\n未发现MATLAB文件变更")
    
    # 关闭连接
    analyzer.close()

if __name__ == "__main__":
    main() 