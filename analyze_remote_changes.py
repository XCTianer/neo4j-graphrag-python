#!/usr/bin/env python3
"""
分析远程仓库 https://github.com/XCTianer/transformer-models.git 的最新变更记录
"""

import subprocess
import json
from datetime import datetime
from typing import List, Dict, Any

def get_remote_commit_info():
    """获取远程仓库的提交信息"""
    try:
        # 获取最新的提交信息
        cmd = ["git", "log", "transformer-models/main", "--pretty=format:%H|%an|%ad|%s", "--date=iso"]
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
        print(f"获取提交信息失败: {e}")
        return []

def get_commit_files(commit_hash: str) -> List[str]:
    """获取特定提交的文件列表"""
    try:
        cmd = ["git", "show", f"transformer-models/{commit_hash}", "--name-only", "--pretty=format:"]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        
        files = []
        for line in result.stdout.strip().split('\n'):
            if line and line.endswith('.m'):
                files.append(line)
        
        return files
    except subprocess.CalledProcessError as e:
        print(f"获取文件列表失败: {e}")
        return []

def get_commit_stats(commit_hash: str) -> Dict[str, Any]:
    """获取提交的统计信息"""
    try:
        cmd = ["git", "show", f"transformer-models/{commit_hash}", "--stat"]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        
        # 解析统计信息
        lines = result.stdout.split('\n')
        stats = {
            'files_changed': 0,
            'insertions': 0,
            'deletions': 0,
            'matlab_files': []
        }
        
        for line in lines:
            if line.endswith('.m'):
                stats['matlab_files'].append(line.strip())
            elif 'files changed' in line:
                # 解析 "97 files changed, 6999 insertions(+), 0 deletions(-)"
                parts = line.split(',')
                if len(parts) >= 3:
                    stats['files_changed'] = int(parts[0].split()[0])
                    stats['insertions'] = int(parts[1].split()[0])
                    if 'deletions' in parts[2]:
                        stats['deletions'] = int(parts[2].split()[0])
        
        return stats
    except subprocess.CalledProcessError as e:
        print(f"获取统计信息失败: {e}")
        return {}

def get_remote_repo_info() -> Dict[str, Any]:
    """获取远程仓库的基本信息"""
    try:
        # 获取远程仓库URL
        cmd = ["git", "remote", "get-url", "transformer-models"]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        remote_url = result.stdout.strip()
        
        # 获取分支信息
        cmd = ["git", "branch", "-r"]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        branches = [line.strip() for line in result.stdout.strip().split('\n') if 'transformer-models' in line]
        
        # 获取MATLAB文件总数
        cmd = ["git", "ls-tree", "-r", "transformer-models/main", "--name-only"]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        all_files = result.stdout.strip().split('\n')
        matlab_files = [f for f in all_files if f.endswith('.m')]
        
        return {
            'remote_url': remote_url,
            'branches': branches,
            'total_files': len(all_files),
            'matlab_files': len(matlab_files),
            'matlab_file_list': matlab_files[:20]  # 前20个文件
        }
    except subprocess.CalledProcessError as e:
        print(f"获取仓库信息失败: {e}")
        return {}

def analyze_matlab_structure():
    """分析MATLAB代码结构"""
    try:
        # 获取所有MATLAB文件
        cmd = ["git", "ls-tree", "-r", "transformer-models/main", "--name-only"]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        all_files = result.stdout.strip().split('\n')
        matlab_files = [f for f in all_files if f.endswith('.m')]
        
        # 分析文件结构
        structure = {
            'bert': [],
            'finbert': [],
            'gpt2': [],
            'transformer': [],
            'sampling': [],
            'test': [],
            'other': []
        }
        
        for file_path in matlab_files:
            if '+bert' in file_path:
                structure['bert'].append(file_path)
            elif '+finbert' in file_path:
                structure['finbert'].append(file_path)
            elif '+gpt2' in file_path:
                structure['gpt2'].append(file_path)
            elif '+transformer' in file_path:
                structure['transformer'].append(file_path)
            elif '+sampling' in file_path:
                structure['sampling'].append(file_path)
            elif 'test' in file_path:
                structure['test'].append(file_path)
            else:
                structure['other'].append(file_path)
        
        return structure
    except subprocess.CalledProcessError as e:
        print(f"分析代码结构失败: {e}")
        return {}

