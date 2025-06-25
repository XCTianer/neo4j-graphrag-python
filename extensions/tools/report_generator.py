"""
Report generator for code change impact analysis.
"""

import os
import json
import logging
from datetime import datetime
from typing import Dict, List, Any
from pathlib import Path

logger = logging.getLogger(__name__)


class ReportGenerator:
    """Generate analysis reports and Neo4j query files."""
    
    def __init__(self):
        """Initialize the report generator."""
        pass
    
    async def generate_analysis_report(
        self, 
        comprehensive_analysis: Dict, 
        output_path: str
    ) -> None:
        """
        Generate comprehensive analysis report in Markdown format.
        
        Args:
            comprehensive_analysis: Comprehensive analysis results
            output_path: Output file path
        """
        try:
            content = self._generate_markdown_report(comprehensive_analysis)
            
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write(content)
            
            logger.info(f"Analysis report generated: {output_path}")
            
        except Exception as e:
            logger.error(f"Error generating analysis report: {e}")
            raise
    
    async def generate_queries_file(
        self, 
        comprehensive_analysis: Dict, 
        output_path: str
    ) -> None:
        """
        Generate Neo4j queries file in Cypher format.
        
        Args:
            comprehensive_analysis: Comprehensive analysis results
            output_path: Output file path
        """
        try:
            content = self._generate_cypher_queries(comprehensive_analysis)
            
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write(content)
            
            logger.info(f"Queries file generated: {output_path}")
            
        except Exception as e:
            logger.error(f"Error generating queries file: {e}")
            raise
    
    async def generate_neo4j_links(
        self, 
        comprehensive_analysis: Dict, 
        output_path: str,
        neo4j_uri: str
    ) -> None:
        """
        Generate Neo4j links file with clickable query links.
        
        Args:
            comprehensive_analysis: Comprehensive analysis results
            output_path: Output file path
            neo4j_uri: Neo4j database URI
        """
        try:
            content = self._generate_neo4j_links_content(
                comprehensive_analysis, 
                neo4j_uri
            )
            
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write(content)
            
            logger.info(f"Neo4j links file generated: {output_path}")
            
        except Exception as e:
            logger.error(f"Error generating Neo4j links file: {e}")
            raise
    
    def _generate_markdown_report(self, analysis: Dict) -> str:
        """Generate Markdown report content."""
        repo_info = analysis.get('repository_info', {})
        analysis_period = analysis.get('analysis_period', {})
        aggregated_impact = analysis.get('aggregated_impact', {})
        commit_details = analysis.get('commit_details', [])
        
        content = f"""# 代码变更记录影响范围分析报告

## 仓库信息

- **仓库名称**: {repo_info.get('name', 'N/A')}
- **仓库地址**: {repo_info.get('url', 'N/A')}
- **本地路径**: {repo_info.get('local_path', 'N/A')}
- **最后更新**: {repo_info.get('last_updated', 'N/A')}

## 分析周期

- **分析时间**: {analysis_period.get('analysis_timestamp', 'N/A')}
- **提交数量**: {analysis_period.get('total_commits', 0)}
- **变更文件数**: {analysis_period.get('total_files_changed', 0)}

## 总体影响分析

### 影响范围统计

- **受影响函数**: {aggregated_impact.get('total_affected_functions', 0)}
- **受影响变量**: {aggregated_impact.get('total_affected_variables', 0)}
- **受影响脚本**: {aggregated_impact.get('total_affected_scripts', 0)}

### 风险等级评估

{self._generate_risk_assessment(analysis)}

## 详细提交分析

"""
        
        # Add commit details
        for i, commit_detail in enumerate(commit_details, 1):
            content += self._generate_commit_section(commit_detail, i)
        
        # Add dependency chains
        dependency_chains = analysis.get('dependency_chains', [])
        if dependency_chains:
            content += self._generate_dependency_chains_section(dependency_chains)
        
        # Add recommendations
        content += self._generate_recommendations_section(analysis)
        
        return content
    
    def _generate_risk_assessment(self, analysis: Dict) -> str:
        """Generate risk assessment section."""
        commit_details = analysis.get('commit_details', [])
        
        high_risk_commits = 0
        medium_risk_commits = 0
        low_risk_commits = 0
        
        for commit_detail in commit_details:
            impact = commit_detail.get('impact_analysis', {})
            summary = impact.get('summary', {})
            risk_level = summary.get('risk_level', 'LOW')
            
            if risk_level == 'HIGH':
                high_risk_commits += 1
            elif risk_level == 'MEDIUM':
                medium_risk_commits += 1
            else:
                low_risk_commits += 1
        
        total_commits = len(commit_details)
        
        return f"""
#### 风险分布

- **高风险提交**: {high_risk_commits} ({(high_risk_commits/total_commits*100) if total_commits > 0 else 0:.1f}%)
- **中风险提交**: {medium_risk_commits} ({(medium_risk_commits/total_commits*100) if total_commits > 0 else 0:.1f}%)
- **低风险提交**: {low_risk_commits} ({(low_risk_commits/total_commits*100) if total_commits > 0 else 0:.1f}%)

#### 总体风险评估

{self._get_overall_risk_level(high_risk_commits, medium_risk_commits, total_commits)}
"""
    
    def _get_overall_risk_level(self, high: int, medium: int, total: int) -> str:
        """Get overall risk level."""
        if total == 0:
            return "**风险等级**: 无数据"
        
        high_percentage = high / total * 100
        medium_percentage = medium / total * 100
        
        if high_percentage > 30:
            return "**风险等级**: 🔴 高风险 - 建议立即审查"
        elif high_percentage > 15 or medium_percentage > 50:
            return "**风险等级**: 🟡 中风险 - 建议重点关注"
        else:
            return "**风险等级**: 🟢 低风险 - 正常变更"
    
    def _generate_commit_section(self, commit_detail: Dict, index: int) -> str:
        """Generate commit analysis section."""
        commit = commit_detail.get('commit', {})
        impact = commit_detail.get('impact_analysis', {})
        summary = impact.get('summary', {})
        
        content = f"""### 提交 {index}: {commit.get('message', 'N/A')}

#### 提交信息

- **提交哈希**: `{commit.get('hash', 'N/A')}`
- **作者**: {commit.get('author_name', 'N/A')} ({commit.get('author_email', 'N/A')})
- **提交时间**: {commit.get('date', 'N/A')}
- **风险等级**: {summary.get('risk_level', 'N/A')}
- **影响范围**: {summary.get('impact_scope', 'N/A')}

#### 变更统计

- **变更文件数**: {summary.get('total_files_changed', 0)}
- **受影响函数**: {summary.get('affected_functions', 0)}
- **受影响变量**: {summary.get('affected_variables', 0)}
- **受影响脚本**: {summary.get('affected_scripts', 0)}

#### 变更文件列表

"""
        
        changes = commit_detail.get('changes', [])
        for change in changes:
            content += f"- **{change.get('status', 'N/A')}**: {change.get('file_path', 'N/A')}\n"
        
        content += "\n#### 影响分析\n\n"
        
        # Add affected functions
        affected_functions = impact.get('affected_functions', [])
        if affected_functions:
            content += "**受影响的函数**:\n"
            for func in affected_functions:
                content += f"- {func.get('name', 'N/A')} (文件: {func.get('file_path', 'N/A')})\n"
            content += "\n"
        
        # Add affected variables
        affected_variables = impact.get('affected_variables', [])
        if affected_variables:
            content += "**受影响的变量**:\n"
            for var in affected_variables:
                content += f"- {var.get('name', 'N/A')} (作用域: {var.get('scope_id', 'N/A')})\n"
            content += "\n"
        
        # Add affected scripts
        affected_scripts = impact.get('affected_scripts', [])
        if affected_scripts:
            content += "**受影响的脚本**:\n"
            for script in affected_scripts:
                content += f"- {script.get('name', 'N/A')} (文件: {script.get('file_path', 'N/A')})\n"
            content += "\n"
        
        return content
    
    def _generate_dependency_chains_section(self, dependency_chains: List[Dict]) -> str:
        """Generate dependency chains section."""
        content = """## 依赖链分析

### 影响链路

"""
        
        for i, chain in enumerate(dependency_chains, 1):
            content += f"""#### 依赖链 {i}

- **链路ID**: {chain.get('chain_id', 'N/A')}
- **影响路径**: {chain.get('impact_path', 'N/A')}
- **严重程度**: {chain.get('severity', 'N/A')}
- **组件数量**: {len(chain.get('components', []))}

**包含组件**:
"""
            
            components = chain.get('components', [])
            for component in components:
                content += f"- {component.get('name', 'N/A')} ({component.get('type', 'N/A')})\n"
            
            content += "\n"
        
        return content
    
    def _generate_recommendations_section(self, analysis: Dict) -> str:
        """Generate recommendations section."""
        return """## 建议和后续行动

### 代码审查建议

1. **高风险提交**: 建议优先审查高风险提交，重点关注影响范围较大的变更
2. **依赖链分析**: 使用提供的Neo4j查询语句深入分析依赖关系
3. **测试覆盖**: 确保受影响的组件有充分的测试覆盖
4. **文档更新**: 更新相关文档以反映代码变更

### 监控建议

1. **持续监控**: 定期运行影响分析以监控代码变更趋势
2. **自动化**: 将影响分析集成到CI/CD流程中
3. **告警机制**: 为高风险变更设置告警机制

### 工具使用

- 使用提供的Neo4j查询语句进行深入分析
- 利用Neo4j浏览器可视化依赖关系
- 结合其他代码质量工具进行综合分析

---
*报告生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}*
"""
    
    def _generate_cypher_queries(self, analysis: Dict) -> str:
        """Generate Cypher queries file content."""
        content = f"""-- 代码变更影响链路查询语句
-- 生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
-- 仓库: {analysis.get('repository_info', {}).get('name', 'N/A')}

"""
        
        # 找到最完整的影响链（包含脚本、函数、变量）
        dependency_chains = analysis.get('dependency_chains', [])
        most_complete_chains = self._find_most_complete_chains(dependency_chains)
        
        content += """-- ========================================
-- 最完整的影响链路分析
-- ========================================

"""
        
        for i, chain in enumerate(most_complete_chains, 1):
            content += f"""-- 最完整链路 {i}: {chain.get('source_entity', 'unknown')} → {chain.get('target_entity', 'unknown')}
-- 链路ID: {chain.get('chain_id', 'unknown')}
-- 严重程度: {chain.get('severity', 'unknown')}
-- 链路类型: {chain.get('chain_type', 'unknown')}
-- 路径长度: {chain.get('path_length', 0)}

"""
            
            # 分析链路上的组件类型
            path_nodes = chain.get('path_nodes', [])
            scripts = [node for node in path_nodes if node.get('node_type') == 'Script']
            functions = [node for node in path_nodes if node.get('node_type') == 'Function']
            variables = [node for node in path_nodes if node.get('node_type') == 'Variable']
            
            content += f"""-- 链路组件统计:
--   - 脚本: {len(scripts)} 个
--   - 函数: {len(functions)} 个
--   - 变量: {len(variables)} 个
--   - 总计: {len(path_nodes)} 个组件

-- 链路组件详情:
"""
            
            # 显示链路上的所有组件
            for j, node in enumerate(path_nodes, 1):
                node_type = node.get('node_type', 'Unknown')
                node_name = node.get('name', 'unknown')
                file_path = node.get('file_path', '')
                
                content += f"--   {j}. {node_type}: {node_name}"
                if file_path:
                    content += f" (文件: {file_path})"
                content += "\n"
            
            content += "\n"
            
            # 生成查询特定链路的Cypher语句
            if len(path_nodes) >= 2:
                source_node_id = path_nodes[0].get('node_id')
                target_node_id = path_nodes[-1].get('node_id')
                
                # 计算合理的路径长度上限（基于实际路径长度，但不超过20）
                max_path_length = min(len(path_nodes) + 5, 20)
                
                content += f"""-- 1. 查询完整链路路径
MATCH path = shortestPath((source)-[*1..{max_path_length}]->(target))
WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'
RETURN path, length(path) as path_length;

-- 2. 查询链路上的所有节点（按类型分组）
MATCH path = shortestPath((source)-[*1..{max_path_length}]->(target))
WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
RETURN labels(node)[0] as node_type, node.name as node_name, node.file_path as file_path
ORDER BY node_type, node_name;

-- 3. 查询链路上的脚本组件
MATCH path = shortestPath((source)-[*1..{max_path_length}]->(target))
WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Script' IN labels(node)
RETURN node.name as script_name, node.file_path as file_path, properties(node) as properties;

-- 4. 查询链路上的函数组件
MATCH path = shortestPath((source)-[*1..{max_path_length}]->(target))
WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Function' IN labels(node)
RETURN node.name as function_name, node.file_path as file_path, node.line_range as line_range;

-- 5. 查询链路上的变量组件
MATCH path = shortestPath((source)-[*1..{max_path_length}]->(target))
WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Variable' IN labels(node)
RETURN node.name as variable_name, node.file_path as file_path, node.line_range as line_range;

-- 6. 查询链路上的所有关系
MATCH path = shortestPath((source)-[*1..{max_path_length}]->(target))
WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'
RETURN relationships(path) as path_relationships;

-- 7. 查询链路关系详情
MATCH path = shortestPath((source)-[*1..{max_path_length}]->(target))
WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'
WITH relationships(path) as path_rels
UNWIND path_rels as rel
RETURN type(rel) as relationship_type, startNode(rel).name as source_name, endNode(rel).name as target_name;

"""
            
            content += "-- " + "="*60 + "\n\n"
        
        # 生成其他链路的查询语句
        content += """-- ========================================
-- 其他影响链路查询
-- ========================================

"""
        
        for i, chain in enumerate(dependency_chains, 1):
            if chain not in most_complete_chains:  # 跳过已经处理的最完整链路
                content += f"""-- 链路 {i}: {chain.get('source_entity', 'unknown')} → {chain.get('target_entity', 'unknown')}
-- 链路ID: {chain.get('chain_id', 'unknown')}
-- 严重程度: {chain.get('severity', 'unknown')}

"""
                
                # 生成查询特定链路的Cypher语句
                path_nodes = chain.get('path_nodes', [])
                if len(path_nodes) >= 2:
                    source_node_id = path_nodes[0].get('node_id')
                    target_node_id = path_nodes[-1].get('node_id')
                    
                    # 计算合理的路径长度上限（基于实际路径长度，但不超过20）
                    max_path_length = min(len(path_nodes) + 5, 20)
                    
                    content += f"""-- 查询链路路径
MATCH path = shortestPath((source)-[*1..{max_path_length}]->(target))
WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'
RETURN path, length(path) as path_length;

"""
                
                content += "-- " + "="*50 + "\n\n"
        
        # 添加通用的影响链查询语句
        content += """-- ========================================
-- 通用影响链查询语句
-- ========================================

-- 查询所有影响链
MATCH (source)-[r*1..5]->(target)
WHERE source <> target
RETURN source.name as source_name, target.name as target_name, length(r) as path_length
ORDER BY path_length DESC
LIMIT 20;

-- 查询包含脚本的影响链
MATCH path = (source)-[r*1..5]->(target)
WHERE source <> target AND ANY(node IN nodes(path) WHERE 'Script' IN labels(node))
RETURN source.name as source_name, target.name as target_name, length(r) as path_length
ORDER BY path_length DESC
LIMIT 10;

-- 查询包含函数的影响链
MATCH path = (source)-[r*1..5]->(target)
WHERE source <> target AND ANY(node IN nodes(path) WHERE 'Function' IN labels(node))
RETURN source.name as source_name, target.name as target_name, length(r) as path_length
ORDER BY path_length DESC
LIMIT 10;

-- 查询包含变量的影响链
MATCH path = (source)-[r*1..5]->(target)
WHERE source <> target AND ANY(node IN nodes(path) WHERE 'Variable' IN labels(node))
RETURN source.name as source_name, target.name as target_name, length(r) as path_length
ORDER BY path_length DESC
LIMIT 10;

"""
        
        return content
    
    def _find_most_complete_chains(self, dependency_chains):
        """Find the most complete impact chains that contain scripts, functions, and variables."""
        if not dependency_chains:
            return []
        
        # 计算每个链路的完整性分数
        chain_scores = []
        for chain in dependency_chains:
            path_nodes = chain.get('path_nodes', [])
            if not path_nodes:
                continue
            
            # 统计不同类型的组件
            scripts = [node for node in path_nodes if node.get('node_type') == 'Script']
            functions = [node for node in path_nodes if node.get('node_type') == 'Function']
            variables = [node for node in path_nodes if node.get('node_type') == 'Variable']
            
            # 计算完整性分数
            # 基础分数：路径长度
            base_score = len(path_nodes)
            
            # 多样性分数：包含不同类型的组件
            diversity_score = 0
            if scripts:
                diversity_score += 3  # 脚本权重最高
            if functions:
                diversity_score += 2  # 函数权重中等
            if variables:
                diversity_score += 1  # 变量权重最低
            
            # 严重程度分数
            severity_score = {"HIGH": 3, "MEDIUM": 2, "LOW": 1}.get(chain.get('severity'), 0)
            
            # 总分数
            total_score = base_score + diversity_score + severity_score
            
            chain_scores.append({
                'chain': chain,
                'score': total_score,
                'scripts': len(scripts),
                'functions': len(functions),
                'variables': len(variables),
                'total_components': len(path_nodes)
            })
        
        # 按分数排序，选择最完整的链路
        chain_scores.sort(key=lambda x: x['score'], reverse=True)
        
        # 返回前3个最完整的链路，或者所有链路（如果少于3个）
        most_complete = []
        for item in chain_scores[:3]:
            most_complete.append(item['chain'])
        
        return most_complete
    
    def _generate_neo4j_links_content(
        self, 
        analysis: Dict, 
        neo4j_uri: str
    ) -> str:
        """Generate Neo4j links content."""
        # Convert neo4j://localhost:7687 to http://localhost:7474
        browser_uri = neo4j_uri.replace('neo4j://', 'http://').replace(':7687', ':7474')
        
        content = f"""# 带查询语句的Neo4j链接

## Neo4j浏览器访问

- **Neo4j浏览器地址**: {browser_uri}
- **用户名**: neo4j
- **密码**: kotei$88

## 快速查询链接

### 1. 查看所有函数

```cypher
MATCH (f:Function) RETURN f LIMIT 100
```

**直接链接**: {browser_uri}/browser/?cmd=play&arg=MATCH%20(f:Function)%20RETURN%20f%20LIMIT%20100

### 2. 查看所有变量

```cypher
MATCH (v:Variable) RETURN v LIMIT 100
```

**直接链接**: {browser_uri}/browser/?cmd=play&arg=MATCH%20(v:Variable)%20RETURN%20v%20LIMIT%20100

### 3. 查看所有脚本

```cypher
MATCH (s:Script) RETURN s LIMIT 100
```

**直接链接**: {browser_uri}/browser/?cmd=play&arg=MATCH%20(s:Script)%20RETURN%20s%20LIMIT%20100

### 4. 查看所有关系

```cypher
MATCH ()-[r]->() RETURN r LIMIT 100
```

**直接链接**: {browser_uri}/browser/?cmd=play&arg=MATCH%20()-[r]->()%20RETURN%20r%20LIMIT%20100

## 提交特定查询

"""
        
        commit_details = analysis.get('commit_details', [])
        
        for commit_detail in commit_details:
            commit = commit_detail.get('commit', {})
            commit_hash = commit.get('hash', '')
            commit_message = commit.get('message', '')
            
            content += f"""### 提交: {commit_hash[:8]} - {commit_message}

"""
            
            queries = commit_detail.get('queries', [])
            for query_info in queries:
                if isinstance(query_info, dict) and 'queries' in query_info:
                    for query_name, query_data in query_info['queries'].items():
                        query = query_data.get('query', '')
                        description = query_data.get('description', 'N/A')
                        
                        # URL encode the query
                        import urllib.parse
                        encoded_query = urllib.parse.quote(query)
                        
                        content += f"""#### {description}

```cypher
{query}
```

**直接链接**: {browser_uri}/browser/?cmd=play&arg={encoded_query}

"""
        
        content += f"""
## 使用说明

1. 点击上述链接直接跳转到Neo4j浏览器
2. 链接会自动执行相应的查询语句
3. 可以在浏览器中修改查询语句进行进一步分析
4. 使用Neo4j浏览器的可视化功能查看图形结果

---
*生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}*
"""
        
        return content 