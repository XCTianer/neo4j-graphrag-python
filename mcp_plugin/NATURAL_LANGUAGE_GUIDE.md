# Codex 自然语言 MCP 使用指南

本指南教你如何在 Codex 中使用自然语言调用 MCP 工具。

## 🚀 快速开始

### 1. 在 Codex 中启动

```bash
# 启动 Codex
cd /home/kotei/work/codex/codex-cli
node ./dist/cli.js
```

### 2. 使用自然语言指令

在 Codex 中直接输入自然语言：

```
请帮我分析最近的代码变更影响
```

## 📋 支持的自然语言命令

### 🔍 分析命令

| 自然语言指令 | 功能 | 示例 |
|-------------|------|------|
| `分析最近的提交` | 分析当前提交的影响 | `分析最近的提交` |
| `分析文件 [文件路径] 的影响` | 分析特定文件的影响 | `分析文件 src/main.py 的影响` |
| `获取 [文件路径] 的影响链` | 获取文件的影响链 | `获取 src/core/engine.py 的影响链` |
| `分析最近 [数量] 个提交` | 分析多个提交 | `分析最近3个提交` |
| `获取影响链，深度 [数字]` | 获取指定深度的影响链 | `获取影响链，深度5` |

### 📊 报告命令

| 自然语言指令 | 功能 | 示例 |
|-------------|------|------|
| `生成分析报告` | 生成综合分析报告 | `生成分析报告` |
| `生成报告并保存到 [文件名]` | 生成并保存报告 | `生成报告并保存到 my_report.md` |
| `获取分析配置` | 获取系统配置 | `获取分析配置` |
| `获取Neo4j查询` | 获取可用的查询 | `获取Neo4j查询` |

### 🔄 高级分析

| 自然语言指令 | 功能 | 示例 |
|-------------|------|------|
| `分析重构 [文件路径] 的影响` | 分析重构影响 | `分析重构 src/core/legacy.py 的影响` |
| `分析 [文件路径] 的性能影响` | 分析性能影响 | `分析 src/optimization/algorithm.py 的性能影响` |
| `分析 [文件路径] 的安全影响` | 分析安全影响 | `分析 src/auth/security.py 的安全影响` |

## 🎯 在 Codex 中的使用场景

### 场景1：代码审查

```
User: "我正在审查这个PR，请帮我分析影响"
Codex: "正在分析PR的影响范围..."
[自动执行: python mcp_plugin/natural_language_parser.py "分析最近的提交"]
Codex: "分析完成！发现以下影响：
- 影响文件数: 3
- 影响链数量: 5
- 建议进行额外测试"
```

### 场景2：重构指导

```
User: "我想重构这个函数，请分析影响"
Codex: "正在分析重构的影响..."
[自动执行: python mcp_plugin/natural_language_parser.py "分析文件 src/core/engine.py 的影响"]
Codex: "分析完成！重构建议：
1. 分阶段重构，先处理低风险部分
2. 更新相关测试
3. 通知依赖此函数的团队"
```

### 场景3：性能优化

```
User: "这个函数性能有问题，请分析影响"
Codex: "正在分析性能影响..."
[自动执行: python mcp_plugin/natural_language_parser.py "分析 src/optimization/algorithm.py 的性能影响"]
Codex: "分析完成！性能优化建议：
1. 优化算法复杂度
2. 添加缓存机制
3. 考虑异步处理"
```

## 🔧 技术实现

### 1. 自然语言解析

解析器使用正则表达式模式匹配：

```python
# 分析提交的模式
r'分析.*提交|analyze.*commit': {
    'tool': 'analyze_code_changes',
    'extract_params': self._extract_commit_hash,
    'description': '分析代码提交的影响'
}

# 分析文件的模式
r'分析.*文件|analyze.*file': {
    'tool': 'get_file_impact',
    'extract_params': self._extract_file_path,
    'description': '分析文件的影响'
}
```

### 2. 参数提取

自动提取关键参数：

- **提交哈希**: 从文本中提取或使用当前HEAD
- **文件路径**: 从引号或特定格式中提取
- **深度**: 从数字中提取影响链深度
- **数量**: 从数字中提取提交数量

### 3. 工具执行

自动激活环境并执行MCP工具：

```bash
source ~/miniconda3/etc/profile.d/conda.sh
conda activate sunny
cd mcp_plugin
python codex_integration.py [tool] '[params]'
```

## 📝 使用示例

### 基本分析

```bash
# 分析最近的提交
python mcp_plugin/natural_language_parser.py "分析最近的提交"

# 分析特定文件
python mcp_plugin/natural_language_parser.py "分析文件 src/main.py 的影响"

# 获取影响链
python mcp_plugin/natural_language_parser.py "获取 src/core/engine.py 的影响链，深度5"
```

### 报告生成

```bash
# 生成分析报告
python mcp_plugin/natural_language_parser.py "生成分析报告"

# 生成并保存报告
python mcp_plugin/natural_language_parser.py "生成报告并保存到 weekly_report.md"
```

### 高级分析

```bash
# 分析重构影响
python mcp_plugin/natural_language_parser.py "分析重构 src/core/legacy.py 的影响"

# 分析性能影响
python mcp_plugin/natural_language_parser.py "分析 src/optimization/algorithm.py 的性能影响"

# 分析安全影响
python mcp_plugin/natural_language_parser.py "分析 src/auth/security.py 的安全影响"
```

## 🎨 在 Codex 中的最佳实践

### 1. 使用清晰的指令

```
✅ 好的指令：
"分析最近的提交"
"分析文件 src/main.py 的影响"
"获取影响链，深度5"

❌ 模糊的指令：
"分析一下"
"看看影响"
"检查代码"
```

### 2. 结合上下文

```
User: "分析这个文件"
Codex: "请指定要分析的文件路径，或者我可以分析最近修改的文件"

User: "分析文件 src/core/engine.py 的影响"
Codex: "正在分析 src/core/engine.py 的影响..."
```

### 3. 使用后续指令

```
User: "分析最近的提交"
Codex: "分析完成！发现高风险变更"

User: "生成详细报告"
Codex: "正在生成详细报告..."
```

## 🚨 故障排除

### 常见问题

1. **指令无法识别**
   ```
   User: "做一些分析"
   Codex: "无法识别指令，请尝试：
   - 分析最近的提交
   - 分析文件 src/main.py 的影响
   - 获取影响链"
   ```

2. **参数缺失**
   ```
   User: "分析文件"
   Codex: "请指定要分析的文件路径，例如：
   - 分析文件 src/main.py
   - 分析文件 src/core/engine.py"
   ```

3. **执行错误**
   ```
   User: "分析最近的提交"
   Codex: "分析过程中遇到错误：Neo4j连接失败
   请检查：
   1. Neo4j服务是否运行
   2. 连接配置是否正确"
   ```

### 调试模式

```bash
# 启用调试模式
export MCP_NATURAL_LANGUAGE_DEBUG=1
python mcp_plugin/natural_language_parser.py "分析最近的提交"
```

## 🎉 总结

通过自然语言MCP集成，你可以：

- **直观交互**: 使用自然语言而不是复杂命令
- **智能解析**: 自动提取参数和上下文
- **无缝集成**: 在Codex中直接使用MCP工具
- **错误处理**: 智能的错误提示和建议
- **上下文感知**: 理解对话上下文

现在你可以在Codex中使用自然语言来调用强大的MCP分析工具了！ 