def main():
    print("=== 远程仓库变更记录分析 ===")
    print(f"分析时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("仓库: https://github.com/XCTianer/transformer-models.git")
    print()
    
    # 1. 获取仓库基本信息
    print("1. 获取仓库基本信息...")
    repo_info = get_remote_repo_info()
    if repo_info:
        print(f"远程URL: {repo_info['remote_url']}")
        print(f"分支数量: {len(repo_info['branches'])}")
        print(f"总文件数: {repo_info['total_files']}")
        print(f"MATLAB文件数: {repo_info['matlab_files']}")
        print()
    
    # 2. 获取提交记录
    print("2. 获取提交记录...")
    commits = get_remote_commit_info()
    if commits:
        print(f"提交数量: {len(commits)}")
        print("最新提交:")
        for i, commit in enumerate(commits[:3], 1):
            print(f"  {i}. {commit['hash'][:8]} - {commit['message']}")
            print(f"     作者: {commit['author']}")
            print(f"     时间: {commit['date']}")
        print()
    
    # 3. 分析最新提交的详细信息
    if commits:
        print("3. 分析最新提交的详细信息...")
        latest_commit = commits[0]
        stats = get_commit_stats(latest_commit['hash'])
        
        if stats:
            print(f"提交: {latest_commit['hash'][:8]}")
            print(f"文件变更: {stats['files_changed']} 个")
            print(f"新增行数: {stats['insertions']} 行")
            print(f"删除行数: {stats['deletions']} 行")
            print(f"MATLAB文件: {len(stats['matlab_files'])} 个")
            print()
    
    # 4. 分析代码结构
    print("4. 分析MATLAB代码结构...")
    structure = analyze_matlab_structure()
    if structure:
        print("代码模块分布:")
        for module, files in structure.items():
            if files:
                print(f"  {module}: {len(files)} 个文件")
        print()
    
    # 5. 生成分析报告
    print("5. 生成分析报告...")
    report = {
        'analysis_time': datetime.now().isoformat(),
        'repository_info': repo_info,
        'commits': commits,
        'latest_commit_stats': stats if commits else {},
        'code_structure': structure
    }
    
    # 保存报告
    with open('remote_repository_analysis.json', 'w', encoding='utf-8') as f:
        json.dump(report, f, ensure_ascii=False, indent=2)
    
    # 生成Markdown报告
    with open('remote_repository_analysis.md', 'w', encoding='utf-8') as f:
        f.write("# 远程仓库变更记录分析报告\n\n")
        f.write(f"**分析时间**: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        f.write(f"**仓库地址**: {repo_info.get('remote_url', 'N/A')}\n\n")
        
        f.write("## 仓库概览\n\n")
        f.write(f"- 总文件数: {repo_info.get('total_files', 0)}\n")
        f.write(f"- MATLAB文件数: {repo_info.get('matlab_files', 0)}\n")
        f.write(f"- 分支数量: {len(repo_info.get('branches', []))}\n\n")
        
        if commits:
            f.write("## 提交记录\n\n")
            f.write(f"总提交数: {len(commits)}\n\n")
            f.write("### 最新提交\n\n")
            for i, commit in enumerate(commits[:5], 1):
                f.write(f"#### {i}. {commit['message']}\n\n")
                f.write(f"- **提交哈希**: {commit['hash']}\n")
                f.write(f"- **作者**: {commit['author']}\n")
                f.write(f"- **时间**: {commit['date']}\n\n")
        
        if structure:
            f.write("## 代码结构分析\n\n")
            f.write("### 模块分布\n\n")
            for module, files in structure.items():
                if files:
                    f.write(f"- **{module}**: {len(files)} 个文件\n")
            f.write("\n")
        
        if stats:
            f.write("## 最新提交统计\n\n")
            f.write(f"- 文件变更: {stats.get('files_changed', 0)} 个\n")
            f.write(f"- 新增行数: {stats.get('insertions', 0)} 行\n")
            f.write(f"- 删除行数: {stats.get('deletions', 0)} 行\n")
            f.write(f"- MATLAB文件: {len(stats.get('matlab_files', []))} 个\n\n")
    
    print("分析完成！")
    print(f"JSON报告: remote_repository_analysis.json")
    print(f"Markdown报告: remote_repository_analysis.md")

if __name__ == "__main__":
    main() 