#!/usr/bin/env python3
"""
配置跳过LLM分析的GraphRAG分析器
"""

import os
import yaml
from pathlib import Path

# 默认配置
DEFAULT_CONFIG = {
    "neo4j": {
        "uri": "bolt://localhost:7687",
        "username": "neo4j",
        "password": "kotei$88",
        "database": "neo4j"
    },
    "ollama": {
        "model": "deepseek-r1:1.5b",
        "base_url": "http://localhost:11434"
    },
    "analysis": {
        "skip_llm_analysis": True,  # 关键配置：跳过LLM分析
        "direct_query_only": True,  # 仅执行直接查询
        "output_dir": "analysis_output",
        "max_impact_chains": 100,
        "chain_depth_limit": 10
    },
    "repository": {
        "url": "https://github.com/your-repo/your-project",
        "analysis_days": 7,
        "branch": "main"
    },
    "logging": {
        "level": "INFO",
        "file": "direct_analysis.log"
    }
}

def create_direct_analysis_config(config_path: str = "direct_analysis_config.yaml"):
    """创建跳过LLM分析的配置文件"""
    
    config = DEFAULT_CONFIG.copy()
    
    # 确保输出目录存在
    output_dir = config["analysis"]["output_dir"]
    Path(output_dir).mkdir(parents=True, exist_ok=True)
    
    # 保存配置文件
    with open(config_path, 'w', encoding='utf-8') as f:
        yaml.dump(config, f, default_flow_style=False, allow_unicode=True)
    
    print(f"配置文件已创建: {config_path}")
    return config_path

def load_direct_analysis_config(config_path: str = "direct_analysis_config.yaml"):
    """加载跳过LLM分析的配置文件"""
    
    if not os.path.exists(config_path):
        print(f"配置文件不存在，创建默认配置: {config_path}")
        return create_direct_analysis_config(config_path)
    
    with open(config_path, 'r', encoding='utf-8') as f:
        config = yaml.safe_load(f)
    
    return config

def validate_direct_analysis_config(config: dict) -> bool:
    """验证跳过LLM分析的配置"""
    
    required_sections = ["neo4j", "analysis", "repository"]
    for section in required_sections:
        if section not in config:
            print(f"❌ 缺少配置节: {section}")
            return False
    
    # 检查Neo4j配置
    neo4j_config = config.get("neo4j", {})
    required_neo4j = ["uri", "username", "password"]
    for key in required_neo4j:
        if key not in neo4j_config:
            print(f"❌ 缺少Neo4j配置: {key}")
            return False
    
    # 检查分析配置
    analysis_config = config.get("analysis", {})
    if not analysis_config.get("skip_llm_analysis", False):
        print("⚠️  警告: skip_llm_analysis 未设置为 True")
    
    print("✅ 配置验证通过")
    return True

def get_analysis_mode(config: dict) -> str:
    """获取分析模式"""
    analysis_config = config.get("analysis", {})
    
    if analysis_config.get("skip_llm_analysis", False):
        if analysis_config.get("direct_query_only", False):
            return "direct_query_only"
        else:
            return "direct_analysis"
    else:
        return "llm_analysis"

def print_config_summary(config: dict):
    """打印配置摘要"""
    print("\n=== 直接分析配置摘要 ===")
    
    neo4j_config = config.get("neo4j", {})
    analysis_config = config.get("analysis", {})
    repo_config = config.get("repository", {})
    
    print(f"Neo4j URI: {neo4j_config.get('uri', 'N/A')}")
    print(f"分析模式: {get_analysis_mode(config)}")
    print(f"跳过LLM分析: {analysis_config.get('skip_llm_analysis', False)}")
    print(f"仅直接查询: {analysis_config.get('direct_query_only', False)}")
    print(f"输出目录: {analysis_config.get('output_dir', 'N/A')}")
    print(f"仓库URL: {repo_config.get('url', 'N/A')}")
    print(f"分析天数: {repo_config.get('analysis_days', 'N/A')}")

def create_environment_config():
    """创建环境变量配置"""
    
    env_config = {
        "GRAPH_RAG_SKIP_LLM": "true",
        "GRAPH_RAG_DIRECT_QUERY": "true",
        "GRAPH_RAG_OUTPUT_DIR": "analysis_output",
        "NEO4J_URI": "bolt://localhost:7687",
        "NEO4J_USERNAME": "neo4j",
        "NEO4J_PASSWORD": "kotei$88"
    }
    
    # 创建.env文件
    with open(".env", 'w', encoding='utf-8') as f:
        for key, value in env_config.items():
            f.write(f"{key}={value}\n")
    
    print("环境变量配置文件已创建: .env")
    return env_config

def main():
    """主函数"""
    print("GraphRAG 直接分析配置工具")
    print("=" * 40)
    
    # 创建配置文件
    config_path = create_direct_analysis_config()
    
    # 加载配置
    config = load_direct_analysis_config(config_path)
    
    # 验证配置
    if validate_direct_analysis_config(config):
        # 打印配置摘要
        print_config_summary(config)
        
        # 创建环境变量配置
        env_config = create_environment_config()
        
        print("\n=== 使用说明 ===")
        print("1. 配置文件已创建: direct_analysis_config.yaml")
        print("2. 环境变量文件已创建: .env")
        print("3. 在代码中使用以下方式加载配置:")
        print("   from config_direct_analysis import load_direct_analysis_config")
        print("   config = load_direct_analysis_config()")
        print("4. 创建分析器时使用:")
        print("   analyzer = DirectGraphRAGAnalyzer()")
        print("   或")
        print("   analyzer = Neo4jImpactAnalyzer(skip_llm_analysis=True)")
        
    else:
        print("❌ 配置验证失败，请检查配置文件")

if __name__ == "__main__":
    main() 