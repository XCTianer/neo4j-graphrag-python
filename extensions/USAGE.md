# 代码变更影响分析系统使用说明

## 概述

本系统基于Neo4j GraphRAG技术，用于分析GitHub仓库的代码变更记录，生成影响范围分析报告和Neo4j查询语句。

## 系统架构

```
extensions/
├── README.md                 # 扩展功能说明
├── config.py                 # 配置文件
├── main_analyzer.py          # 主分析脚本
├── run_analysis.py           # 运行脚本
├── requirements.py           # 图数据库模式定义
├── USAGE.md                  # 使用说明（本文件）
├── integrations/             # 第三方集成
│   └── github_integration.py # GitHub集成
├── pipelines/                # 分析管道
│   └── code_change_analyzer.py # 代码变更分析器
└── tools/                    # 工具模块
    ├── neo4j_query_generator.py # Neo4j查询生成器
    └── report_generator.py   # 报告生成器
```

## 环境要求

### 1. Conda环境
- 环境名称：`sunny`
- Python版本：>= 3.9

### 2. 依赖服务
- **Neo4j数据库**：
  - URI: `neo4j://localhost:7687`
  - 用户名: `neo4j`
  - 密码: `kotei$88`
  
- **Ollama服务**：
  - 模型: `Qwen2.5-Coder-1.5B:latest`
  - 服务地址: `http://localhost:11434`

### 3. Python依赖
```bash
# 激活环境
conda activate sunny

# 安装依赖
pip install neo4j-graphrag[ollama]
pip install gitpython
```

## 配置说明

### 配置文件：`config.py`

主要配置项：

```python
# Neo4j配置
NEO4J_CONFIG = {
    "uri": "neo4j://localhost:7687",
    "username": "neo4j", 
    "password": "kotei$88"
}

# Ollama配置
OLLAMA_CONFIG = {
    "model": "Qwen2.5-Coder-1.5B:latest",
    "base_url": "http://localhost:11434"
}

# 仓库配置
REPO_CONFIG = {
    "url": "https://github.com/XCTianer/transformer-models.git",
    "analysis_days": 7
}
```

## 使用方法

### 1. 基本使用

```bash
# 激活环境
conda activate sunny

# 进入extensions目录
cd extensions

# 运行分析（使用默认配置）
python run_analysis.py
```

### 2. 命令行选项

```bash
# 查看配置
python run_analysis.py --config

# 验证配置
python run_analysis.py --validate

# 自定义分析天数
python run_analysis.py --days 14

# 自定义输出目录
python run_analysis.py --output-dir my_analysis

# 自定义日志级别
python run_analysis.py --log-level DEBUG

# 自定义仓库URL
python run_analysis.py --repo-url https://github.com/other/repo.git
```

### 3. 完整示例

```bash
# 分析最近14天的变更，输出到custom_output目录
python run_analysis.py \
    --days 14 \
    --output-dir custom_output \
    --log-level INFO
```

## 输出文件

分析完成后，会在输出目录中生成以下文件：

### 1. 代码变更记录影响范围分析报告.md
- 仓库信息概览
- 分析周期统计
- 总体影响分析
- 详细提交分析
- 风险等级评估
- 依赖链分析
- 建议和后续行动

### 2. 代码变更记录影响链路的查询语句.cypher
- 按提交分组的Neo4j查询语句
- 实体影响查询
- 关系影响查询
- 依赖链查询

### 3. 带查询语句的neo4j链接.md
- Neo4j浏览器访问链接
- 快速查询链接
- 提交特定查询链接
- 使用说明

## 图数据库模式

系统使用以下图数据库模式：

### 节点类型
- **Function**: 函数定义
- **Variable**: 变量定义
- **Script**: 脚本文件

### 关系类型
- **CALLS**: 调用关系
- **USES**: 使用关系
- **DEFINES**: 定义关系
- **MODIFIES**: 修改关系
- **ASSIGNED_TO**: 赋值关系

## 故障排除

### 1. 环境问题
```bash
# 检查当前环境
conda info --envs

# 激活正确环境
conda activate sunny

# 检查Python版本
python --version
```

### 2. 依赖问题
```bash
# 检查Neo4j连接
python -c "from neo4j import GraphDatabase; print('Neo4j driver OK')"

# 检查Neo4j GraphRAG
python -c "from neo4j_graphrag import __version__; print(f'GraphRAG version: {__version__}')"
```

### 3. 服务问题
```bash
# 检查Neo4j服务
curl -u neo4j:kotei$88 http://localhost:7474/browser/

# 检查Ollama服务
curl http://localhost:11434/api/tags
```

### 4. 权限问题
```bash
# 确保脚本有执行权限
chmod +x run_analysis.py

# 确保输出目录可写
mkdir -p analysis_output
chmod 755 analysis_output
```

## 高级配置

### 1. 自定义模式
修改 `requirements.py` 中的 `SCHEMA` 定义来自定义图数据库模式。

### 2. 自定义风险评估
修改 `config.py` 中的 `RISK_CONFIG` 来自定义风险评估阈值。

### 3. 自定义输出格式
修改 `tools/report_generator.py` 来自定义报告格式。

## 监控和日志

### 日志文件
- 位置：`code_change_analysis.log`
- 级别：INFO（可配置）
- 格式：时间戳 - 模块 - 级别 - 消息

### 监控指标
- 分析时间
- 处理的提交数量
- 影响的实体数量
- 风险等级分布

## 扩展开发

### 1. 添加新的集成
在 `integrations/` 目录下创建新的集成模块。

### 2. 添加新的分析器
在 `pipelines/` 目录下创建新的分析管道。

### 3. 添加新的工具
在 `tools/` 目录下创建新的工具模块。

## 常见问题

### Q: 如何修改分析的时间范围？
A: 使用 `--days` 参数，例如：`python run_analysis.py --days 30`

### Q: 如何分析不同的仓库？
A: 使用 `--repo-url` 参数，例如：`python run_analysis.py --repo-url https://github.com/user/repo.git`

### Q: 如何查看详细的调试信息？
A: 使用 `--log-level DEBUG` 参数

### Q: Neo4j浏览器无法访问？
A: 检查Neo4j服务是否运行，默认端口是7474

### Q: Ollama模型加载失败？
A: 确保Ollama服务运行且模型已下载：`ollama pull Qwen2.5-Coder-1.5B:latest`

## 联系支持

如有问题，请检查：
1. 环境配置是否正确
2. 依赖服务是否运行
3. 日志文件中的错误信息
4. 配置文件是否正确

---

*最后更新：2024年12月* 