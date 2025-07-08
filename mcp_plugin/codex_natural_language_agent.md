# Codex Natural Language MCP Agent

This agent allows you to use natural language to interact with MCP tools in Codex.

## Agent Configuration

### Agent Name: MCP Natural Language Analyzer

**Purpose**: Analyze code changes and dependencies using natural language commands.

**Capabilities**:
- Parse natural language instructions
- Execute MCP tools automatically
- Generate analysis reports
- Provide intelligent suggestions

## Natural Language Commands

### 1. Code Analysis Commands

#### Analyze Commits
```
"分析最近的提交"
"analyze the recent commit"
"分析提交 abc123"
"analyze commit abc123"
```

#### Analyze Files
```
"分析文件 src/main.py 的影响"
"analyze the impact of file src/main.py"
"分析 src/core/engine.py"
"analyze file src/core/engine.py"
```

#### Get Impact Chains
```
"获取 src/main.py 的影响链"
"get impact chains for src/main.py"
"获取影响链，深度5"
"get impact chains with depth 5"
```

### 2. Report Generation Commands

#### Generate Reports
```
"生成分析报告"
"generate analysis report"
"生成报告并保存到 my_report.md"
"generate report and save to my_report.md"
```

#### Get Configuration
```
"获取分析配置"
"get analysis configuration"
"显示系统配置"
"show system configuration"
```

### 3. Advanced Analysis Commands

#### Recent Changes Analysis
```
"分析最近3个提交"
"analyze recent 3 commits"
"分析最近的代码变更"
"analyze recent code changes"
```

#### Refactoring Impact
```
"分析重构 src/core/legacy.py 的影响"
"analyze refactoring impact of src/core/legacy.py"
"重构影响评估"
"refactoring impact assessment"
```

#### Performance Impact
```
"分析 src/optimization/algorithm.py 的性能影响"
"analyze performance impact of src/optimization/algorithm.py"
"性能影响分析"
"performance impact analysis"
```

#### Security Impact
```
"分析 src/auth/security.py 的安全影响"
"analyze security impact of src/auth/security.py"
"安全影响评估"
"security impact assessment"
```

## Usage in Codex

### Method 1: Direct Natural Language Commands

In Codex, you can directly use natural language:

```
请帮我分析最近的代码变更影响
```

Codex will automatically:
1. Parse the natural language
2. Execute the appropriate MCP tool
3. Return the analysis results

### Method 2: Using the Natural Language Parser

```bash
# In Codex terminal
python mcp_plugin/natural_language_parser.py "分析最近的提交"
python mcp_plugin/natural_language_parser.py "分析文件 src/main.py 的影响"
python mcp_plugin/natural_language_parser.py "获取影响链，深度5"
```

### Method 3: Interactive Mode

```bash
# Start interactive mode
python mcp_plugin/natural_language_parser.py --interactive
```

Then you can type natural language commands interactively.

## Agent Workflow

### 1. Natural Language Processing
- Parse user input using regex patterns
- Extract relevant parameters (file paths, commit hashes, depths)
- Identify the appropriate MCP tool to call

### 2. Tool Execution
- Activate the conda environment
- Execute the MCP tool with extracted parameters
- Handle errors and provide feedback

### 3. Result Processing
- Format the results for easy reading
- Provide additional context and suggestions
- Generate follow-up recommendations

## Example Conversations

### Example 1: Basic Analysis
```
User: "分析最近的提交"
Agent: "正在分析最近的提交..."
[Executes: python mcp_plugin/codex_integration.py analyze_code_changes '{"commit_hash": "HEAD"}']
Agent: "分析完成！发现以下影响：
- 影响文件数: 3
- 影响链数量: 5
- 建议进行额外测试"
```

### Example 2: File Impact Analysis
```
User: "分析文件 src/core/engine.py 的影响"
Agent: "正在分析 src/core/engine.py 的影响..."
[Executes: python mcp_plugin/codex_integration.py get_file_impact '{"file_path": "src/core/engine.py"}']
Agent: "分析完成！该文件的影响范围：
- 直接依赖: 5个文件
- 间接依赖: 12个文件
- 建议重构以减少耦合"
```

