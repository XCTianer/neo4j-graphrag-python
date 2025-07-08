# MCP工具调用监控系统

## 概述

本监控系统可以帮助你实时了解Codex或其他客户端是否调用了MCP工具，包括详细的调用记录、性能统计和错误追踪。

## 快速开始

### 1. 快速检查状态

```bash
python mcp_plugin/quick_check.py
```

这个命令会显示：
- ✅ 是否有日志文件生成
- 📊 调用统计信息
- 🔧 工具使用情况
- 🕒 最近的调用记录
- 📅 今天的调用情况

### 2. 实时监控

```bash
python mcp_plugin/monitor_mcp_calls.py
```

实时显示新的MCP工具调用，包括：
- 调用时间
- 工具名称
- 执行时间
- 参数信息
- 错误信息（如果有）

### 3. 查看历史记录

```bash
python mcp_plugin/log_viewer.py --summary
```

显示详细的统计信息和使用情况。

## 如何判断Codex是否调用了MCP工具

### 方法1：检查日志文件

如果Codex调用了MCP工具，会在 `mcp_plugin/logs/` 目录下生成日志文件：

```bash
ls -la mcp_plugin/logs/
```

你应该能看到类似这样的文件：
- `mcp_calls_20250701.log` - MCP工具调用日志
- `nl_parser_20250701.log` - 自然语言解析日志
- `detailed_calls.jsonl` - 详细调用记录

### 方法2：使用快速检查

```bash
python mcp_plugin/quick_check.py
```

如果显示"✅ 找到日志文件"和"📊 调用统计"，说明MCP工具被调用过。

### 方法3：实时监控

在Codex使用过程中，打开另一个终端运行：

```bash
python mcp_plugin/monitor_mcp_calls.py
```

当Codex调用MCP工具时，你会看到实时的调用记录。

### 方法4：查看最近调用

```bash
python mcp_plugin/log_viewer.py --recent 5
```

显示最近5次MCP工具调用。

## 监控工具详解

### 1. 快速检查工具 (`quick_check.py`)

**功能：** 快速检查MCP工具调用状态

**使用：**
```bash
python mcp_plugin/quick_check.py
```

**输出示例：**
```
🚀 MCP工具调用状态检查
==================================================
✅ 找到日志文件:
   📄 nl_parser_20250701.log (1145 bytes, 修改时间: 15:07:16)
   📄 mcp_calls_20250701.log (899 bytes, 修改时间: 15:07:16)

📊 调用统计:
   总调用次数: 2
   成功调用: 0
   失败调用: 2
   成功率: 0.0%

🔧 工具使用情况:
   analyze_code_changes: 2 次

🕒 最近的调用记录:
   1. ❌ [15:07:16] analyze_code_changes (4.32s)
      错误: cannot import name 'Neo4jGraphRAGPlugin' from 'plu...
```

### 2. 实时监控工具 (`monitor_mcp_calls.py`)

**功能：** 实时监控MCP工具调用

**使用：**
```bash
# 基本监控
python mcp_plugin/monitor_mcp_calls.py

# 监控特定工具
python mcp_plugin/monitor_mcp_calls.py --tool analyze_code_changes

# 隐藏参数信息
python mcp_plugin/monitor_mcp_calls.py --no-params

# 查看当前状态
python mcp_plugin/monitor_mcp_calls.py --status
```

**输出示例：**
```
🔍 Monitoring MCP tool calls...
Press Ctrl+C to stop
--------------------------------------------------------------------------------
✓ [15:07:16] analyze_code_changes (4.32s) | repository_path=/home/kotei/work/neo..., commit_hash=dd73d67ab4bba5930604...
```

### 3. 日志查看工具 (`log_viewer.py`)

**功能：** 查看和分析历史调用记录

**使用：**
```bash
# 查看摘要统计
python mcp_plugin/log_viewer.py --summary

# 查看最近的10次调用
python mcp_plugin/log_viewer.py --recent 10

# 查看特定工具的调用记录
python mcp_plugin/log_viewer.py --tool analyze_code_changes

# 查看最近24小时的调用
python mcp_plugin/log_viewer.py --time-range 24h

# 只查看成功的调用
python mcp_plugin/log_viewer.py --success-only

# 查看特定工具的详细信息
python mcp_plugin/log_viewer.py --details analyze_code_changes

# 导出日志到JSON文件
python mcp_plugin/log_viewer.py --export my_analysis.json
```

## 日志文件说明

