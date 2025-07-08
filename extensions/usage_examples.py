#!/usr/bin/env python3
"""
GraphRAG 跳过LLM分析的使用示例
"""

import json
from direct_graphrag_analyzer import DirectGraphRAGAnalyzer
from modified_git_analyzer import Neo4jImpactAnalyzer, GitChangeAnalyzer

def example_1_direct_analyzer():
    """示例1：使用DirectGraphRAGAnalyzer直接分析"""
    print("=== 示例1：使用DirectGraphRAGAnalyzer ===")
    
    # 创建直接分析器
    analyzer = DirectGraphRAGAnalyzer()
    
    # 示例查询
    query = "分析变量 config 在整个代码库中的影响范围"
    
    # 执行分析
    result = analyzer.analyze_without_llm(query)
    
    print("分析结果:")
    print(json.dumps(result, ensure_ascii=False, indent=2))
    
    return result

def example_2_modified_analyzer():
    """示例2：使用修改后的Neo4jImpactAnalyzer"""
    print("\n=== 示例2：使用修改后的Neo4jImpactAnalyzer ===")
    
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
    
    print("分析结果:")
    print(json.dumps(results, ensure_ascii=False, indent=2))
    
    return results

def example_3_cypher_only():
    """示例3：仅生成Cypher查询，不执行"""
    print("\n=== 示例3：仅生成Cypher查询 ===")
    
    # 创建直接分析器
    analyzer = DirectGraphRAGAnalyzer()
    
    # 示例查询
    queries = [
        "分析变量 config 的影响范围",
        "分析函数 process_data 的调用关系",
        "分析文件 main.m 的依赖关系"
    ]
    
    for query in queries:
        print(f"\n查询: {query}")
        cypher = analyzer.generate_cypher_only(query)
        print(f"生成的Cypher查询:\n{cypher}")

def example_4_comparison():
    """示例4：对比LLM分析和直接分析的结果"""
    print("\n=== 示例4：对比分析结果 ===")
    
    # 创建两个分析器
    direct_analyzer = DirectGraphRAGAnalyzer()
    llm_analyzer = Neo4jImpactAnalyzer(skip_llm_analysis=False)
    
    # 测试查询
    query = "分析变量 config 的影响范围"
    
    print("直接分析结果:")
    direct_result = direct_analyzer.analyze_without_llm(query)
    print(f"- 查询执行时间: {direct_result.get('query_result', {}).get('execution_time', 'N/A')}")
    print(f"- 返回记录数: {direct_result.get('query_result', {}).get('record_count', 0)}")
    print(f"- 节点类型: {direct_result.get('query_result', {}).get('summary', {}).get('node_types', {})}")
    
    print("\nLLM分析结果:")
    llm_result = llm_analyzer.analyze_with_graphrag(query)
    print(f"- 分析结果类型: {type(llm_result)}")
    print(f"- 是否包含LLM生成内容: {'是' if llm_result and 'raw_result' in llm_result else '否'}")

def example_5_integration_with_mcp():
    """示例5：与MCP工具集成"""
    print("\n=== 示例5：MCP工具集成示例 ===")
    
    # 创建直接分析器
    analyzer = DirectGraphRAGAnalyzer()
    
    # 模拟MCP工具调用
    def mcp_analyze_code_changes(repo_url: str, days: int = 7):
        """MCP工具：分析代码变更"""
        # 这里可以集成Git分析逻辑
        changes = {
            'modified_files': ['src/main.m'],
            'changed_variables': ['config'],
            'changed_functions': ['process_data']
        }
        
        # 使用直接分析器
        results = analyzer.analyze_changes_directly(changes)
        
        return {
            'success': True,
            'data': results,
            'method': 'direct_graphrag_analysis'
        }
    
    # 模拟调用
    result = mcp_analyze_code_changes("https://github.com/example/repo")
    print("MCP工具调用结果:")
    print(json.dumps(result, ensure_ascii=False, indent=2))

def main():
    """主函数"""
    print("GraphRAG 跳过LLM分析的使用示例")
    print("=" * 50)
    
    try:
        # 运行示例
        example_1_direct_analyzer()
        example_2_modified_analyzer()
        example_3_cypher_only()
        example_4_comparison()
        example_5_integration_with_mcp()
        
        print("\n所有示例执行完成！")
        
    except Exception as e:
        print(f"执行示例时出错: {e}")

if __name__ == "__main__":
    main() 