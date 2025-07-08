# Codex MCP 自动化集成指南

本指南提供了完整的自动化方案，将 Neo4j GraphRAG MCP 工具与 Codex 深度集成。

## 🚀 快速开始

### 1. 一键安装

```bash
# 运行自动化安装脚本
./mcp_plugin/install_codex_integration.sh
```

这个脚本会自动：
- 检查并配置环境
- 安装依赖
- 设置 Git hooks
- 创建桌面快捷方式
- 配置 shell 别名
- 生成使用文档

### 2. 配置 Neo4j

编辑 `mcp_plugin/config.yaml`：

```yaml
neo4j:
  uri: "bolt://localhost:7687"
  username: "neo4j"
  password: "your_password"
  database: "neo4j"
```

### 3. 测试集成

```bash
# 重新加载 shell 配置
source ~/.bashrc

# 测试基本功能
mcp-analyze $(git rev-parse HEAD)
mcp-impact src/main.py
mcp-report
```

## 📋 自动化方案概览

### 方案1：命令行自动化 (`codex_automation.py`)

**功能**：批量分析、报告生成、提示创建

```bash
# 分析最近的提交
python mcp_plugin/codex_automation.py --action analyze --commits 5

# 生成综合报告
python mcp_plugin/codex_automation.py --action report --output my_report.md

# 创建 Codex 提示
python mcp_plugin/codex_automation.py --action prompt

# 分析特定文件
python mcp_plugin/codex_automation.py --action file-impact --file src/main.py

# 获取影响链
python mcp_plugin/codex_automation.py --action impact-chains --file src/main.py --depth 5
```

### 方案2：Shell 包装器 (`codex_wrapper.sh`)

**功能**：简化的命令行接口

```bash
# 分析代码变更
./mcp_plugin/codex_wrapper.sh analyze_code_changes abc123

# 获取文件影响
./mcp_plugin/codex_wrapper.sh get_file_impact src/main.py

# 获取影响链
./mcp_plugin/codex_wrapper.sh get_impact_chains src/main.py 3

# 获取系统配置
./mcp_plugin/codex_wrapper.sh get_analysis_config
```

### 方案3：Git Hooks 自动化

**功能**：提交时自动分析

#### Pre-commit Hook
- 分析暂存文件
- 生成影响摘要
- 提供风险警告

#### Post-commit Hook
- 生成详细分析报告
- 更新项目文档
- 发送通知（可选）

### 方案4：Shell 别名

**功能**：快速访问常用命令

```bash
# 快速分析
mcp-analyze $(git rev-parse HEAD)    # 分析当前提交
mcp-impact src/main.py               # 分析文件影响
mcp-chains src/main.py 5             # 获取影响链（深度5）

# 报告生成
mcp-report                           # 生成综合报告
mcp-prompt                           # 生成 Codex 提示

# Codex 集成
codex-mcp                            # 启动 Codex
```

## 🤖 自动化代理 (Agents)

### Code Impact Analyzer

**用途**：自动分析代码变更影响

```bash
# 手动触发
git log --oneline -3
for commit in $(git log --oneline -3 | awk '{print $1}'); do
    ./mcp_plugin/codex_wrapper.sh analyze_code_changes $commit
done

# 自动触发（通过 Git hooks）
git add .
git commit -m "Update feature"
# 自动运行分析
```

### File Dependency Analyzer

**用途**：分析文件依赖和影响链

```bash
# 分析特定文件
./mcp_plugin/codex_wrapper.sh get_file_impact "src/core/engine.py"
./mcp_plugin/codex_wrapper.sh get_impact_chains "src/core/engine.py" 5

# 生成依赖图
python mcp_plugin/codex_automation.py --action impact-chains --file "src/core/engine.py" --depth 5
```

### System Health Monitor

**用途**：监控系统配置和健康状态

```bash
# 检查系统配置
./mcp_plugin/codex_wrapper.sh get_analysis_config
./mcp_plugin/codex_wrapper.sh get_neo4j_queries

# 测试集成
python mcp_plugin/simple_codex_test.py
```

## 🔄 工作流自动化

### 1. 日常代码审查工作流

```bash
# 创建每日审查脚本
cat > daily_review.sh << 'EOF'
#!/bin/bash
echo "🔍 Daily Code Review - $(date)"

# 分析最近的提交
python mcp_plugin/codex_automation.py --action analyze --commits 5

# 生成报告
python mcp_plugin/codex_automation.py --action report --output daily_review_$(date +%Y%m%d).md

# 发送通知（可选）
echo "Daily review completed. Check daily_review_$(date +%Y%m%d).md"
EOF

chmod +x daily_review.sh
```

### 2. 预合并分析工作流

```bash
# 创建预合并分析脚本
cat > pre_merge_analysis.sh << 'EOF'
#!/bin/bash
CURRENT_BRANCH=$(git branch --show-current)
TARGET_BRANCH="main"

echo "🔍 Pre-merge Analysis: $CURRENT_BRANCH -> $TARGET_BRANCH"

# 获取要合并的提交
COMMITS_TO_MERGE=$(git log --oneline $TARGET_BRANCH..$CURRENT_BRANCH | awk '{print $1}')

for commit in $COMMITS_TO_MERGE; do
    echo "Analyzing commit: $commit"
    ./mcp_plugin/codex_wrapper.sh analyze_code_changes $commit
done

echo "Pre-merge analysis completed"
EOF

chmod +x pre_merge_analysis.sh
```

### 3. 重构影响评估工作流

