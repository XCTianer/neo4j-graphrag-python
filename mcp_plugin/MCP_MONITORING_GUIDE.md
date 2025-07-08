# MCP工具调用监控指南

本指南介绍如何监控和追踪Codex或其他客户端是否调用了MCP工具。

## 监控功能概述

系统提供了完整的日志记录和监控功能，包括：

1. **自动日志记录** - 所有MCP工具调用都会被自动记录
2. **实时监控** - 可以实时查看工具调用情况
3. **历史分析** - 查看历史调用记录和统计信息
4. **错误追踪** - 详细记录错误信息和执行时间

## 日志文件位置

所有日志文件存储在 `mcp_plugin/logs/` 目录下：

```
mcp_plugin/logs/
├── mcp_calls_YYYYMMDD.log          # MCP工具调用日志
├── nl_parser_YYYYMMDD.log          # 自然语言解析日志
└── detailed_calls.jsonl            # 详细调用记录（JSON格式）
```

## 监控方法

### 1. 查看日志文件

直接查看日志文件内容：

```bash
# 查看今天的MCP调用日志
cat mcp_plugin/logs/mcp_calls_$(date +%Y%m%d).log

# 查看自然语言解析日志
cat mcp_plugin/logs/nl_parser_$(date +%Y%m%d).log

# 查看详细调用记录
cat mcp_plugin/logs/detailed_calls.jsonl
```

### 2. 使用日志查看工具

使用专门的日志查看工具：

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

### 3. 实时监控

使用实时监控工具：

```bash
# 开始实时监控
python mcp_plugin/monitor_mcp_calls.py

# 监控特定工具
python mcp_plugin/monitor_mcp_calls.py --tool analyze_code_changes

# 隐藏参数信息
python mcp_plugin/monitor_mcp_calls.py --no-params

# 隐藏错误信息
python mcp_plugin/monitor_mcp_calls.py --no-errors

# 查看当前状态
python mcp_plugin/monitor_mcp_calls.py --status
```

## 日志内容说明

### MCP调用日志格式

每条日志记录包含以下信息：

```json
{
  "timestamp": "2025-07-01T15:07:16.489338",
  "tool_name": "analyze_code_changes",
  "parameters": {
    "repository_path": "/home/kotei/work/neo4j-graphrag-python",
    "commit_hash": "dd73d67ab4bba5930604bebc77f6b5f2ca1a59f2"
  },
  "result": {
    "success": true,
    "data": "..."
  },
  "duration_seconds": 4.32,
  "success": true
}
```

### 自然语言解析日志

记录自然语言命令的解析过程：

```
2025-07-01 15:07:11,338 - INFO - Processing natural language request: 分析仓库 /home/kotei/work/neo4j-graphrag-python 中最近的提交
2025-07-01 15:07:11,347 - INFO - Successfully parsed command: analyze_code_changes with params: {'repository_path': '/home/kotei/work/neo4j-graphrag-python', 'commit_hash': 'dd73d67ab4bba5930604bebc77f6b5f2ca1a59f2'}
```

## 如何判断Codex是否调用了MCP工具

### 1. 检查日志文件是否存在

如果Codex调用了MCP工具，会在 `mcp_plugin/logs/` 目录下生成日志文件：

```bash
ls -la mcp_plugin/logs/
```

### 2. 查看最近的调用记录

```bash
python mcp_plugin/log_viewer.py --recent 5
```

### 3. 实时监控

在另一个终端窗口运行监控：

```bash
python mcp_plugin/monitor_mcp_calls.py
```

然后在Codex中执行操作，观察是否有新的调用记录出现。

### 4. 检查调用时间

日志中的时间戳可以确认调用发生的时间：

```bash
# 查看今天的调用
python mcp_plugin/log_viewer.py --time-range 24h
```

## 常见监控场景

### 场景1：验证Codex集成是否工作

```bash
# 1. 启动实时监控
python mcp_plugin/monitor_mcp_calls.py

# 2. 在Codex中执行自然语言命令
# 例如："分析最近的提交"

# 3. 观察监控输出是否显示新的调用记录
```

### 场景2：调试工具调用失败

```bash
# 查看失败的调用
python mcp_plugin/log_viewer.py --details analyze_code_changes

# 查看错误信息
grep "Error:" mcp_plugin/logs/mcp_calls_$(date +%Y%m%d).log
```

### 场景3：性能分析

```bash
# 查看执行时间统计
python mcp_plugin/log_viewer.py --summary

# 查看特定工具的性能
python mcp_plugin/log_viewer.py --details get_impact_chains
```

### 场景4：使用情况统计

```bash
# 查看工具使用频率
python mcp_plugin/log_viewer.py --summary

# 导出数据进行分析
python mcp_plugin/log_viewer.py --export usage_stats.json
```

## 日志清理

定期清理旧的日志文件：

```bash
# 删除7天前的日志文件
find mcp_plugin/logs/ -name "*.log" -mtime +7 -delete
find mcp_plugin/logs/ -name "*.jsonl" -mtime +7 -delete
```

## 故障排除

### 问题1：没有日志文件生成

可能原因：
- MCP工具没有被调用
- 日志目录权限问题
- 代码执行出错

解决方案：
```bash
# 检查日志目录权限
ls -la mcp_plugin/logs/

# 手动测试工具调用
python mcp_plugin/natural_language_parser.py "分析最近的提交"
```

### 问题2：日志文件为空

可能原因：
- 工具调用失败
- 日志记录代码有问题

解决方案：
```bash
# 检查日志文件内容
cat mcp_plugin/logs/mcp_calls_$(date +%Y%m%d).log

# 检查错误日志
cat mcp_plugin/logs/nl_parser_$(date +%Y%m%d).log
```

### 问题3：监控工具不工作

可能原因：
- 日志文件格式问题
- 权限问题

解决方案：
```bash
# 检查日志文件格式
head -5 mcp_plugin/logs/detailed_calls.jsonl

# 重新生成测试日志
python mcp_plugin/natural_language_parser.py "获取配置"
```

## 高级用法

### 自定义日志格式

可以修改 `codex_integration.py` 中的 `log_tool_call` 函数来自定义日志格式。

### 集成到CI/CD

可以将日志分析集成到持续集成流程中：

```bash
# 在CI脚本中添加
python mcp_plugin/log_viewer.py --summary --export ci_report.json
```

### 告警设置

可以设置脚本监控失败率并发送告警：

```bash
# 检查失败率
python mcp_plugin/log_viewer.py --summary | grep "Success rate"
```

## 总结

通过以上监控工具和方法，你可以：

1. **实时了解** Codex是否调用了MCP工具
2. **追踪性能** 监控工具调用的执行时间
3. **调试问题** 查看详细的错误信息
4. **分析使用情况** 了解工具的使用频率和模式
5. **优化体验** 根据监控数据改进工具性能

建议定期查看监控数据，及时发现和解决问题，确保MCP工具的正常运行。 