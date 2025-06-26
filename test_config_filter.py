#!/usr/bin/env python3
"""
测试配置文件过滤功能
"""

import asyncio
import sys
import os

# 添加项目根目录到Python路径
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from extensions.pipelines.code_change_analyzer import CodeChangeAnalyzer

async def test_config_filter():
    """测试配置文件过滤功能"""
    print("🧪 测试配置文件过滤功能")
    print("=" * 50)
    
    # 创建分析器实例
    analyzer = CodeChangeAnalyzer()
    
    # 模拟包含配置文件的变更列表
    test_changes = [
        {
            'file_path': 'src/main.py',
            'status': 'modified',
            'additions': 10,
            'deletions': 5,
            'changes': 15
        },
        {
            'file_path': '.gitignore',
            'status': 'added',
            'additions': 3,
            'deletions': 0,
            'changes': 3
        },
        {
            'file_path': 'package.json',
            'status': 'modified',
            'additions': 2,
            'deletions': 1,
            'changes': 3
        },
        {
            'file_path': 'src/utils/helper.py',
            'status': 'modified',
            'additions': 20,
            'deletions': 10,
            'changes': 30
        },
        {
            'file_path': 'README.md',
            'status': 'modified',
            'additions': 5,
            'deletions': 2,
            'changes': 7
        },
        {
            'file_path': 'docs/api.md',
            'status': 'added',
            'additions': 50,
            'deletions': 0,
            'changes': 50
        }
    ]
    
    print(f"📋 原始变更文件数: {len(test_changes)}")
    for i, change in enumerate(test_changes, 1):
        print(f"  {i}. {change['file_path']} ({change['status']})")
    
    print("\n🔍 应用配置文件过滤...")
    
    # 调用过滤方法
    filtered_changes = analyzer._filter_config_files(test_changes)
    
    print(f"\n✅ 过滤后变更文件数: {len(filtered_changes)}")
    for i, change in enumerate(filtered_changes, 1):
        print(f"  {i}. {change['file_path']} ({change['status']})")
    
    # 统计被过滤的文件
    ignored_count = len(test_changes) - len(filtered_changes)
    print(f"\n📊 过滤统计:")
    print(f"  - 被过滤的配置文件: {ignored_count} 个")
    print(f"  - 保留的代码文件: {len(filtered_changes)} 个")
    
    # 验证过滤结果
    expected_ignored = ['.gitignore', 'package.json', 'README.md', 'docs/api.md']
    expected_kept = ['src/main.py', 'src/utils/helper.py']
    
    print(f"\n🔍 验证过滤结果:")
    
    # 检查被过滤的文件
    for file_path in expected_ignored:
        if any(change['file_path'] == file_path for change in filtered_changes):
            print(f"  ❌ 错误: {file_path} 应该被过滤但被保留了")
        else:
            print(f"  ✅ 正确: {file_path} 被正确过滤")
    
    # 检查保留的文件
    for file_path in expected_kept:
        if any(change['file_path'] == file_path for change in filtered_changes):
            print(f"  ✅ 正确: {file_path} 被正确保留")
        else:
            print(f"  ❌ 错误: {file_path} 应该被保留但被过滤了")
    
    print(f"\n🎯 测试完成!")

def main():
    """主函数"""
    asyncio.run(test_config_filter())

if __name__ == "__main__":
    main() 