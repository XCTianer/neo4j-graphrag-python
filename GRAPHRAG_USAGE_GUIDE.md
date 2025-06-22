# MATLAB代码 GraphRAG 影响分析系统使用指南

## 概述

`matlab_graphrag_analyzer.py` 是一个使用 **neo4j_graphrag 工作流** 的MATLAB代码影响范围分析系统。与之前的版本不同，这个版本充分利用了GraphRAG的智能检索和生成能力。

## 主要改进

### 1. 使用GraphRAG工作流

#### 1.1 核心组件
- ✅ **GraphRAG**: 主要工作流类
- ✅ **Text2CypherRetriever**: 智能检索器
- ✅ **RagTemplate**: 自定义提示模板
- ✅ **OllamaLLM**: 本地LLM集成

#### 1.2 工作流程
```
Git变更 → 解析变更 → 生成查询 → GraphRAG检索 → LLM分析 → 生成报告
```

### 2. 智能检索能力

#### 2.1 自动查询生成
- 基于Git变更自动生成自然语言查询
- 智能识别变量、函数、脚本变更
- 动态生成影响范围分析查询

#### 2.2 语义搜索
- 使用Text2Cypher检索器进行语义搜索
- 自动将自然语言转换为Cypher查询
- 智能检索相关代码关系

### 3. 增强的分析能力

#### 3.1 上下文感知
- 基于Neo4j图数据库的完整上下文
- 智能识别代码依赖关系
- 多层级影响分析

#### 3.2 自然语言分析
- 使用LLM进行深度语义分析
- 自动生成详细的影响报告
- 智能风险评估和建议

## 使用方法

### 1. 基本使用

```bash
# 运行GraphRAG分析器
python matlab_graphrag_analyzer.py
```

### 2. 自定义分析

```python
from matlab_graphrag_analyzer import MATLABGraphRAGAnalyzer

# 创建分析器
analyzer = MATLABGraphRAGAnalyzer()

# 分析Git变更
git_diff = """
diff --git a/calculator.m b/calculator.m
index 1234567..abcdefg 100644
--- a/calculator.m
+++ b/calculator.m
@@ -10,7 +10,7 @@ function result = calculate(x, y)
-    result = x + y;
+    result = x * y;  % 修改计算逻辑
"""

# 使用GraphRAG进行分析
analysis_result = analyzer.analyze_git_changes(git_diff)

# 保存报告
analyzer.save_analysis_report(analysis_result, 'my_analysis_report.md')
```

### 3. 高级功能

#### 3.1 分析最近提交
```python
# 分析最近5个提交
recent_analysis = analyzer.analyze_recent_commits(5)
```

#### 3.2 分析特定变更
```python
# 分析暂存区变更
staged_analysis = analyzer.analyze_staged_changes()

# 分析工作目录变更
working_analysis = analyzer.analyze_working_directory_changes()
```

#### 3.3 自定义查询
```python
# 直接使用GraphRAG进行查询
result = analyzer.analyze_with_graphrag(
    "分析变量x在MATLAB代码中的使用情况",
    return_context=True
)
```

## 输出文件

### 1. 分析报告
- `graphrag_impact_report.md`: 详细的影响分析报告

### 2. 报告内容
```markdown
# MATLAB代码 GraphRAG 影响范围分析报告

**生成时间**: 2024-01-15 14:30:25

---

## 变更概述
- 修改文件: 2 个
- 变更变量: 3 个
- 变更函数: 1 个
- 变更脚本: 1 个

## 综合分析
[基于GraphRAG的智能分析结果]

## 详细分析
### 查询 1
**查询**: 分析变量x在MATLAB代码中的使用情况和影响范围
**分析结果**: [GraphRAG生成的详细分析]

### 查询 2
**查询**: 查找所有使用变量x的函数和脚本
**分析结果**: [GraphRAG生成的详细分析]
```

## 配置要求

### 1. 系统要求
- Python 3.8+
- Git 2.0+
- Neo4j 5.x
- Ollama (用于LLM)

### 2. 环境配置
```bash
# 激活conda环境
conda activate sunny

# 确保Neo4j运行
sudo systemctl status neo4j

# 确保Ollama运行
ollama serve
```

### 3. 数据库连接
- Neo4j URL: `bolt://localhost:7687`
- 用户名: `neo4j`
- 密码: `kotei$88`

## 与旧版本对比

| 功能 | 旧版本 (matlab_enhanced_impact_analyzer.py) | 新版本 (matlab_graphrag_analyzer.py) |
|------|--------------------------------------------|-------------------------------------|
| **检索方式** | 手动Cypher查询 | GraphRAG智能检索 |
| **查询生成** | 预定义模板 | 动态自然语言生成 |
| **上下文处理** | 直接查询结果 | 语义搜索+上下文理解 |
| **LLM集成** | 仅用于报告生成 | 检索+生成一体化 |
| **分析深度** | 基础影响分析 | 深度语义分析 |
| **智能化程度** | 低 | 高 |

## 优势

### 1. 智能化
- 自动理解代码变更语义
- 智能生成相关查询
- 上下文感知的分析

### 2. 准确性
- 基于图数据库的完整关系
- 语义搜索提高准确性
- LLM深度理解代码结构

### 3. 可扩展性
- 易于添加新的查询类型
- 支持自定义提示模板
- 模块化设计

## 故障排除

### 1. GraphRAG相关错误
```bash
# 检查neo4j_graphrag安装
pip list | grep neo4j-graphrag

# 检查Ollama模型
ollama list
```

### 2. 检索器错误
```bash
# 检查Neo4j连接
python -c "from neo4j import GraphDatabase; driver = GraphDatabase.driver('bolt://localhost:7687', auth=('neo4j', 'kotei$88')); print('连接成功')"
```

### 3. LLM错误
```bash
# 测试Ollama
ollama run deepseek-r1:1.5b "Hello"
```

## 示例场景

### 场景1: 分析代码重构
```python
analyzer = MATLABGraphRAGAnalyzer()
analysis = analyzer.analyze_git_changes(git_diff_output)
# GraphRAG会自动识别重构的影响范围
```

### 场景2: 分析新功能添加
```python
# GraphRAG会智能分析新功能与现有代码的关系
result = analyzer.analyze_with_graphrag("分析新添加的函数calculate对现有代码的影响")
```

### 场景3: 分析Bug修复
```python
# GraphRAG会识别修复可能影响的其他代码部分
analysis = analyzer.analyze_staged_changes()
```

## 总结

新的GraphRAG版本提供了：
- 🚀 **智能化**: 自动理解和分析代码变更
- 🎯 **准确性**: 基于语义搜索的精确分析
- 📊 **全面性**: 完整的影响范围评估
- 🔧 **易用性**: 简化的API和自动化流程

这个版本充分利用了neo4j_graphrag的先进功能，为MATLAB代码影响分析提供了更强大、更智能的解决方案。 