#!/usr/bin/env python3
"""
分析远程仓库的最新变更记录
"""

import subprocess
import json
from datetime import datetime
from typing import List, Dict, Any

def get_latest_commits():
    """获取最新的提交记录"""
    try:
        cmd = ["git", "log", "transformer-models/main", "--pretty=format:%H|%an|%ad|%s", "--date=iso", "-5"]
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

def get_commit_diff(commit_hash: str) -> Dict[str, Any]:
    """获取提交的详细差异"""
    try:
        # 获取提交的差异
        cmd = ["git", "show", commit_hash]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        
        # 解析差异信息
        lines = result.stdout.split('\n')
        diff_info = {
            'commit_hash': commit_hash,
            'files_changed': [],
            'insertions': 0,
            'deletions': 0,
            'diff_content': result.stdout
        }
        
        # 查找文件变更信息
        for line in lines:
            if line.startswith('diff --git'):
                # 解析文件路径
                parts = line.split()
                if len(parts) >= 3:
                    file_path = parts[2].replace('b/', '')
                    if file_path not in diff_info['files_changed']:
                        diff_info['files_changed'].append(file_path)
            elif line.startswith('+') and not line.startswith('+++'):
                diff_info['insertions'] += 1
            elif line.startswith('-') and not line.startswith('---'):
                diff_info['deletions'] += 1
        
        return diff_info
    except subprocess.CmdProcessError as e:
        print(f"获取提交差异失败: {e}")
        return {}

def analyze_matlab_changes(diff_content: str) -> Dict[str, Any]:
    """分析MATLAB代码变更"""
    lines = diff_content.split('\n')
    changes = {
        'variables_changed': [],
        'functions_changed': [],
        'scripts_changed': [],
        'comments_changed': [],
        'imports_changed': []
    }
    
    for line in lines:
        if line.startswith('+') and not line.startswith('+++'):
            # 分析新增的代码
            if 'function' in line and '=' not in line:
                # 函数定义
                func_match = line.split('function')
                if len(func_match) > 1:
                    func_part = func_match[1].strip()
                    if func_part:
                        func_name = func_part.split()[0]
                        if func_name and func_name not in changes['functions_changed']:
                            changes['functions_changed'].append(func_name)
            elif '=' in line and not line.strip().startswith('%'):
                # 变量赋值
                var_match = line.split('=')[0].strip()
                if var_match and var_match not in changes['variables_changed']:
                    changes['variables_changed'].append(var_match)
            elif line.strip().startswith('%'):
                changes['comments_changed'].append(line.strip())
        
        elif line.startswith('-') and not line.startswith('---'):
            # 分析删除的代码
            if 'function' in line and '=' not in line:
                func_match = line.split('function')
                if len(func_match) > 1:
                    func_part = func_match[1].strip()
                    if func_part:
                        func_name = func_part.split()[0]
                        if func_name and func_name not in changes['functions_changed']:
                            changes['functions_changed'].append(func_name)
            elif '=' in line and not line.strip().startswith('%'):
                var_match = line.split('=')[0].strip()
                if var_match and var_match not in changes['variables_changed']:
                    changes['variables_changed'].append(var_match)
    
    return changes

def main():
    print("=== 最新变更记录分析 ===")
    print(f"分析时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("仓库: https://github.com/XCTianer/transformer-models.git")
    print()
    
    # 获取最新提交
    commits = get_latest_commits()
    if not commits:
        print("未找到提交记录")
        return
    
    print(f"找到 {len(commits)} 个提交记录")
    print()
    
    # 分析每个提交
    all_changes = []
    for i, commit in enumerate(commits, 1):
        print(f"分析提交 {i}: {commit['message']}")
        print(f"  哈希: {commit['hash']}")
        print(f"  作者: {commit['author']}")
        print(f"  时间: {commit['date']}")
        
        # 获取提交差异
        diff_info = get_commit_diff(commit['hash'])
        if diff_info:
            print(f"  文件变更: {len(diff_info['files_changed'])} 个")
            print(f"  新增行数: {diff_info['insertions']} 行")
            print(f"  删除行数: {diff_info['deletions']} 行")
            
            # 分析MATLAB变更
            matlab_changes = analyze_matlab_changes(diff_info['diff_content'])
            
            change_summary = {
                'commit': commit,
                'diff_info': diff_info,
                'matlab_changes': matlab_changes
            }
            all_changes.append(change_summary)
            
            # 显示变更的文件
            if diff_info['files_changed']:
                print("  变更文件:")
                for file_path in diff_info['files_changed']:
                    print(f"    - {file_path}")
            
            # 显示MATLAB变更详情
            if matlab_changes['variables_changed']:
                print(f"  变量变更: {', '.join(matlab_changes['variables_changed'])}")
            if matlab_changes['functions_changed']:
                print(f"  函数变更: {', '.join(matlab_changes['functions_changed'])}")
        
        print()
    
    # 生成详细报告
    print("生成详细变更报告...")
    
    # JSON报告
    with open('latest_changes_analysis.json', 'w', encoding='utf-8') as f:
        json.dump({
            'analysis_time': datetime.now().isoformat(),
            'total_commits': len(commits),
            'changes': all_changes
        }, f, ensure_ascii=False, indent=2)
    
    # Markdown报告
    with open('latest_changes_analysis.md', 'w', encoding='utf-8') as f:
        f.write("# 最新变更记录详细分析\n\n")
        f.write(f"**分析时间**: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        f.write(f"**仓库**: https://github.com/XCTianer/transformer-models.git\n\n")
        f.write(f"**总提交数**: {len(commits)}\n\n")
        
        for i, change in enumerate(all_changes, 1):
            commit = change['commit']
            diff_info = change['diff_info']
            matlab_changes = change['matlab_changes']
            
            f.write(f"## 提交 {i}: {commit['message']}\n\n")
            f.write(f"- **提交哈希**: {commit['hash']}\n")
            f.write(f"- **作者**: {commit['author']}\n")
            f.write(f"- **时间**: {commit['date']}\n")
            f.write(f"- **文件变更**: {len(diff_info['files_changed'])} 个\n")
            f.write(f"- **新增行数**: {diff_info['insertions']} 行\n")
            f.write(f"- **删除行数**: {diff_info['deletions']} 行\n\n")
            
            if diff_info['files_changed']:
                f.write("### 变更文件\n\n")
                for file_path in diff_info['files_changed']:
                    f.write(f"- `{file_path}`\n")
                f.write("\n")
            
            if matlab_changes['variables_changed'] or matlab_changes['functions_changed']:
                f.write("### MATLAB代码变更\n\n")
                if matlab_changes['variables_changed']:
                    f.write(f"- **变量变更**: {', '.join(matlab_changes['variables_changed'])}\n")
                if matlab_changes['functions_changed']:
                    f.write(f"- **函数变更**: {', '.join(matlab_changes['functions_changed'])}\n")
                f.write("\n")
            
            f.write("---\n\n")
    
    print("分析完成！")
    print(f"JSON报告: latest_changes_analysis.json")
    print(f"Markdown报告: latest_changes_analysis.md")

if __name__ == "__main__":
    main() 