```bash
# 创建重构评估脚本
cat > refactor_assessment.sh << 'EOF'
#!/bin/bash
TARGET_FILE="$1"
if [ -z "$TARGET_FILE" ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

echo "🔍 Refactoring Impact Assessment: $TARGET_FILE"

# 获取当前影响
./mcp_plugin/codex_wrapper.sh get_file_impact "$TARGET_FILE"
./mcp_plugin/codex_wrapper.sh get_impact_chains "$TARGET_FILE" 5

# 生成重构计划
python mcp_plugin/codex_automation.py --action prompt > refactoring_plan.md

echo "Refactoring assessment completed. Check refactoring_plan.md"
EOF

chmod +x refactor_assessment.sh
```

## 🎯 Codex 集成使用

### 1. 启动 Codex 与 MCP 集成

```bash
# 方法1：使用别名
codex-mcp

# 方法2：使用启动脚本
./mcp_plugin/start_codex_mcp.sh

# 方法3：使用桌面快捷方式
# 双击 "Codex MCP Analysis" 桌面图标
```

### 2. 在 Codex 中使用 MCP 工具

#### 基本使用
```
请帮我分析最近的代码变更影响：

1. 获取最近的提交哈希
2. 使用 MCP 工具分析影响
3. 生成影响报告

命令：
git rev-parse HEAD
./mcp_plugin/codex_wrapper.sh analyze_code_changes $(git rev-parse HEAD)
```

#### 高级使用
```
我正在重构 src/core/engine.py，请帮我：

1. 运行文件依赖分析器
2. 分析影响链
3. 建议安全的重构策略
4. 生成分步重构计划

命令：
./mcp_plugin/codex_wrapper.sh get_file_impact "src/core/engine.py"
./mcp_plugin/codex_wrapper.sh get_impact_chains "src/core/engine.py" 5
python mcp_plugin/codex_automation.py --action prompt
```

### 3. 自动化 Codex 提示

```bash
# 生成针对最近变更的提示
python mcp_plugin/codex_automation.py --action prompt > codex_prompt.md

# 在 Codex 中使用生成的提示
cat codex_prompt.md
```

## 📊 报告和分析

### 1. 自动报告生成

```bash
# 生成综合报告
mcp-report

# 生成特定时间范围的报告
python mcp_plugin/codex_automation.py --action report --output weekly_report.md

# 查看最新报告
ls -la analysis_reports/
cat analysis_reports/latest_commit_analysis.md
```

### 2. 影响分析可视化

```bash
# 获取影响链数据
./mcp_plugin/codex_wrapper.sh get_impact_chains "src/main.py" 5 > impact_data.json

# 使用 Codex 生成可视化代码
codex "基于 impact_data.json 生成一个交互式的依赖关系图，使用 D3.js 或 Plotly"
```

### 3. 性能影响分析

```bash
# 分析性能关键文件
PERFORMANCE_FILES=("src/core/engine.py" "src/optimization/algorithm.py")

for file in "${PERFORMANCE_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "Analyzing performance impact: $file"
        ./mcp_plugin/codex_wrapper.sh get_impact_chains "$file" 5
    fi
done
```

## 🔧 配置和自定义

### 1. 环境配置

```bash
# 激活环境
conda activate sunny

# 检查配置
python mcp_plugin/codex_automation.py --action report --project-root /path/to/project
```

### 2. 自定义分析参数

编辑 `mcp_plugin/config.yaml`：

```yaml
analysis:
  max_depth: 5                    # 影响链最大深度
  include_tests: true             # 包含测试文件
  include_docs: false             # 包含文档文件
  high_impact_threshold: 10       # 高影响阈值

codex_integration:
  enabled: true
  auto_analyze: true
  report_dir: "analysis_reports"
  notification_enabled: false
```

### 3. 自定义 Git Hooks

```bash
# 编辑 pre-commit hook
vim .git/hooks/pre-commit

# 编辑 post-commit hook
vim .git/hooks/post-commit

# 重新安装 hooks
./mcp_plugin/install_codex_integration.sh
```

## 🚨 故障排除

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
   ./mcp_plugin/codex_wrapper.sh get_analysis_config
   ```

3. **权限问题**
   ```bash
   # 确保脚本有执行权限
   chmod +x mcp_plugin/*.sh
   chmod +x mcp_plugin/git_hooks/*
   ```

### 调试技巧

1. **启用详细日志**
   ```bash
   export MCP_DEBUG=1
   ./mcp_plugin/codex_wrapper.sh analyze_code_changes $(git rev-parse HEAD)
   ```

2. **测试单个组件**
   ```bash
   python mcp_plugin/simple_codex_test.py
   python mcp_plugin/test_codex_integration.py
   ```

3. **检查系统状态**
   ```bash
   # 检查所有组件
   ./mcp_plugin/install_codex_integration.sh
   ```

## 📈 最佳实践

1. **定期更新**：保持 MCP 插件和依赖的最新版本
2. **数据备份**：定期备份 Neo4j 数据库
3. **性能监控**：监控分析性能，避免超时
4. **结果验证**：手动验证关键的分析结果
5. **文档维护**：保持使用文档的更新
6. **团队培训**：培训团队成员使用自动化工具

## 🎉 总结

通过这套完整的自动化方案，你可以：

- **一键安装**：自动化环境配置和工具安装
- **智能分析**：自动分析代码变更和影响
- **无缝集成**：在 Codex 中直接使用 MCP 工具
- **自动化工作流**：Git hooks 和脚本自动化
- **丰富报告**：自动生成详细的分析报告
- **团队协作**：标准化的代码审查和分析流程

这套方案将大大提高你的开发效率，减少代码变更带来的风险，并帮助团队更好地理解代码依赖关系。 