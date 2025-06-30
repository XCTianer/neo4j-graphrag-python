# Continue MCP 插件使用指南

## 🎉 配置完成！

你的 Neo4j GraphRAG 代码变更影响分析 MCP 插件已经成功配置到 Continue 中。

## 📋 配置信息

- **MCP 配置文件**: `/home/kotei/work/graphrag/.continue/mcpServers/code-change-impact.yaml`
- **插件名称**: `code-change-impact`
- **启动脚本**: `/home/kotei/work/neo4j-graphrag-python/mcp_plugin/start_for_continue_direct.py`
- **Python 环境**: `sunny` (conda)
- **Python 解释器**: `/home/kotei/miniconda3/envs/sunny/bin/python`

## 🚀 使用方法

### 1. 重启 Continue
首先重启 Continue 以加载新的 MCP 配置。

### 2. 在 Continue 中使用 MCP 功能

在 Continue 的聊天界面中，你可以使用以下命令来调用 MCP 插件：

#### 获取分析配置
```
请使用 MCP 插件获取代码变更分析的配置信息
```

#### 分析代码变更影响
```
请使用 MCP 插件分析最近的代码变更影响
```

#### 获取影响链路
```
请使用 MCP 插件获取代码变更的影响链路
```

#### 查询特定文件的影响
```
请使用 MCP 插件查询文件 src/neo4j_graphrag/schema.py 的影响范围
```

#### 执行 Neo4j 查询
```
请使用 MCP 插件执行 Cypher 查询：MATCH (n) RETURN n LIMIT 10
```

### 3. 可用的 MCP 方法

插件支持以下 JSON-RPC 方法：

- `get_analysis_config` - 获取分析配置
- `analyze_code_changes` - 分析代码变更
- `get_impact_chains` - 获取影响链路
- `get_file_impacts` - 获取文件影响
- `analyze_commit` - 分析提交
- `execute_neo4j_query` - 执行 Neo4j 查询
- `get_plugin_info` - 获取插件信息

## 🔧 故障排除

### 如果插件无法启动

1. **检查环境**:
   ```bash
   conda activate sunny
   python mcp_plugin/test_mcp_import.py
   ```

2. **检查配置**:
   ```bash
   python mcp_plugin/test_continue_integration.py
   ```

3. **查看 Continue 日志**:
   - 打开 Continue 的输出面板
   - 查看是否有 MCP 相关的错误信息

### 常见问题

#### 1. 找不到 pydantic_core 包
**问题**: Continue 报错找不到 `pydantic_core` 包

**解决方案**: 
- 确保使用 conda 环境的 Python 解释器
- 检查 MCP 配置文件中的 `command` 字段是否指向正确的 Python 路径
- 当前配置: `/home/kotei/miniconda3/envs/sunny/bin/python`

#### 2. 找不到 neo4j_graphrag 包
**问题**: 找不到 `neo4j_graphrag` 包

**解决方案**:
- 确保 `src/` 目录在 Python 路径中
- 检查 conda 环境是否正确激活
- 验证 `PYTHONPATH` 环境变量设置

#### 3. Neo4j 连接失败
**问题**: Neo4j 连接失败

**解决方案**:
- 确保 Neo4j 数据库正在运行
- 检查连接配置（URI、用户名、密码）

#### 4. 权限问题
**问题**: 权限相关错误

**解决方案**:
- 确保启动脚本有执行权限
- 检查文件路径是否正确

## 📝 示例对话

### 示例 1: 获取配置信息
**用户**: 请使用 MCP 插件获取代码变更分析的配置信息

**Continue**: 我将使用 MCP 插件获取配置信息...
[显示配置详情]

### 示例 2: 分析代码变更
**用户**: 请使用 MCP 插件分析最近的代码变更影响

**Continue**: 我将使用 MCP 插件分析代码变更...
[显示分析结果]

### 示例 3: 查询文件影响
**用户**: 请使用 MCP 插件查询文件 mcp_plugin/plugin.py 的影响范围

**Continue**: 我将使用 MCP 插件查询文件影响...
[显示影响范围]

## 🎯 高级用法

### 自定义查询
你可以要求 Continue 执行特定的 Neo4j 查询：

```
请使用 MCP 插件执行以下查询：
MATCH (f:Function)-[:CALLS]->(g:Function) 
WHERE f.name CONTAINS 'analyze' 
RETURN f.name, g.name LIMIT 10
```

### 批量分析
```
请使用 MCP 插件分析最近 3 天的代码变更，并生成详细报告
```

## 🔧 技术细节

### 环境配置
- **Python 版本**: 3.11.13
- **Conda 环境**: sunny
- **关键依赖**: pydantic, neo4j, pydantic-core
- **Python 路径**: 包含项目根目录和 src 目录

### MCP 配置
```yaml
mcpServers:
  - name: code-change-impact
    command: /home/kotei/miniconda3/envs/sunny/bin/python
    args:
      - /home/kotei/work/neo4j-graphrag-python/mcp_plugin/start_for_continue_direct.py
    env:
      PYTHONPATH: /home/kotei/work/neo4j-graphrag-python:/home/kotei/work/neo4j-graphrag-python/src
      PATH: /home/kotei/miniconda3/envs/sunny/bin:/usr/local/bin:/usr/bin:/bin
      CONDA_DEFAULT_ENV: sunny
```