### Example 3: Impact Chain Analysis
```
User: "获取 src/main.py 的影响链，深度5"
Agent: "正在获取 src/main.py 的影响链，深度5..."
[Executes: python mcp_plugin/codex_integration.py get_impact_chains '{"file_path": "src/main.py", "max_depth": 5}']
Agent: "影响链分析完成！发现：
- 1级依赖: 3个文件
- 2级依赖: 8个文件
- 3级依赖: 15个文件
- 4级依赖: 22个文件
- 5级依赖: 31个文件"
```

## Advanced Features

### 1. Context Awareness
The agent can understand context from previous commands:
```
User: "分析这个文件"
Agent: "请指定要分析的文件路径，或者我可以分析最近修改的文件"
```

### 2. Intelligent Suggestions
Based on analysis results, the agent provides suggestions:
```
User: "分析最近的提交"
Agent: "分析完成！发现高风险变更，建议：
1. 运行完整的测试套件
2. 进行代码审查
3. 监控生产环境"
```

### 3. Batch Operations
The agent can handle multiple operations:
```
User: "分析所有核心文件的影响"
Agent: "正在分析核心文件：
- src/core/engine.py
- src/core/database.py
- src/core/cache.py
[Executes multiple analyses]
分析完成！总体影响评估：中等风险"
```

## Error Handling

### 1. Unrecognized Commands
```
User: "做一些分析"
Agent: "无法识别指令，请尝试以下格式：
- 分析最近的提交
- 分析文件 src/main.py 的影响
- 获取 src/core/engine.py 的影响链
- 生成分析报告"
```

### 2. Missing Parameters
```
User: "分析文件"
Agent: "请指定要分析的文件路径，例如：
- 分析文件 src/main.py
- 分析文件 src/core/engine.py"
```

### 3. Tool Execution Errors
```
User: "分析最近的提交"
Agent: "分析过程中遇到错误：Neo4j连接失败
请检查：
1. Neo4j服务是否运行
2. 连接配置是否正确
3. 网络连接是否正常"
```

## Integration with Codex Workflows

### 1. Code Review Workflow
```
User: "我正在审查这个PR，请帮我分析影响"
Agent: "正在分析PR的影响范围...
[Executes analysis]
分析完成！建议关注以下高风险变更：
1. src/core/engine.py - 影响15个文件
2. src/auth/security.py - 影响8个文件
建议进行额外的安全测试"
```

### 2. Refactoring Workflow
```
User: "我想重构这个函数，请分析影响"
Agent: "正在分析重构的影响...
[Executes impact analysis]
分析完成！重构建议：
1. 分阶段重构，先处理低风险部分
2. 更新相关测试
3. 通知依赖此函数的团队"
```

### 3. Performance Optimization Workflow
```
User: "这个函数性能有问题，请分析影响"
Agent: "正在分析性能影响...
[Executes performance impact analysis]
分析完成！性能优化建议：
1. 优化算法复杂度
2. 添加缓存机制
3. 考虑异步处理"
```

## Configuration

### Environment Variables
```bash
export MCP_NATURAL_LANGUAGE_DEBUG=1  # Enable debug mode
export MCP_DEFAULT_DEPTH=3           # Default impact chain depth
export MCP_DEFAULT_COMMIT_COUNT=5    # Default commit count for analysis
```

### Custom Patterns
You can add custom natural language patterns in `natural_language_parser.py`:

```python
# Add custom pattern
r'我的.*分析|my.*analysis': {
    'tool': 'custom_analysis',
    'extract_params': custom_param_extractor,
    'description': '自定义分析'
}
```

## Best Practices

1. **Be Specific**: Use specific file paths and commit hashes when possible
2. **Use Context**: Reference previous analysis results in follow-up commands
3. **Check Results**: Always review analysis results before making decisions
4. **Combine Commands**: Use multiple commands for comprehensive analysis
5. **Save Reports**: Generate and save reports for future reference

## Troubleshooting

### Common Issues

1. **Command Not Recognized**
   - Check the command format
   - Use the suggested command patterns
   - Try simpler commands first

2. **Analysis Fails**
   - Check Neo4j connection
   - Verify file paths exist
   - Ensure conda environment is activated

3. **Slow Performance**
   - Reduce analysis depth
   - Limit the number of commits analyzed
   - Use more specific file paths

### Debug Mode
```bash
export MCP_NATURAL_LANGUAGE_DEBUG=1
python mcp_plugin/natural_language_parser.py "分析最近的提交"
```

This will provide detailed information about the parsing and execution process. 