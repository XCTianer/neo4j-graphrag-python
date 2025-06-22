#!/usr/bin/env python3
"""
GraphRAG版本分析器测试脚本
验证GraphRAG工作流的功能
"""

import os
import sys
from matlab_graphrag_analyzer import MATLABGraphRAGAnalyzer, GitIntegration

def test_graphrag_components():
    """测试GraphRAG核心组件"""
    print("=== 测试GraphRAG核心组件 ===")
    
    try:
        # 创建分析器
        analyzer = MATLABGraphRAGAnalyzer()
        
        # 测试1: 检查组件初始化
        print("\n1. 检查组件初始化...")
        print(f"   LLM: {type(analyzer.llm).__name__}")
        print(f"   检索器: {type(analyzer.retriever).__name__}")
        print(f"   GraphRAG: {type(analyzer.graphrag).__name__}")
        print(f"   提示模板: {type(analyzer.impact_analysis_template).__name__}")
        
        # 测试2: 检查数据库模式
        print("\n2. 检查数据库模式...")
        print(f"   模式长度: {len(analyzer.schema)} 字符")
        print(f"   模式预览: {analyzer.schema[:200]}...")
        
        # 测试3: 检查查询模板
        print("\n3. 检查查询模板...")
        for query_type, templates in analyzer.query_templates.items():
            print(f"   {query_type}: {len(templates)} 个模板")
        
        # 测试4: 测试简单的GraphRAG查询
        print("\n4. 测试简单GraphRAG查询...")
        test_query = "查找MATLAB代码中的变量和函数"
        result = analyzer.analyze_with_graphrag(test_query, return_context=False)
        
        if result['success']:
            print(f"   查询成功，回答长度: {len(result['answer'])} 字符")
            print(f"   回答预览: {result['answer'][:100]}...")
        else:
            print(f"   查询失败: {result['error']}")
        
        # 关闭连接
        analyzer.close()
        
        print("\n=== GraphRAG组件测试完成 ===")
        return True
        
    except Exception as e:
        print(f"GraphRAG组件测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_git_integration():
    """测试Git集成功能"""
    print("\n=== 测试Git集成功能 ===")
    
    # 检查是否在Git仓库中
    if not os.path.exists('.git'):
        print("警告: 当前目录不是Git仓库")
        print("Git集成功能可能无法正常工作")
        return False
    
    try:
        git = GitIntegration()
        
        # 测试1: 获取分支信息
        print("\n1. 测试获取分支信息...")
        branch_info = git.get_branch_info()
        print(f"   当前分支: {branch_info['current_branch']}")
        print(f"   远程分支数量: {len(branch_info['remote_branches'])}")
        
        # 测试2: 获取最近提交
        print("\n2. 测试获取最近提交...")
        commits = git.get_recent_commits(3)
        print(f"   获取到 {len(commits)} 个提交")
        for i, commit in enumerate(commits[:2], 1):
            print(f"   {i}. {commit['hash'][:8]} - {commit['message']}")
        
        # 测试3: 获取暂存区变更
        print("\n3. 测试获取暂存区变更...")
        staged_diff = git.get_staged_changes()
        if staged_diff:
            print("   发现暂存区变更")
        else:
            print("   暂存区无变更")
        
        # 测试4: 获取工作目录变更
        print("\n4. 测试获取工作目录变更...")
        working_diff = git.get_working_directory_changes()
        if working_diff:
            print("   发现工作目录变更")
        else:
            print("   工作目录无变更")
        
        print("\n=== Git集成功能测试完成 ===")
        return True
        
    except Exception as e:
        print(f"Git集成功能测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_impact_analysis():
    """测试影响分析功能"""
    print("\n=== 测试影响分析功能 ===")
    
    try:
        analyzer = MATLABGraphRAGAnalyzer()
        
        # 创建测试Git diff
        test_git_diff = """
diff --git a/test_calculator.m b/test_calculator.m
index 1234567..abcdefg 100644
--- a/test_calculator.m
+++ b/test_calculator.m
@@ -5,7 +5,7 @@ function result = calculate(x, y)
-    result = x + y;
+    result = x * y;  % 修改计算逻辑
@@ -10,6 +10,7 @@ function result = calculate(x, y)
+    % 添加新的变量
+    multiplier = 2;
+    result = result * multiplier;
"""
        
        # 测试1: 解析Git变更
        print("\n1. 测试解析Git变更...")
        changes = analyzer.parse_git_changes(test_git_diff)
        print(f"   修改文件: {len(changes['modified_files'])} 个")
        print(f"   变更变量: {len(changes['changed_variables'])} 个")
        print(f"   变更函数: {len(changes['changed_functions'])} 个")
        
        # 测试2: 生成影响查询
        print("\n2. 测试生成影响查询...")
        queries = analyzer.generate_impact_queries(changes)
        print(f"   生成 {len(queries)} 个查询")
        for i, query in enumerate(queries[:2], 1):
            print(f"   {i}. {query[:50]}...")
        
        # 测试3: 使用GraphRAG进行分析
        print("\n3. 测试GraphRAG分析...")
        if queries:
            # 测试第一个查询
            test_query = queries[0]
            result = analyzer.analyze_with_graphrag(test_query, return_context=False)
            
            if result['success']:
                print(f"   分析成功，回答长度: {len(result['answer'])} 字符")
                print(f"   回答预览: {result['answer'][:100]}...")
            else:
                print(f"   分析失败: {result['error']}")
        
        # 关闭连接
        analyzer.close()
        
        print("\n=== 影响分析功能测试完成 ===")
        return True
        
    except Exception as e:
        print(f"影响分析功能测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_full_workflow():
    """测试完整工作流程"""
    print("\n=== 测试完整工作流程 ===")
    
    try:
        analyzer = MATLABGraphRAGAnalyzer()
        
        # 测试暂存区变更分析
        print("\n1. 测试暂存区变更分析...")
        staged_analysis = analyzer.analyze_staged_changes()
        print(f"   分析类型: {staged_analysis.get('change_type', 'unknown')}")
        
        # 测试工作目录变更分析
        print("\n2. 测试工作目录变更分析...")
        working_analysis = analyzer.analyze_working_directory_changes()
        print(f"   分析类型: {working_analysis.get('change_type', 'unknown')}")
        
        # 如果有变更，进行完整分析
        if (staged_analysis['changes']['modified_files'] or 
            working_analysis['changes']['modified_files']):
            print("\n3. 发现变更，进行完整GraphRAG分析...")
            
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
            
            # 创建合并的Git diff
            combined_diff = f"""
            修改文件: {all_changes['modified_files']}
            变更变量: {all_changes['changed_variables']}
            变更函数: {all_changes['changed_functions']}
            变更脚本: {all_changes['changed_scripts']}
            """
            
            # 使用GraphRAG进行分析
            analysis_result = analyzer.analyze_git_changes(combined_diff)
            
            print(f"   生成查询: {len(analysis_result['queries'])} 个")
            print(f"   成功分析: {sum(1 for r in analysis_result['analysis_results'] if r['success'])} 个")
            
            # 保存测试报告
            analyzer.save_analysis_report(analysis_result, 'test_graphrag_report.md')
            print("   测试报告已保存到: test_graphrag_report.md")
        else:
            print("\n3. 无变更，跳过完整分析")
        
        # 关闭连接
        analyzer.close()
        
        print("\n=== 完整工作流程测试完成 ===")
        return True
        
    except Exception as e:
        print(f"完整工作流程测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def main():
    """主测试函数"""
    print("GraphRAG版本分析器测试脚本")
    print("=" * 60)
    
    # 检查环境
    print("检查环境...")
    if not os.path.exists('.git'):
        print("警告: 当前目录不是Git仓库")
        print("Git相关功能可能无法正常工作")
    
    # 运行测试
    test_results = []
    
    # 测试GraphRAG组件
    test_results.append(("GraphRAG组件", test_graphrag_components()))
    
    # 测试Git集成
    test_results.append(("Git集成", test_git_integration()))
    
    # 测试影响分析
    test_results.append(("影响分析", test_impact_analysis()))
    
    # 测试完整工作流程
    test_results.append(("完整工作流程", test_full_workflow()))
    
    # 输出测试结果
    print("\n" + "=" * 60)
    print("测试结果总结:")
    for test_name, result in test_results:
        status = "✅ 通过" if result else "❌ 失败"
        print(f"{test_name}: {status}")
    
    passed_tests = sum(1 for _, result in test_results if result)
    total_tests = len(test_results)
    
    print(f"\n总体结果: {passed_tests}/{total_tests} 个测试通过")
    
    if passed_tests == total_tests:
        print("\n🎉 所有测试通过！GraphRAG版本工作正常。")
        print("\n接下来您可以:")
        print("1. 运行 python matlab_graphrag_analyzer.py 进行实际分析")
        print("2. 查看生成的测试报告: test_graphrag_report.md")
        print("3. 使用自定义查询进行深度分析")
    else:
        print("\n⚠️  部分测试失败，请检查:")
        print("1. Neo4j是否正在运行")
        print("2. Ollama是否正在运行")
        print("3. 网络连接是否正常")
        print("4. 依赖包是否正确安装")

if __name__ == "__main__":
    main() 