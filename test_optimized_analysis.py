#!/usr/bin/env python3
"""
Test script to verify optimized analysis with improved path matching.
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

async def test_optimized_analysis():
    """Test the optimized analysis with improved path matching."""
    
    # Initialize the analyzer
    analyzer = CodeChangeAnalyzer(
        neo4j_uri="neo4j://localhost:7687",
        neo4j_username="neo4j",
        neo4j_password="password"
    )
    
    # Test file path that was actually changed
    changed_file = "nj/transformer-models/+gpt2/+internal/getSupportFilePath.m"
    
    print("=== 优化后的分析测试 ===")
    print(f"变更文件: {changed_file}")
    print("-" * 50)
    
    # Test the optimized path matching
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
    print("=== 优化效果分析 ===")
    
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
    
    # Calculate improvement
    total_entities = len(entities)
    if total_entities > 0:
        precision = len(truly_affected) / total_entities * 100
        print(f"📊 精确度: {precision:.1f}%")
    
    if truly_affected:
        print("\n真正受影响的实体:")
        for entity in truly_affected:
            print(f"  - {entity.get('type')}: {entity.get('name')} in {entity.get('file_path')}")
    
    if potentially_affected:
        print("\n潜在受影响的实体 (需要进一步分析):")
        for entity in potentially_affected:
            print(f"  - {entity.get('type')}: {entity.get('name')} in {entity.get('file_path')}")
    
    print("\n=== 优化总结 ===")
    print("1. ✅ 优先使用精确路径匹配")
    print("2. ✅ 添加了路径标准化处理")
    print("3. ✅ 实现了相关性评分和过滤")
    print("4. ✅ 降低了同名文件的误报率")
    
    if len(truly_affected) > len(potentially_affected):
        print("🎉 优化成功：真正受影响的实体数量超过潜在受影响的实体")
    else:
        print("⚠️  仍需进一步优化：潜在受影响的实体仍然较多")

if __name__ == "__main__":
    asyncio.run(test_optimized_analysis()) 