#!/usr/bin/env python3
"""
Test script to verify query generation functionality.
"""

import asyncio
import logging
import sys
from pathlib import Path

# Add extensions to path
sys.path.insert(0, str(Path(__file__).parent / "extensions"))

from tools.report_generator import ReportGenerator

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

async def test_query_generation():
    """Test the query generation functionality."""
    
    print("🧪 测试查询生成功能")
    print("=" * 50)
    
    # Create a mock analysis data
    mock_analysis = {
        'repository_info': {
            'name': 'test-repo',
            'url': 'https://github.com/test/test-repo.git'
        },
        'dependency_chains': [
            {
                'chain_id': 'test_chain_1',
                'source_entity': 'getSupportFilePath.m',
                'target_entity': 'filePath',
                'severity': 'HIGH',
                'chain_type': 'function_call_chain',
                'path_length': 2,
                'path_nodes': [
                    {
                        'node_id': '4:test:1',
                        'name': 'getSupportFilePath.m',
                        'node_type': 'Script',
                        'file_path': '+gpt2/+internal/getSupportFilePath.m'
                    },
                    {
                        'node_id': '4:test:2',
                        'name': 'legacySupportFilePath',
                        'node_type': 'Function',
                        'file_path': '+gpt2/+internal/getSupportFilePath.m'
                    },
                    {
                        'node_id': '4:test:3',
                        'name': 'filePath',
                        'node_type': 'Variable',
                        'file_path': '+gpt2/+internal/getSupportFilePath.m'
                    }
                ]
            },
            {
                'chain_id': 'test_chain_2',
                'source_entity': 'getSupportFilePath.m',
                'target_entity': 'data',
                'severity': 'MEDIUM',
                'chain_type': 'variable_dependency_chain',
                'path_length': 1,
                'path_nodes': [
                    {
                        'node_id': '4:test:4',
                        'name': 'getSupportFilePath.m',
                        'node_type': 'Script',
                        'file_path': '+gpt2/+internal/getSupportFilePath.m'
                    },
                    {
                        'node_id': '4:test:5',
                        'name': 'data',
                        'node_type': 'Variable',
                        'file_path': '+gpt2/+internal/getSupportFilePath.m'
                    }
                ]
            }
        ]
    }
    
    # Initialize report generator
    report_generator = ReportGenerator()
    
    # Test the query generation
    try:
        content = report_generator._generate_cypher_queries(mock_analysis)
        
        print("✅ 查询生成成功!")
        print("\n📄 生成的查询内容预览:")
        print("-" * 50)
        
        # Show first 500 characters
        preview = content[:500]
        print(preview)
        
        if "最完整的影响链路分析" in content:
            print("\n🎉 最完整影响链分析功能已生效!")
        else:
            print("\n❌ 最完整影响链分析功能未生效")
        
        if "链路组件统计" in content:
            print("✅ 链路组件统计功能已生效!")
        else:
            print("❌ 链路组件统计功能未生效")
        
        if "查询链路上的脚本组件" in content:
            print("✅ 脚本组件查询功能已生效!")
        else:
            print("❌ 脚本组件查询功能未生效")
        
        if "查询链路上的函数组件" in content:
            print("✅ 函数组件查询功能已生效!")
        else:
            print("❌ 函数组件查询功能未生效")
        
        if "查询链路上的变量组件" in content:
            print("✅ 变量组件查询功能已生效!")
        else:
            print("❌ 变量组件查询功能未生效")
        
        # Save to file for inspection
        with open('test_query_output.cypher', 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"\n📁 完整查询内容已保存到: test_query_output.cypher")
        
    except Exception as e:
        print(f"❌ 查询生成失败: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    asyncio.run(test_query_generation()) 