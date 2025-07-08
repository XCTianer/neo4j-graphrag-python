# Codex MCP 配置指南

## 概述

本指南说明如何在 Codex 中配置和使用 Neo4j GraphRAG 代码变更影响分析 MCP 插件。

## 配置文件位置

Codex 的 MCP 配置文件位于：`~/.codex/config.toml`

## 当前配置

```toml
# Codex 配置文件
# 模型配置
model = "o3"
approval_policy = "never"

# MCP 服务器配置 - 代码变更影响分析插件
[mcp_servers.code-change-impact]
command = "/home/kotei/miniconda3/envs/sunny/bin/python"
args = ["/home/kotei/work/neo4j-graphrag-python/mcp_plugin/codex_mcp_server.py"]
env = { 
    PYTHONPATH = "/home/kotei/work/neo4j-graphrag-python",
    CONDA_DEFAULT_ENV = "sunny"
}
cwd = "/home/kotei/work/neo4j-graphrag-python/mcp_plugin"
```

## 配置说明

### 1. 基本配置
- `model = "o3"` - 使用 OpenAI o3 模型
- `approval_policy = "never"` - 自动执行命令，无需手动批准

### 2. MCP 服务器配置
- `mcp_servers.code-change-impact` - 服务器名称
- `command` - Python 解释器路径（conda 环境）
- `args` - MCP 服务器脚本路径
- `env` - 环境变量设置
- `cwd` - 工作目录

## 可用工具

配置完成后，Codex 可以使用以下工具：

### 1. analyze_code_changes
**功能：** 分析代码变更及其影响

**参数：**
- `repo_url` (string): 要分析的仓库 URL
- `days` (integer): 分析天数，默认 7
- `output_dir` (string): 输出目录，默认 "analysis_output"
- `detailed_chains` (boolean): 是否生成详细链路分析，默认 true
- `show_chains` (boolean): 是否在输出中显示链路，默认 true

**使用示例：**
```
分析 https://github.com/example/repo 最近5天的代码变更影响
```

### 2. get_impact_chains
**功能：** 获取仓库的影响链路

**参数：**
- `repo_url` (string): 仓库 URL
- `days` (integer): 分析天数，默认 7
- `severity_filter` (string): 按严重程度过滤 (HIGH, MEDIUM, LOW)

**使用示例：**
```
获取 https://github.com/example/repo 的高风险影响链路
```

### 3. get_file_impact
**功能：** 获取特定文件的影响分析

**参数：**
- `repo_url` (string): 仓库 URL
- `days` (integer): 分析天数，默认 7
- `file_path` (string): 要分析的文件路径

**使用示例：**
```
分析 src/main.py 文件的影响
```

### 4. get_commit_analysis
**功能：** 获取特定提交的分析

**参数：**
- `repo_url` (string): 仓库 URL
- `days` (integer): 分析天数，默认 7
- `commit_hash` (string): 要分析的提交哈希

**使用示例：**
```
分析提交 abc123 的详细信息
```

### 5. get_neo4j_queries
**功能：** 获取 Neo4j Cypher 查询语句

**参数：**
- `repo_url` (string): 仓库 URL
- `days` (integer): 分析天数，默认 7

**使用示例：**
```
获取 Neo4j 查询语句
```

### 6. get_analysis_config
**功能：** 获取当前分析配置

**参数：** 无

**使用示例：**
```
显示当前配置
```

### 7. update_config
**功能：** 更新分析配置

**参数：**
- `config_updates` (object): 配置更新

**使用示例：**
```
更新配置，设置分析天数为10天
```

## 使用方法

### 1. 启动 Codex
```bash
codex
```

### 2. 使用自然语言命令
在 Codex 中输入自然语言命令，例如：
```
分析 https://github.com/example/repo 最近3天的代码变更影响
```

### 3. 查看结果
Codex 会自动调用相应的 MCP 工具并返回分析结果。

## 故障排除

### 1. 检查 MCP 服务器状态
```bash
# 测试 MCP 服务器
/home/kotei/miniconda3/envs/sunny/bin/python /home/kotei/work/neo4j-graphrag-python/mcp_plugin/codex_mcp_server.py
```

### 2. 检查配置文件
```bash
cat ~/.codex/config.toml
```

### 3. 检查日志
```bash
# MCP 服务器日志
tail -f /home/kotei/work/neo4j-graphrag-python/mcp_plugin/logs/mcp_server_*.log

# Codex 日志
tail -f ~/.codex/logs/codex.log
```

### 4. 常见问题

**问题：** MCP 工具不可用
**解决：** 检查配置文件路径和环境变量是否正确

**问题：** 工具调用失败
**解决：** 检查 conda 环境和依赖是否正确安装

**问题：** 权限错误
**解决：** 确保 Codex 有权限执行 MCP 脚本

## 环境要求

- Python 3.9+
- conda 环境 "sunny"
- Neo4j 数据库
- Ollama LLM 服务
- Codex CLI

## 更新配置

如需修改配置，编辑 `~/.codex/config.toml` 文件，然后重启 Codex。

## 支持

如有问题，请检查：
1. MCP 服务器日志
2. Codex 日志
3. 环境配置
4. 网络连接 