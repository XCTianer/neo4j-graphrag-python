# Cursor MCP插件配置指南

## 🎯 配置完成！

您的代码变更影响分析MCP插件已成功配置到Cursor中。

## 📁 配置文件位置

- **MCP配置**: `~/.config/Cursor/User/mcp.json`
- **启动脚本**: `/home/kotei/work/neo4j-graphrag-python/mcp_plugin/start_for_cursor.sh`
- **备份设置**: `~/.config/Cursor/User/settings.json.backup`

## 🔧 配置详情

### MCP服务器配置
```json
{
    "mcpServers": {
        "code-change-impact": {
            "command": "/home/kotei/work/neo4j-graphrag-python/mcp_plugin/start_for_cursor.sh",
            "description": "Code Change Impact Analysis using Neo4j GraphRAG",
            "capabilities": {
                "tools": [
                    "analyze_code_changes",
                    "get_impact_chains", 
                    "get_file_impact",
                    "get_commit_analysis",
                    "get_neo4j_queries",
                    "get_analysis_config",
                    "update_config"
                ]
            }
        }
    }
}
```

## 🚀 使用方法

### 1. 重启Cursor
配置完成后，请重启Cursor以加载MCP插件。

### 2. 在Cursor中使用MCP功能

#### 方法1: 通过Chat界面
在Cursor的Chat界面中，您可以：
- 询问代码变更影响分析
- 请求特定仓库的分析
- 获取影响链路信息

**示例对话**：
```
用户: 请分析 https://github.com/XCTianer/transformer-models 仓库的代码变更影响

AI: 我将使用MCP插件为您分析代码变更影响...
```

#### 方法2: 通过命令面板
1. 按 `Ctrl+Shift+P` 打开命令面板
2. 搜索 "MCP" 相关命令
3. 选择相应的MCP功能

### 3. 可用的MCP功能

#### analyze_code_changes
- **功能**: 全面的代码变更分析
- **参数**: 
  - `repo_url`: 仓库URL
  - `days`: 分析天数（默认7天）
  - `detailed_chains`: 是否生成详细链路分析
  - `show_chains`: 是否在输出中显示链路

#### get_impact_chains
- **功能**: 获取影响链路
- **参数**:
  - `repo_url`: 仓库URL
  - `severity_filter`: 严重程度过滤（HIGH/MEDIUM/LOW）

#### get_file_impact
- **功能**: 文件级影响分析
- **参数**:
  - `repo_url`: 仓库URL
  - `file_path`: 特定文件路径

#### get_commit_analysis
- **功能**: 提交级分析
- **参数**:
  - `repo_url`: 仓库URL
  - `commit_hash`: 提交哈希

#### get_neo4j_queries
- **功能**: 获取Neo4j查询语句
- **参数**:
  - `repo_url`: 仓库URL

#### get_analysis_config
- **功能**: 获取当前配置
- **参数**: 无

#### update_config
- **功能**: 更新配置
- **参数**:
  - `config_updates`: 配置更新对象

## 🔍 故障排除

### 1. 检查MCP服务器状态
```bash
cd /home/kotei/work/neo4j-graphrag-python/mcp_plugin
python test_cursor_integration.py
```

### 2. 查看Cursor日志
1. 打开Cursor
2. 按 `Ctrl+Shift+P`
3. 搜索 "Developer: Toggle Developer Tools"
4. 查看Console标签页的日志

### 3. 常见问题

#### MCP服务器无法启动
- 检查Python环境：`conda activate sunny`
- 检查依赖：`python -c "import neo4j, pydantic, yaml"`
- 检查启动脚本权限：`chmod +x start_for_cursor.sh`

#### 配置不生效
- 确认配置文件路径正确
- 重启Cursor
- 检查JSON格式是否正确

#### 代理问题
- 临时禁用代理：`unset http_proxy https_proxy`
- 或修改启动脚本中的环境变量

## 📊 输出文件

分析完成后，会在以下位置生成文件：
- **分析报告**: `analysis_output/代码变更记录影响范围分析报告.md`
- **影响链路报告**: `analysis_output/影响链路详细报告.md`
- **Neo4j查询**: `analysis_output/影响链路查询语句.cypher`
- **可视化说明**: `analysis_output/图形显示使用说明.md`

## 🎉 使用示例

### 示例1: 分析仓库变更
```
用户: 请分析 https://github.com/XCTianer/transformer-models 最近7天的代码变更影响

AI: 我将使用代码变更影响分析插件为您分析这个仓库...
```

### 示例2: 获取高风险影响链路
```
用户: 请获取该仓库的高风险影响链路

AI: 我将查询高风险影响链路...
```

### 示例3: 分析特定文件
```
用户: 请分析 src/main.py 文件的影响

AI: 我将分析该文件的变更影响...
```

## 📞 支持

如果遇到问题：
1. 运行测试脚本：`python test_cursor_integration.py`
2. 检查Cursor开发者工具中的日志
3. 查看生成的报告文件
4. 参考主项目的README.md文档

## 🔄 更新配置

如需更新配置：
1. 编辑 `~/.config/Cursor/User/mcp.json`
2. 重启Cursor
3. 或使用 `update_config` MCP方法动态更新

---

**配置完成！您现在可以在Cursor中使用代码变更影响分析功能了。** 🎉 