### 1. MCP调用日志 (`mcp_calls_YYYYMMDD.log`)

记录所有MCP工具调用的详细信息：

```
2025-07-01 15:07:16,489 - INFO - MCP Tool Call: {"timestamp": "2025-07-01T15:07:16.489338", "tool_name": "analyze_code_changes", "parameters": {"repository_path": "/home/kotei/work/neo4j-graphrag-python", "commit_hash": "dd73d67ab4bba5930604bebc77f6b5f2ca1a59f2"}, "result": {"error": "cannot import name 'Neo4jGraphRAGPlugin' from 'plugin'", "success": false}, "duration_seconds": 4.32, "success": false}
```

### 2. 自然语言解析日志 (`nl_parser_YYYYMMDD.log`)

记录自然语言命令的解析过程：

```
2025-07-01 15:07:11,338 - INFO - Processing natural language request: 分析仓库 /home/kotei/work/neo4j-graphrag-python 中最近的提交
2025-07-01 15:07:11,347 - INFO - Successfully parsed command: analyze_code_changes with params: {'repository_path': '/home/kotei/work/neo4j-graphrag-python', 'commit_hash': 'dd73d67ab4bba5930604bebc77f6b5f2ca1a59f2'}
```

### 3. 详细调用记录 (`detailed_calls.jsonl`)

JSON格式的详细调用记录，便于程序分析：

```json
{"timestamp": "2025-07-01T15:07:16.489338", "tool_name": "analyze_code_changes", "parameters": {"repository_path": "/home/kotei/work/neo4j-graphrag-python", "commit_hash": "dd73d67ab4bba5930604bebc77f6b5f2ca1a59f2"}, "result": {"error": "cannot import name 'Neo4jGraphRAGPlugin' from 'plugin'", "success": false}, "duration_seconds": 4.32, "success": false}
```

## 常见问题

### Q1: 如何知道Codex是否调用了MCP工具？

**A:** 使用以下任一方法：

1. **快速检查：** `python mcp_plugin/quick_check.py`
2. **实时监控：** `python mcp_plugin/monitor_mcp_calls.py`
3. **查看日志：** `ls -la mcp_plugin/logs/`

### Q2: 没有看到日志文件怎么办？

**A:** 可能的原因：
- Codex没有调用MCP工具
- 配置有问题
- 权限问题

**解决方案：**
```bash
# 检查配置
python mcp_plugin/quick_check.py

# 手动测试
python mcp_plugin/natural_language_parser.py "分析最近的提交"
```

### Q3: 如何调试失败的调用？

**A:** 使用以下命令：

```bash
# 查看失败的调用
python mcp_plugin/log_viewer.py --details analyze_code_changes

# 查看错误信息
grep "Error:" mcp_plugin/logs/mcp_calls_$(date +%Y%m%d).log

# 实时监控错误
python mcp_plugin/monitor_mcp_calls.py --no-errors
```

### Q4: 如何分析性能问题？

**A:** 使用以下命令：

```bash
# 查看执行时间统计
python mcp_plugin/log_viewer.py --summary

# 查看特定工具的性能
python mcp_plugin/log_viewer.py --details get_impact_chains

# 导出数据进行详细分析
python mcp_plugin/log_viewer.py --export performance_analysis.json
```

## 最佳实践

### 1. 日常监控

```bash
# 每天检查一次状态
python mcp_plugin/quick_check.py

# 定期查看统计信息
python mcp_plugin/log_viewer.py --summary
```

### 2. 问题排查

```bash
# 1. 快速检查状态
python mcp_plugin/quick_check.py

# 2. 查看详细错误
python mcp_plugin/log_viewer.py --details analyze_code_changes

# 3. 实时监控新调用
python mcp_plugin/monitor_mcp_calls.py
```

### 3. 性能优化

```bash
# 分析执行时间
python mcp_plugin/log_viewer.py --summary

# 识别慢速调用
python mcp_plugin/log_viewer.py --time-range 24h | grep "slow"

# 导出数据进行分析
python mcp_plugin/log_viewer.py --export performance_data.json
```

## 总结

通过这个监控系统，你可以：

1. **实时了解** Codex是否调用了MCP工具
2. **追踪性能** 监控工具调用的执行时间
3. **调试问题** 查看详细的错误信息
4. **分析使用情况** 了解工具的使用频率和模式
5. **优化体验** 根据监控数据改进工具性能

建议定期使用这些工具来监控MCP工具的运行状况，确保系统的稳定性和性能。 