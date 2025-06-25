# Extensions

这个文件夹用于存放Neo4j GraphRAG Python包的扩展功能。

## 目录结构

```
extensions/
├── README.md                 # 本文件
├── plugins/                  # 插件扩展
│   ├── __init__.py
│   └── README.md
├── integrations/             # 第三方集成
│   ├── __init__.py
│   └── README.md
├── custom_retrievers/        # 自定义检索器
│   ├── __init__.py
│   └── README.md
├── custom_embeddings/        # 自定义嵌入模型
│   ├── __init__.py
│   └── README.md
├── custom_llms/              # 自定义大语言模型
│   ├── __init__.py
│   └── README.md
├── pipelines/                # 自定义管道
│   ├── __init__.py
│   └── README.md
├── tools/                    # 工具和实用程序
│   ├── __init__.py
│   └── README.md
└── examples/                 # 扩展功能示例
    ├── __init__.py
    └── README.md
```

## 开发指南

### 添加新扩展

1. 在相应的子目录中创建新的模块
2. 确保遵循项目的编码规范和类型提示
3. 添加适当的测试用例
4. 更新相关文档

### 扩展类型

- **插件 (plugins)**: 提供额外功能的插件系统
- **集成 (integrations)**: 与第三方服务的集成
- **自定义检索器 (custom_retrievers)**: 实现自定义检索逻辑
- **自定义嵌入 (custom_embeddings)**: 支持新的嵌入模型
- **自定义LLM (custom_llms)**: 支持新的大语言模型
- **管道 (pipelines)**: 自定义知识图谱构建和查询管道
- **工具 (tools)**: 实用工具和辅助函数
- **示例 (examples)**: 展示如何使用扩展功能的示例

### 贡献指南

请参考主项目的 `CONTRIBUTING.md` 文件了解详细的贡献指南。

## 许可证

扩展功能遵循与主项目相同的Apache 2.0许可证。 