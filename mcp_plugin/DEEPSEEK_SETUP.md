# DeepSeek API Key 配置指南

## 概述

本指南说明如何在 Codex 中配置 DeepSeek API Key 以使用 DeepSeek 模型。

## 获取 DeepSeek API Key

1. 访问 [DeepSeek 官网](https://platform.deepseek.com/)
2. 注册或登录账户
3. 进入 API 管理页面
4. 创建新的 API Key
5. 复制 API Key（格式类似：`sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`）

## 配置方法

### 方法1：在 Codex 配置文件中设置（推荐）

编辑 `~/.codex/config.toml` 文件，将 `your-deepseek-api-key-here` 替换为你的实际 API Key：

```toml
# DeepSeek 模型提供者配置
[model_providers.deepseek]
name = "DeepSeek"
base_url = "https://api.deepseek.com/v1"
env_key = "DEEPSEEK_API_KEY"
wire_api = "chat"

# 环境变量设置（请替换为你的实际 API Key）
env = { DEEPSEEK_API_KEY = "sk-your-actual-api-key-here" }
```

### 方法2：设置系统环境变量

在终端中执行：

```bash
# 临时设置（当前会话有效）
export DEEPSEEK_API_KEY="sk-your-actual-api-key-here"

# 永久设置（已添加到 ~/.bashrc）
echo 'export DEEPSEEK_API_KEY="sk-your-actual-api-key-here"' >> ~/.bashrc
source ~/.bashrc
```

### 方法3：使用 Codex 命令设置

```bash
# 使用 Codex 配置命令
codex --config model="deepseek-chat" --config model_provider="deepseek"
```

## 当前配置状态

你的 Codex 配置文件已设置为使用 DeepSeek：

```toml
# 模型配置
model = "deepseek-chat"
model_provider = "deepseek"
approval_policy = "never"

# DeepSeek 模型提供者配置
[model_providers.deepseek]
name = "DeepSeek"
base_url = "https://api.deepseek.com/v1"
env_key = "DEEPSEEK_API_KEY"
wire_api = "chat"

# 环境变量设置（请替换为你的实际 API Key）
env = { DEEPSEEK_API_KEY = "your-deepseek-api-key-here" }
```

## 验证配置

### 1. 检查环境变量
```bash
echo $DEEPSEEK_API_KEY
```

### 2. 测试 Codex 连接
```bash
codex --help
```

### 3. 尝试简单对话
```bash
codex "你好，请介绍一下自己"
```

## 可用的 DeepSeek 模型

配置完成后，你可以使用以下 DeepSeek 模型：

- `deepseek-chat` - DeepSeek Chat 模型
- `deepseek-coder` - DeepSeek Coder 模型（如果可用）

## 故障排除

### 问题1：API Key 无效
**症状：** 收到认证错误
**解决：** 检查 API Key 是否正确，确保没有多余的空格或字符

### 问题2：网络连接问题
**症状：** 连接超时
**解决：** 检查网络连接，确保可以访问 `api.deepseek.com`

### 问题3：模型不可用
**症状：** 模型名称错误
**解决：** 确认模型名称正确，检查 DeepSeek 文档

### 问题4：配置不生效
**症状：** Codex 仍使用默认模型
**解决：** 重启 Codex，检查配置文件语法

## 安全注意事项

1. **不要将 API Key 提交到版本控制系统**
2. **定期轮换 API Key**
3. **监控 API 使用量**
4. **设置使用限制**

## 下一步

配置完成后，你可以：

1. 启动 Codex：`codex`
2. 使用自然语言命令调用 MCP 工具
3. 享受 DeepSeek 模型的强大功能

## 支持

如果遇到问题：
1. 检查 DeepSeek 官方文档
2. 查看 Codex 日志：`~/.codex/logs/codex.log`
3. 验证网络连接和 API Key 有效性 