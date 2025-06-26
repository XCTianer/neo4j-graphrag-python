#!/usr/bin/env python3
"""
Setup script for the Code Change Impact Analysis MCP Plugin
"""

from setuptools import setup, find_packages
import os

# Read the README file
def read_readme():
    readme_path = os.path.join(os.path.dirname(__file__), 'README.md')
    if os.path.exists(readme_path):
        with open(readme_path, 'r', encoding='utf-8') as f:
            return f.read()
    return "Code Change Impact Analysis MCP Plugin"

# Read requirements
def read_requirements():
    requirements_path = os.path.join(os.path.dirname(__file__), 'requirements.txt')
    if os.path.exists(requirements_path):
        with open(requirements_path, 'r', encoding='utf-8') as f:
            return [line.strip() for line in f if line.strip() and not line.startswith('#')]
    return []

setup(
    name="code-change-impact-mcp",
    version="1.0.0",
    description="MCP plugin for analyzing code change impact using Neo4j GraphRAG",
    long_description=read_readme(),
    long_description_content_type="text/markdown",
    author="XCTianer",
    author_email="827482761@qq.com",
    url="https://github.com/XCTianer/neo4j-graphrag-python",
    packages=find_packages(),
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
        "Topic :: Software Development :: Libraries :: Python Modules",
        "Topic :: Software Development :: Quality Assurance",
        "Topic :: Software Development :: Testing",
    ],
    python_requires=">=3.9",
    install_requires=read_requirements(),
    extras_require={
        "dev": [
            "pytest>=8.0.2",
            "pytest-asyncio>=0.23.8",
            "black>=23.0.0",
            "ruff>=0.3.0",
            "mypy>=1.10.0",
        ],
        "test": [
            "pytest>=8.0.2",
            "pytest-asyncio>=0.23.8",
            "pytest-cov>=4.0.0",
        ],
    },
    entry_points={
        "console_scripts": [
            "code-change-impact-mcp=mcp_plugin.server:main",
        ],
    },
    include_package_data=True,
    package_data={
        "mcp_plugin": ["schema.json", "README.md"],
    },
    keywords=[
        "mcp",
        "model-context-protocol",
        "code-analysis",
        "impact-analysis",
        "neo4j",
        "graphrag",
        "dependency-analysis",
        "code-changes",
    ],
    project_urls={
        "Bug Reports": "https://github.com/XCTianer/neo4j-graphrag-python/issues",
        "Source": "https://github.com/XCTianer/neo4j-graphrag-python",
        "Documentation": "https://github.com/XCTianer/neo4j-graphrag-python/blob/main/mcp_plugin/README.md",
    },
) 