## 📞 支持

如果遇到问题，请：

1. 运行测试脚本检查配置
2. 查看 Continue 的输出日志
3. 检查 Neo4j 数据库状态
4. 确认所有依赖都已正确安装

---

**恭喜！你的 MCP 插件已经准备就绪，可以开始使用了！** 🎉 

## 概述

本指南将帮助你在 Continue 中正确使用 Code Change Impact Analysis MCP 插件。

## 工具列表

插件提供了以下 7 个工具：

1. **analyze_code_changes** - 分析代码变更及其影响
2. **get_impact_chains** - 获取影响链路
3. **get_file_impact** - 获取文件影响分析
4. **get_commit_analysis** - 获取提交分析
5. **get_neo4j_queries** - 获取 Neo4j 查询语句
6. **get_analysis_config** - 获取当前分析配置 ⭐
7. **update_config** - 更新分析配置

## 重点：get_analysis_config 工具

### 功能说明
`get_analysis_config` 工具用于获取当前的分析配置信息，包括：
- Neo4j 数据库配置
- Ollama 模型配置
- 仓库配置
- 分析参数配置
- 风险阈值配置

### 使用方法

在 Continue 中，你可以这样使用：

```
请使用 get_analysis_config 工具获取当前的分析配置
```

或者：

```
我想查看当前的分析配置，请调用 get_analysis_config 工具
```

### 返回结果

工具会返回包含以下信息的 JSON 对象：

```json
{
  "config": {
    "neo4j": {
      "uri": "neo4j://localhost:7687",
      "username": "neo4j",
      "password": "password"
    },
    "ollama": {
      "model": "Qwen2.5-Coder-1.5B:latest",
      "base_url": "http://localhost:11434"
    },
    "repository": {
      "url": "https://github.com/XCTianer/transformer-models.git",
      "analysis_days": 5,
      "max_commits": 1,
      "only_latest_commit": true
    },
    "analysis": {
      "output_dir": "analysis_output",
      "log_level": "INFO"
    },
    "risk": {
      "high_risk_threshold": 50,
      "medium_risk_threshold": 20
    }
  },
  "is_valid": true
}
```

## 故障排除

### 如果工具没有响应

1. **重启 Continue**
   - 完全关闭 Continue
   - 重新启动 Continue
   - 等待 MCP 服务器连接建立

2. **检查 MCP 服务器状态**
   ```bash
   # 在项目目录中运行
   conda activate sunny
   python mcp_plugin/quick_test.py
   ```

3. **验证配置**
   ```bash
   # 检查 Continue 配置
   python mcp_plugin/diagnose_continue.py
   ```

4. **测试协议兼容性**
   ```bash
   # 测试 MCP 协议
   python mcp_plugin/test_mcp_protocol_compatibility.py
   ```

### 常见问题

**Q: 为什么我看不到工具？**
A: 确保 Continue 已经重启，并且 MCP 服务器配置正确。

**Q: 工具调用没有响应？**
A: 检查 conda 环境是否正确激活，Python 路径是否正确设置。

**Q: 如何更新配置？**
A: 使用 `update_config` 工具，或者直接修改 `extensions/config.yaml` 文件。

## 配置说明

### 环境要求
- Python 3.9+
- conda 环境：sunny
- Neo4j 数据库运行在 localhost:7687
- Ollama 服务运行在 localhost:11434

### 重要配置项

1. **仓库配置**
   - `repository.url`: 要分析的 Git 仓库 URL
   - `repository.analysis_days`: 分析最近几天的提交
   - `repository.max_commits`: 最大分析提交数

2. **Neo4j 配置**
   - `neo4j.uri`: Neo4j 数据库连接 URI
   - `neo4j.username`: 数据库用户名
   - `neo4j.password`: 数据库密码

3. **Ollama 配置**
   - `ollama.model`: 使用的模型名称
   - `ollama.base_url`: Ollama 服务地址

## 使用示例

### 示例 1：查看当前配置
```
用户：请帮我查看当前的分析配置
助手：我来帮你获取当前的分析配置信息。
[调用 get_analysis_config 工具]
```

### 示例 2：分析代码变更
```
用户：请分析最近7天的代码变更
助手：我来分析最近7天的代码变更及其影响。
[调用 analyze_code_changes 工具，参数：days=7]
```

### 示例 3：获取影响链路
```
用户：显示高风险的影响链路
助手：我来获取高风险的影响链路信息。
[调用 get_impact_chains 工具，参数：severity_filter=HIGH]
```

## 技术支持

如果遇到问题，请：

1. 运行诊断脚本：`python mcp_plugin/diagnose_continue.py`
2. 检查日志文件：`code_change_analysis.log`
3. 确认所有依赖服务（Neo4j、Ollama）正在运行

## 更新日志

- v1.0.0: 初始版本，支持 7 个核心工具
- 修复了 MCP 协议兼容性问题
- 优化了错误处理和日志记录 