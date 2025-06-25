#!/bin/bash

# 代码变更影响分析系统 - 快速启动脚本

echo "🚀 代码变更影响分析系统"
echo "================================"

# 检查是否在sunny环境中
if [ "$CONDA_DEFAULT_ENV" != "sunny" ]; then
    echo "⚠️  当前环境: $CONDA_DEFAULT_ENV"
    echo "📝 建议使用sunny环境"
    echo "   运行: conda activate sunny"
    echo ""
    read -p "是否继续? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ 已取消"
        exit 1
    fi
else
    echo "✅ 当前环境: $CONDA_DEFAULT_ENV"
fi

# 检查依赖
echo ""
echo "🔍 检查依赖..."

# 检查Python
if ! command -v python &> /dev/null; then
    echo "❌ Python未找到"
    exit 1
fi

# 检查Neo4j GraphRAG
if ! python -c "import neo4j_graphrag" &> /dev/null; then
    echo "❌ Neo4j GraphRAG未安装"
    echo "   运行: pip install neo4j-graphrag[ollama]"
    exit 1
fi

echo "✅ 依赖检查通过"

# 显示配置
echo ""
echo "📋 当前配置:"
python run_analysis.py --config

# 询问是否开始分析
echo ""
read -p "是否开始分析? (Y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo "❌ 已取消"
    exit 1
fi

# 开始分析
echo ""
echo "🚀 开始分析..."
python run_analysis.py

echo ""
echo "✅ 分析完成!"
echo "📁 查看输出文件: analysis_output/" 