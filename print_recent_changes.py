#!/usr/bin/env python3
"""
打印目标仓库最近5次变更记录
"""

import asyncio
import sys
import os
from datetime import datetime
from extensions.integrations.github_integration import GitHubIntegration

async def print_recent_changes(repo_url: str, commit_count: int = 5):
    """
    打印仓库最近N次变更记录
    
    Args:
        repo_url: 仓库URL
        commit_count: 要显示的提交数量
    """
    print(f"🔍 正在获取仓库 {repo_url} 最近 {commit_count} 次变更记录...")
    print("=" * 80)
    
    try:
        # 初始化GitHub集成
        github_integration = GitHubIntegration(repo_url)
        
        # 获取最近提交
        commits = github_integration.get_recent_commits(days=30, per_page=commit_count, max_commits=commit_count)
        
        if not commits:
            print("❌ 未找到任何提交记录")
            return
        
        print(f"✅ 找到 {len(commits)} 个提交记录\n")
        
        for i, commit in enumerate(commits, 1):
            commit_message = commit['message'].split('\n')[0]
            print(f"📝 提交 {i}: {commit_message}")
            print(f"   哈希: {commit['hash'][:8]}")
            print(f"   作者: {commit['author_name']} ({commit['author_email']})")
            print(f"   时间: {commit['date']}")
            
            # 获取该提交的变更详情
            changes = github_integration.get_commit_changes(commit['hash'])
            
            if changes:
                print(f"   变更文件数: {len(changes)}")
                for j, change in enumerate(changes, 1):
                    print(f"     📁 文件 {j}: {change['file_path']}")
                    print(f"        状态: {change['status']}")
                    print(f"        新增: +{change['additions']} 行")
                    print(f"        删除: -{change['deletions']} 行")
                    print(f"        变更: {change['changes']} 行")
                    
                    # 如果有变更内容，显示前几行
                    if change.get('patch'):
                        patch_lines = change['patch'].split('\n')[:5]  # 只显示前5行
                        print(f"        变更内容预览:")
                        for line in patch_lines:
                            if line.startswith('+'):
                                print(f"         + {line[1:]}")
                            elif line.startswith('-'):
                                print(f"         - {line[1:]}")
                            elif line.startswith('@@'):
                                print(f"         {line}")
                        if len(change['patch'].split('\n')) > 5:
                            print(f"         ... (还有更多内容)")
            else:
                print("   变更文件数: 0")
            
            print("-" * 80)
        
        print(f"📊 总结: 共分析了 {len(commits)} 个提交，涉及 {sum(len(github_integration.get_commit_changes(c['hash'])) for c in commits)} 个文件变更")
        
    except Exception as e:
        print(f"❌ 获取变更记录时出错: {e}")
        import traceback
        traceback.print_exc()

def main():
    """主函数"""
    if len(sys.argv) < 2:
        print("使用方法: python print_recent_changes.py <仓库URL> [提交数量]")
        print("示例: python print_recent_changes.py https://github.com/neo4j/neo4j-python-driver 5")
        sys.exit(1)
    
    repo_url = sys.argv[1]
    commit_count = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    
    print(f"🚀 开始分析仓库: {repo_url}")
    print(f"📅 分析时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"📊 目标提交数: {commit_count}")
    print()
    
    # 运行异步函数
    asyncio.run(print_recent_changes(repo_url, commit_count))

if __name__ == "__main__":
    main() 