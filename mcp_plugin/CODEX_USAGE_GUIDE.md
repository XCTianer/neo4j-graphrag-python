# Codex MCP 工具集成使用指南

本指南将帮助你将 Neo4j GraphRAG MCP 工具与 Codex 结合使用，实现代码变更影响分析。

## 概述

Codex 目前不直接支持 MCP 协议，但我们可以通过以下方式集成：
1. **子进程调用**：通过 Python 脚本调用 MCP 工具
2. **环境集成**：在 Codex 会话中使用 MCP 分析结果
3. **工作流集成**：将 MCP 分析作为 Codex 工作流的一部分

## 安装和配置

### 1. 环境准备

确保你的 conda 环境已正确配置：

```bash
# 激活 sunny 环境
conda activate sunny

# 安装依赖
pip install -r mcp_plugin/requirements.txt
```

### 2. 配置 Neo4j 连接

编辑 `mcp_plugin/config.yaml` 文件，配置 Neo4j 连接：

```yaml
neo4j:
  uri: "bolt://localhost:7687"
  username: "neo4j"
  password: "your_password"
  database: "neo4j"
```

## 使用方法

### 方法1：直接命令行调用

在 Codex 会话中，你可以直接调用 MCP 工具：

```bash
# 分析最近的提交
python mcp_plugin/codex_integration.py analyze_code_changes '{"commit_hash": "abc123"}'

# 获取文件影响分析
python mcp_plugin/codex_integration.py get_file_impact '{"file_path": "src/main.py"}'

# 获取影响链
python mcp_plugin/codex_integration.py get_impact_chains '{"file_path": "src/main.py", "max_depth": 3}'
```

### 方法2：在 Codex 会话中使用

启动 Codex 会话：

```bash
cd /home/kotei/work/codex/codex-cli
node ./dist/cli.js
```

然后在 Codex 中可以使用以下提示：

```
分析最近的代码变更影响：
1. 获取最近的提交哈希
2. 使用 MCP 工具分析影响
3. 生成影响报告

命令：
git rev-parse HEAD
python mcp_plugin/codex_integration.py analyze_code_changes '{"commit_hash": "REPLACE_WITH_COMMIT_HASH"}'
```

### 方法3：自动化工作流

创建一个自动化脚本，在 Codex 中调用：

```python
#!/usr/bin/env python3
import subprocess
import json
import sys

def analyze_with_codex():
    """在 Codex 中自动分析代码变更"""
    
    # 1. 获取最近的提交
    commit_hash = subprocess.check_output(
        ["git", "rev-parse", "HEAD"], 
        text=True
    ).strip()
    
    # 2. 分析代码变更
    result = subprocess.check_output([
        "python", "mcp_plugin/codex_integration.py",
        "analyze_code_changes",
        json.dumps({"commit_hash": commit_hash})
    ], text=True)
    
    # 3. 解析结果
    analysis = json.loads(result)
    
    # 4. 生成报告
    print("代码变更影响分析报告")
    print("=" * 50)
    print(f"提交哈希: {commit_hash}")
    print(f"影响文件数: {len(analysis.get('affected_files', []))}")
    print(f"影响链数量: {len(analysis.get('impact_chains', []))}")
    
    return analysis

if __name__ == "__main__":
    analyze_with_codex()
```

## 实际使用场景

### 场景1：代码审查

在 Codex 中进行代码审查时，使用 MCP 工具分析变更影响：

```
Codex 提示：
"我正在审查这个 PR，请帮我分析这些代码变更的影响范围。
使用我们的 MCP 工具来分析：
1. 获取最近的提交哈希
2. 分析代码变更影响
3. 识别潜在的风险点
4. 建议测试策略"
```

### 场景2：重构指导

在进行代码重构时，使用 MCP 工具了解依赖关系：

```
Codex 提示：
"我想重构这个函数，请帮我分析它的影响范围。
使用 MCP 工具获取影响链，然后建议安全的重构策略。"
```

### 场景3：性能优化

在性能优化时，使用 MCP 工具识别关键路径：

```
Codex 提示：
"这个函数性能有问题，请帮我分析它的调用链和影响范围。
使用 MCP 工具获取完整的依赖关系图。"
```

## 高级用法

### 1. 批量分析

```bash
# 分析多个提交
for commit in $(git log --oneline -5 | awk '{print $1}'); do
    echo "分析提交: $commit"
    python mcp_plugin/codex_integration.py analyze_code_changes "{\"commit_hash\": \"$commit\"}"
done
```

### 2. 影响可视化

结合 MCP 工具和可视化工具：

```bash
# 获取影响链数据
python mcp_plugin/codex_integration.py get_impact_chains '{"file_path": "src/main.py", "max_depth": 5}' > impact_data.json

# 使用 Codex 生成可视化代码
codex "基于 impact_data.json 生成一个交互式的依赖关系图"
```

### 3. 自动化报告

创建自动化报告生成脚本：

```python
def generate_impact_report(commit_hash):
    """生成影响分析报告"""
    
    # 获取分析数据
    analysis = subprocess.check_output([
        "python", "mcp_plugin/codex_integration.py",
        "analyze_code_changes",
        json.dumps({"commit_hash": commit_hash})
    ], text=True)
    
    # 生成 Markdown 报告
    report = f"""
# 代码变更影响分析报告

## 提交信息
- 提交哈希: {commit_hash}
- 分析时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

## 影响概览
- 影响文件数: {len(analysis.get('affected_files', []))}
- 影响链数量: {len(analysis.get('impact_chains', []))}

## 详细分析
{json.dumps(analysis, indent=2)}
"""
    
    with open(f"impact_report_{commit_hash[:8]}.md", "w") as f:
        f.write(report)
    
    return report
```

## 故障排除

### 常见问题

1. **环境问题**
   ```bash
   # 确保 conda 环境正确激活
   conda activate sunny
   python -c "import neo4j_graphrag; print('环境正常')"
   ```

2. **Neo4j 连接问题**
   ```bash
   # 测试 Neo4j 连接
   python mcp_plugin/test_neo4j_connection.py
   ```

3. **权限问题**
   ```bash
   # 确保脚本有执行权限
   chmod +x mcp_plugin/codex_integration.py
   ```

### 调试技巧

1. **启用详细日志**
   ```bash
   export MCP_DEBUG=1
   python mcp_plugin/codex_integration.py analyze_code_changes '{"commit_hash": "abc123"}'
   ```

2. **测试单个工具**
   ```bash
   python mcp_plugin/test_codex_integration.py
   ```

## 最佳实践

1. **定期更新**：保持 MCP 插件和依赖的最新版本
2. **数据备份**：定期备份 Neo4j 数据库
3. **性能监控**：监控分析性能，避免超时
4. **结果验证**：手动验证关键的分析结果
5. **文档维护**：保持使用文档的更新

## 总结

通过这种方式，你可以在 Codex 中充分利用 Neo4j GraphRAG MCP 工具的强大功能，实现更智能的代码分析和开发工作流。这种集成方式虽然不是原生的 MCP 支持，但提供了灵活且强大的代码变更影响分析能力。 