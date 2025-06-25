#!/usr/bin/env python3
"""
Test script to verify affected entities analysis logic.
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

async def test_affected_entities():
    """Test the affected entities analysis logic."""
    
    # Initialize the analyzer
    analyzer = CodeChangeAnalyzer(
        neo4j_uri="neo4j://localhost:7687",
        neo4j_username="neo4j",
        neo4j_password="password"
    )
    
    # Test file path that was actually changed
    changed_file = "nj/transformer-models/+gpt2/+internal/getSupportFilePath.m"
    
    print("=== 分析受影响实体逻辑 ===")
    print(f"变更文件: {changed_file}")
    print("-" * 50)
    
    # Find entities for the changed file
    entities = await analyzer._find_entities_by_file_path(changed_file)
    
    print(f"找到 {len(entities)} 个实体")
    print()
    
    # Group entities by file path
    entities_by_file = {}
    for entity in entities:
        file_path = entity.get('file_path', 'Unknown')
        if file_path not in entities_by_file:
            entities_by_file[file_path] = []
        entities_by_file[file_path].append(entity)
    
    print("=== 按文件分组的实体 ===")
    for file_path, file_entities in entities_by_file.items():
        print(f"\n📁 文件: {file_path}")
        print(f"   实体数量: {len(file_entities)}")
        
        # Group by type
        functions = [e for e in file_entities if e.get('type') == 'Function']
        variables = [e for e in file_entities if e.get('type') == 'Variable']
        scripts = [e for e in file_entities if e.get('type') == 'Script']
        
        if functions:
            print(f"   🔧 函数 ({len(functions)}):")
            for func in functions:
                print(f"      - {func.get('name')} (ID: {func.get('id')})")
        
        if variables:
            print(f"   📝 变量 ({len(variables)}):")
            for var in variables[:5]:  # Show first 5
                print(f"      - {var.get('name')} (ID: {var.get('id')})")
            if len(variables) > 5:
                print(f"      ... 还有 {len(variables) - 5} 个变量")
        
        if scripts:
            print(f"   📜 脚本 ({len(scripts)}):")
            for script in scripts:
                print(f"      - {script.get('name')} (ID: {script.get('id')})")
    
    print("\n" + "=" * 50)
    print("=== 分析结论 ===")
    
    # Check if entities are from the actual changed file
    actual_changed_file = "+gpt2/+internal/getSupportFilePath.m"
    truly_affected = []
    potentially_affected = []
    
    for entity in entities:
        file_path = entity.get('file_path', '')
        if actual_changed_file in file_path:
            truly_affected.append(entity)
        else:
            potentially_affected.append(entity)
    
    print(f"✅ 真正受影响的实体 (来自变更文件): {len(truly_affected)}")
    print(f"⚠️  潜在受影响的实体 (同名文件): {len(potentially_affected)}")
    
    if truly_affected:
        print("\n真正受影响的实体:")
        for entity in truly_affected:
            print(f"  - {entity.get('type')}: {entity.get('name')} in {entity.get('file_path')}")
    
    if potentially_affected:
        print("\n潜在受影响的实体 (需要进一步分析):")
        for entity in potentially_affected:
            print(f"  - {entity.get('type')}: {entity.get('name')} in {entity.get('file_path')}")
    
    print("\n=== 建议 ===")
    print("1. 系统当前逻辑会找到所有同名文件的实体")
    print("2. 需要进一步分析依赖关系来确定真正受影响的范围")
    print("3. 建议添加更精确的文件路径匹配逻辑")
    print("4. 可以通过依赖链分析来验证影响范围")

if __name__ == "__main__":
    asyncio.run(test_affected_entities()) 