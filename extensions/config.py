"""
Configuration file for code change analysis.
"""

import os
from typing import Dict, Any

# Neo4j Configuration
NEO4J_CONFIG = {
    "uri": "neo4j://localhost:7687",
    "username": "neo4j",
    "password": "password"
}

# Ollama Configuration
OLLAMA_CONFIG = {
    "model": "Qwen2.5-Coder-1.5B:latest",
    "base_url": "http://localhost:11434"
}

# GitHub Repository Configuration
REPO_CONFIG = {
    "url": "https://github.com/XCTianer/transformer-models.git",
    "local_path": None,  # Will be auto-generated
    "analysis_days":5,  # 只分析最近1天的提交（通常是最近一次提交）
    "max_commits": 1,  # 最多分析1次提交（最近一次）
    "only_latest_commit": True  # 只分析最近一次提交
}

# Analysis Configuration
ANALYSIS_CONFIG = {
    "output_dir": "analysis_output",
    "log_level": "INFO",
    "log_file": "code_change_analysis.log"
}

# Environment Configuration
ENVIRONMENT_CONFIG = {
    "required_env": "sunny",
    "python_version": ">=3.9"
}

# Schema Configuration (from requirements.py)
SCHEMA_CONFIG = {
    "node_types": ["Function", "Variable", "Script"],
    "relationship_types": ["CALLS", "USES", "DEFINES", "ASSIGNED_TO", "MODIFIES"],
    "patterns": [
        ("Function", "CALLS", "Function"),
        ("Script", "CALLS", "Function"),
        ("Script", "CALLS", "Script"),
        ("Function", "USES", "Variable"),
        ("Script", "USES", "Variable"),
        ("Function", "DEFINES", "Variable"),
        ("Script", "DEFINES", "Variable"),
        ("Script", "DEFINES", "Function"),
        ("Script", "MODIFIES", "Variable"),
        ("Variable", "ASSIGNED_TO", "Variable"),
    ]
}

# Risk Assessment Configuration
RISK_CONFIG = {
    "high_risk_threshold": 50,  # entities
    "medium_risk_threshold": 20,  # entities
    "high_risk_percentage": 30,  # percentage of commits
    "medium_risk_percentage": 15,  # percentage of commits
}

# Output Configuration
OUTPUT_CONFIG = {
    "report_filename": "代码变更记录影响范围分析报告.md",
    "queries_filename": "代码变更记录影响链路的查询语句.cypher",
    "links_filename": "带查询语句的neo4j链接.md"
}

def get_config() -> Dict[str, Any]:
    """Get complete configuration dictionary."""
    return {
        "neo4j": NEO4J_CONFIG,
        "ollama": OLLAMA_CONFIG,
        "repository": REPO_CONFIG,
        "analysis": ANALYSIS_CONFIG,
        "environment": ENVIRONMENT_CONFIG,
        "schema": SCHEMA_CONFIG,
        "risk": RISK_CONFIG,
        "output": OUTPUT_CONFIG
    }

def validate_config() -> bool:
    """Validate configuration settings."""
    try:
        # Check Neo4j configuration
        if not NEO4J_CONFIG["uri"] or not NEO4J_CONFIG["username"] or not NEO4J_CONFIG["password"]:
            print("Error: Neo4j configuration is incomplete")
            return False
        
        # Check Ollama configuration
        if not OLLAMA_CONFIG["model"] or not OLLAMA_CONFIG["base_url"]:
            print("Error: Ollama configuration is incomplete")
            return False
        
        # Check repository configuration
        if not REPO_CONFIG["url"]:
            print("Error: Repository URL is not configured")
            return False
        
        # Check environment
        if os.environ.get('CONDA_DEFAULT_ENV') != ENVIRONMENT_CONFIG["required_env"]:
            print(f"Warning: Not running in required environment '{ENVIRONMENT_CONFIG['required_env']}'")
        
        return True
        
    except Exception as e:
        print(f"Error validating configuration: {e}")
        return False

def print_config():
    """Print current configuration."""
    config = get_config()
    print("=== Current Configuration ===")
    for section, settings in config.items():
        print(f"\n[{section.upper()}]")
        for key, value in settings.items():
            if key == "password":
                print(f"  {key}: {'*' * len(str(value))}")
            else:
                print(f"  {key}: {value}")
    print("\n" + "=" * 30) 