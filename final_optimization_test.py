#!/usr/bin/env python3
"""
Final test script to verify optimization effectiveness.
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

async def final_optimization_test():
    """Final test to verify optimization effectiveness."""
    
    print("🎯 最终优化效果验证")
    print("=" * 60)
    
    # Initialize the analyzer
    analyzer = CodeChangeAnalyzer(
        neo4j_uri="neo4j://localhost:7687",
        neo4j_username="neo4j",
        neo4j_password="password"
    )
    
    # Test file path
    changed_file = "nj/transformer-models/+gpt2/+internal/getSupportFilePath.m"
    
    print(f"📁 测试文件: {changed_file}")
    print("-" * 60)
    
    # Test the optimized path matching
    entities = await analyzer._find_entities_by_file_path(changed_file)
    
    print(f"🔍 找到实体数量: {len(entities)}")
    print()
    
    # Analyze results
    gpt2_entities = []
    bert_entities = []
    finbert_entities = []
    other_entities = []
    
    for entity in entities:
        file_path = entity.get('file_path', '')
        if '+gpt2/' in file_path:
            gpt2_entities.append(entity)
        elif '+bert/' in file_path:
            bert_entities.append(entity)
        elif '+finbert/' in file_path:
            finbert_entities.append(entity)
        else:
            other_entities.append(entity)
    
    print("📊 实体分布分析:")
    print(f"  ✅ GPT2 文件实体: {len(gpt2_entities)} (真正受影响)")
    print(f"  ⚠️  BERT 文件实体: {len(bert_entities)} (同名文件)")
    print(f"  ⚠️  FinBERT 文件实体: {len(finbert_entities)} (同名文件)")
    print(f"  ❓ 其他文件实体: {len(other_entities)}")
    print()
    
    # Calculate precision
    total_entities = len(entities)
    truly_affected = len(gpt2_entities)
    potentially_affected = len(bert_entities) + len(finbert_entities)
    
    if total_entities > 0:
        precision = truly_affected / total_entities * 100
        print(f"📈 精确度: {precision:.1f}%")
        print(f"📈 真正受影响比例: {truly_affected}/{total_entities}")
        print(f"📈 潜在误报比例: {potentially_affected}/{total_entities}")
    print()
    
    # Show detailed breakdown
    print("🔧 真正受影响的函数:")
    for entity in gpt2_entities:
        if entity.get('type') == 'Function':
            print(f"  - {entity.get('name')} (ID: {entity.get('id')})")
    
    print("\n⚠️  潜在误报的函数:")
    for entity in bert_entities + finbert_entities:
        if entity.get('type') == 'Function':
            print(f"  - {entity.get('name')} (文件: {entity.get('file_path')})")
    
    print("\n" + "=" * 60)
    print("🎯 优化效果总结:")
    
    if truly_affected > potentially_affected:
        print("✅ 优化成功！真正受影响的实体数量超过潜在误报")
        print("✅ 路径匹配优化有效降低了同名文件误报")
    elif truly_affected == total_entities:
        print("🎉 完美优化！所有实体都来自真正受影响的文件")
        print("🎉 路径匹配精确度达到100%")
    else:
        print("⚠️  仍需进一步优化")
        print("⚠️  同名文件误报仍然存在")
    
    print("\n🔧 优化措施:")
    print("1. ✅ 优先使用精确路径匹配")
    print("2. ✅ 添加路径标准化处理")
    print("3. ✅ 实现相关性评分和过滤")
    print("4. ✅ 添加重复实体去重机制")
    
    print("\n📋 建议:")
    if precision >= 80:
        print("✅ 当前优化效果良好，可以投入使用")
    elif precision >= 60:
        print("🟡 优化效果一般，建议进一步调优")
    else:
        print("🔴 优化效果不佳，需要重新设计匹配策略")
    
    return {
        "total_entities": total_entities,
        "truly_affected": truly_affected,
        "potentially_affected": potentially_affected,
        "precision": precision if total_entities > 0 else 0,
        "gpt2_entities": gpt2_entities,
        "bert_entities": bert_entities,
        "finbert_entities": finbert_entities
    }

if __name__ == "__main__":
    result = asyncio.run(final_optimization_test())
    print(f"\n�� 测试结果: {result}") 