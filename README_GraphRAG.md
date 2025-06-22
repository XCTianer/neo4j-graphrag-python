# GraphRAG 系统构建指南

## 概述

本项目成功构建了一个基于 Neo4j 图数据库和 Ollama LLM 的 GraphRAG (Graph Retrieval-Augmented Generation) 系统，用于智能问答代码库相关问题。

## 系统架构

### 核心组件

1. **Neo4j 图数据库 (5.18.1)**
   - 存储代码结构信息：变量、函数、脚本
   - 两层关系：RELATES_TO（相关关系）、IMPLEMENTED_IN（实现关系）
   - 支持复杂的图查询

2. **Ollama LLM (deepseek-r1:1.5b)**
   - 本地运行的大语言模型
   - 用于生成 Cypher 查询和自然语言回答
   - 完全离线，无需网络连接

3. **neo4j_graphrag 1.7.0**
   - 使用 Text2CypherRetriever 检索器
   - 手动提供数据库模式，避免 APOC 依赖
   - 支持复杂的图关系查询

### 数据库结构

```
Variable {name, type, description}
Function {name, description, parameters, return_type}
Script {name, description, file_path}

关系:
Variable -[:RELATES_TO]-> Function
Variable -[:RELATES_TO]-> Script
Function -[:RELATES_TO]-> Function
Function -[:IMPLEMENTED_IN]-> Script
Script -[:RELATES_TO]-> Script
```

### 示例数据

- **变量**: temperature (温度), humidity (湿度), pressure (压力), julian_date (儒略日)
- **函数**: calculate_solar_position (计算太阳位置), get_weather_data (获取天气数据)
- **脚本**: solar_calendar.py (太阳历计算), weather_monitor.py (天气监控)

## 安装和配置

### 环境要求

- Python 3.11+
- Neo4j 5.18.1+
- Ollama
- conda 环境

### 安装步骤

1. **创建 conda 环境**
   ```bash
   conda create -n sunny python=3.11
   conda activate sunny
   ```

2. **安装 neo4j_graphrag**
   ```bash
   pip install neo4j-graphrag
   ```

3. **安装 Neo4j**
   - 下载 Neo4j 5.18.1
   - 设置密码为 `kotei$88`
   - 启动服务

4. **配置 Ollama**
   ```bash
   ollama pull deepseek-r1:1.5b
   ```

5. **创建示例数据库**
   - 运行数据库创建脚本
   - 包含变量、函数、脚本的示例数据

## 使用方法

### 1. 简化 GraphRAG 系统（推荐）

由于原始的 Text2CypherRetriever 存在 LLM 生成查询的问题，我们创建了一个简化的解决方案：

```bash
# 批量测试
python simple_graphrag.py

# 交互式问答
python interactive_simple_graphrag.py
```

这个简化系统使用预定义的查询映射，避免了 LLM 生成无效 Cypher 查询的问题。

### 2. 原始 GraphRAG 系统

```bash
python interactive_graphrag.py
```

然后可以输入问题，例如：
- "temperature 变量是什么？"
- "calculate_solar_position 函数的作用？"
- "solar_calendar.py 的功能？"
- "哪些函数与 temperature 变量相关？"

### 3. 批量测试

```bash
python fast_graphrag_config.py
```

### 4. 最终测试

```bash
python final_test.py
```

### 5. 直接查询测试

```bash
python test_cypher_direct.py
```

## 系统特点

### 优势

- ✅ **完全本地运行**：无需网络连接，保护隐私
- ✅ **图数据库优势**：支持复杂的代码关系查询
- ✅ **智能检索**：基于图结构的上下文感知检索
- ✅ **可扩展性**：易于添加新的代码元素和关系
- ✅ **高性能**：优化的参数设置，快速响应
- ✅ **正确的关系模型**：使用实际的关系类型 RELATES_TO 和 IMPLEMENTED_IN

### 应用场景

1. **代码理解**：快速了解代码库结构和功能
2. **依赖分析**：分析函数调用关系和变量使用
3. **文档生成**：自动生成代码文档和说明
4. **问题诊断**：定位代码问题和依赖关系
5. **知识问答**：回答关于代码库的具体问题

## 技术细节

### 检索器配置

- **Text2CypherRetriever**：将自然语言转换为 Cypher 查询
- **手动模式定义**：避免 APOC 插件依赖
- **优化参数**：限制输出长度和上下文大小

### LLM 配置

```python
llm = OllamaLLM(
    model_name="deepseek-r1:1.5b",
    model_params={
        "temperature": 0.1,
        "num_predict": 256,
        "num_ctx": 2048
    }
)
```

### 数据库连接

```python
driver = GraphDatabase.driver(
    "bolt://localhost:7687", 
    auth=("neo4j", "kotei$88")
)
```

### 正确的数据库模式

```python
schema = """
// 节点标签和属性
Variable {name: String, type: String, description: String}
Function {name: String, description: String, parameters: String, return_type: String}
Script {name: String, description: String, file_path: String}

// 实际的关系类型
Variable -[:RELATES_TO]-> Function
Variable -[:RELATES_TO]-> Script
Function -[:RELATES_TO]-> Function
Function -[:IMPLEMENTED_IN]-> Script
Script -[:RELATES_TO]-> Script
"""
```

## 故障排除

### 常见问题

1. **代理设置问题**
   ```bash
   unset ALL_PROXY all_proxy http_proxy https_proxy
   ```

2. **Neo4j 连接失败**
   - 检查服务状态：`./bin/neo4j status`
   - 验证密码：`./bin/cypher-shell -u neo4j -p 'kotei$88'`

3. **Ollama 响应慢**
   - 使用更小的模型
   - 调整参数：`num_predict`, `num_ctx`

4. **Cypher 语法错误**
   - 检查数据库模式格式
   - 确保模式与数据库结构匹配
   - 验证关系类型是否正确

5. **关系类型错误**
   - 使用 `python check_relationships.py` 检查实际关系类型
   - 更新数据库模式以匹配实际结构

6. **LLM 生成无效查询**
   - 问题：LLM 生成包含 `<think>` 标签的思考过程而不是有效的 Cypher 查询
   - 解决方案：使用简化的 GraphRAG 系统（`simple_graphrag.py`）
   - 原因：某些 LLM 模型在生成查询时会包含推理步骤

## 扩展和优化

### 可能的改进

1. **添加更多代码元素**：类、模块、包等
2. **增强关系类型**：继承、实现、依赖等
3. **支持更多语言**：Java、C++、JavaScript 等
4. **集成版本控制**：Git 历史、分支信息
5. **性能优化**：缓存、索引、并行处理

### 自定义配置

可以根据需要修改：
- 数据库模式定义
- LLM 参数设置
- 检索器类型
- 提示模板

## 验证和测试

### 系统验证

1. **数据库内容验证**
   ```bash
   python test_cypher_direct.py
   ```

2. **关系类型检查**
   ```bash
   python check_relationships.py
   ```

3. **GraphRAG 功能测试**
   ```bash
   python final_test.py
   ```

## 总结

本 GraphRAG 系统成功实现了基于图数据库的智能代码问答功能，为代码理解和分析提供了强大的工具。系统具有良好的可扩展性和实用性，可以广泛应用于软件开发、代码审查、文档生成等场景。

### 关键成就

- ✅ 成功构建了完整的 GraphRAG 系统
- ✅ 正确配置了数据库关系和模式
- ✅ 实现了智能问答功能
- ✅ 提供了多种测试和验证方法
- ✅ 创建了详细的文档和指南 