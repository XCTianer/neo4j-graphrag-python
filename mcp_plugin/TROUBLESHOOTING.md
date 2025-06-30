# Continue MCP 插件故障排除指南

## 🔍 常见问题及解决方案

### 1. "process output STDERR" 错误

**问题描述**: Continue 显示 "process output STDERR" 错误

**可能原因**:
- MCP 服务器启动时输出到 stderr
- 日志级别设置不当
- 环境变量配置问题
- Python 路径问题

**解决方案**:

#### 方案 1: 检查配置
```bash
# 运行最终测试
conda activate sunny
python mcp_plugin/test_continue_final.py
```

#### 方案 2: 手动测试启动脚本
```bash
# 测试启动脚本
conda activate sunny
timeout 5 python mcp_plugin/start_for_continue_final.py
```

#### 方案 3: 检查 Continue 日志
1. 打开 Continue
2. 查看输出面板
3. 寻找具体的错误信息

#### 方案 4: 重启 Continue
1. 完全关闭 Continue
2. 重新启动 Continue
3. 等待 MCP 服务器加载

### 2. 找不到 pydantic_core 包

**问题描述**: ImportError: No module named 'pydantic_core'

**解决方案**:
```bash
# 确保使用正确的 Python 解释器
conda activate sunny
pip install pydantic-core

# 验证安装
python -c "import pydantic_core; print('OK')"
```

### 3. 找不到 neo4j_graphrag 包

**问题描述**: ImportError: No module named 'neo4j_graphrag'

**解决方案**:
```bash
# 检查 Python 路径
conda activate sunny
python mcp_plugin/test_mcp_import.py
```

### 4. MCP 服务器无法启动

**问题描述**: MCP 服务器进程立即退出

**解决方案**:
```bash
# 检查环境
conda activate sunny
python mcp_plugin/debug_continue_mcp.py
```

### 5. Continue 无法连接到 MCP 服务器

**问题描述**: Continue 显示连接错误

**解决方案**:
1. 检查 MCP 配置文件路径
2. 验证启动脚本权限
3. 确认环境变量设置

## 🔧 诊断步骤

### 步骤 1: 环境检查
```bash
conda activate sunny
python --version
which python
pip list | grep pydantic
```

### 步骤 2: 模块导入测试
```bash
python mcp_plugin/test_mcp_import.py
```

### 步骤 3: 配置检查
```bash
python mcp_plugin/test_continue_final.py
```

### 步骤 4: 手动启动测试
```bash
python mcp_plugin/start_for_continue_final.py
```

## 📋 配置文件位置

- **Continue MCP 配置**: `/home/kotei/work/graphrag/.continue/mcpServers/code-change-impact.yaml`
- **启动脚本**: `/home/kotei/work/neo4j-graphrag-python/mcp_plugin/start_for_continue_final.py`
- **Python 解释器**: `/home/kotei/miniconda3/envs/sunny/bin/python`

## 🔄 重置步骤

如果问题持续存在，可以尝试以下重置步骤：

### 1. 清理环境
```bash
conda activate sunny
pip uninstall pydantic pydantic-core
pip install pydantic pydantic-core
```

### 2. 重新配置
```bash
# 备份原配置
cp /home/kotei/work/graphrag/.continue/mcpServers/code-change-impact.yaml /home/kotei/work/graphrag/.continue/mcpServers/code-change-impact.yaml.backup

# 重新创建配置
# (使用之前提供的配置内容)
```

### 3. 重启服务
```bash
# 重启 Continue
# 检查 Neo4j 数据库状态
```

## 📞 获取帮助

如果以上步骤都无法解决问题：

1. **收集错误信息**:
   - Continue 的错误日志
   - 测试脚本的输出
   - 系统环境信息

2. **检查依赖**:
   - Neo4j 数据库状态
   - Python 环境
   - 网络连接

3. **验证配置**:
   - MCP 配置文件语法
   - 文件路径正确性
   - 权限设置

---

**记住**: 大多数问题都可以通过运行 `python mcp_plugin/test_continue_final.py` 来诊断！ 