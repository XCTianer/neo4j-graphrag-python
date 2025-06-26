#!/usr/bin/env python3
"""
测试相对路径匹配效果
"""

import asyncio
import logging
import sys
from pathlib import Path

# Add extensions to path
sys.path.insert(0, str(Path(__file__).parent / "extensions"))

from pipelines.code_change_analyzer import CodeChangeAnalyzer

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

async def test_relative_path_matching():
    """测试相对路径匹配效果"""
    
    # Initialize the analyzer
    analyzer = CodeChangeAnalyzer(
        neo4j_uri="neo4j://localhost:7687",
        neo4j_username="neo4j",
        neo4j_password="password"
    )
    
    # Test cases - 使用相对路径
    test_cases = [
        "+gpt2/model.m",
        "+bert/model.m", 
        "+finbert/model.m",
        "+gpt2/+internal/getSupportFilePath.m",
        "model.m"
    ]
    
    print("=== 测试相对路径匹配效果 ===")
    print("=" * 60)
    
    for file_path in test_cases:
        print(f"\n🔍 测试文件路径: {file_path}")
        print("-" * 50)
        
        # Test path variations generation
        print("📋 生成的路径变体:")
        variations = analyzer._generate_enhanced_path_variations(file_path)
        for i, variation in enumerate(variations, 1):
            print(f"   {i}. {variation}")
        
        # Test entity finding
        print(f"\n🔍 查找实体...")
        entities = await analyzer._find_entities_by_file_path(file_path)
        
        if entities:
            print(f"✅ 找到 {len(entities)} 个实体:")
            
            # Group by file path
            entities_by_file = {}
            for entity in entities:
                entity_file = entity.get('file_path', 'Unknown')
                if entity_file not in entities_by_file:
                    entities_by_file[entity_file] = []
                entities_by_file[entity_file].append(entity)
            
            for entity_file, file_entities in entities_by_file.items():
                print(f"   📁 文件: {entity_file}")
                print(f"      实体数量: {len(file_entities)}")
                
                # Group by type
                by_type = {}
                for entity in file_entities:
                    entity_type = entity.get('type', 'Unknown')
                    if entity_type not in by_type:
                        by_type[entity_type] = []
                    by_type[entity_type].append(entity.get('name', 'Unknown'))
                
                for entity_type, names in by_type.items():
                    print(f"      {entity_type} ({len(names)}): {', '.join(names[:5])}")
                    if len(names) > 5:
                        print(f"        ... 还有 {len(names) - 5} 个")
                
                # Check if this is the expected file
                if 'gpt2/model.m' in entity_file:
                    print(f"      ✅ 这是期望的gpt2/model.m文件")
                elif 'bert/model.m' in entity_file:
                    print(f"      ✅ 这是期望的bert/model.m文件")
                elif 'finbert/model.m' in entity_file:
                    print(f"      ✅ 这是期望的finbert/model.m文件")
                else:
                    print(f"      ⚠️  这可能不是期望的文件")
        else:
            print("❌ 没有找到实体")
    
    # Test specific case for presents variable
    print(f"\n" + "=" * 60)
    print("🔍 专门测试presents变量查找")
    print("-" * 50)
    
    # Test the specific file that should contain presents
    test_file = "+gpt2/model.m"
    print(f"测试文件: {test_file}")
    
    entities = await analyzer._find_entities_by_file_path(test_file)
    
    if entities:
        # Look for presents variable specifically
        presents_found = False
        for entity in entities:
            if entity.get('name') == 'presents' and entity.get('type') == 'Variable':
                presents_found = True
                print(f"✅ 找到presents变量!")
                print(f"   文件: {entity.get('file_path')}")
                print(f"   类型: {entity.get('type')}")
                print(f"   ID: {entity.get('id')}")
                break
        
        if not presents_found:
            print("❌ 没有找到presents变量")
            print("找到的变量:")
            variables = [e for e in entities if e.get('type') == 'Variable']
            for var in variables[:10]:  # Show first 10
                print(f"   - {var.get('name')} (文件: {var.get('file_path')})")
            if len(variables) > 10:
                print(f"   ... 还有 {len(variables) - 10} 个变量")
    else:
        print("❌ 没有找到任何实体")
    
    # Test with original absolute path to see if it still works
    print(f"\n" + "=" * 60)
    print("🔍 测试原始绝对路径是否仍然有效")
    print("-" * 50)
    
    original_file = "nj/transformer-models/+gpt2/model.m"
    print(f"测试文件: {original_file}")
    
    entities = await analyzer._find_entities_by_file_path(original_file)
    
    if entities:
        print(f"✅ 绝对路径仍然有效，找到 {len(entities)} 个实体")
        # Check if presents is found
        presents_found = any(e.get('name') == 'presents' for e in entities)
        if presents_found:
            print("✅ 通过绝对路径也能找到presents变量")
        else:
            print("❌ 通过绝对路径没有找到presents变量")
    else:
        print("❌ 绝对路径不再有效")
    
    print(f"\n" + "=" * 60)
    print("=== 测试完成 ===")

if __name__ == "__main__":
    asyncio.run(test_relative_path_matching()) 