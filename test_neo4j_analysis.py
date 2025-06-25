#!/usr/bin/env python3
"""
测试Neo4j数据库分析功能
直接测试数据库查询，不依赖GitHub API
"""

import sys
import asyncio
import logging
from pathlib import Path

# 添加项目路径
sys.path.append('/home/kotei/work/neo4j-graphrag-python')

from extensions.pipelines.code_change_analyzer import CodeChangeAnalyzer

# 配置日志
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

async def test_neo4j_analysis():
    """测试Neo4j数据库分析功能"""
    print("=== 测试Neo4j数据库分析功能 ===")
    
    try:
        # 创建分析器实例
        analyzer = CodeChangeAnalyzer(
            neo4j_uri='neo4j://localhost:7687',
            neo4j_username='neo4j',
            neo4j_password='password'
        )
        print("✅ 分析器实例创建成功")
        
        # 测试数据库连接
        with analyzer.driver.session() as session:
            result = session.run('RETURN 1 as test')
            test_result = result.single()
            print(f"✅ Neo4j连接测试成功! 结果: {test_result['test']}")
            
            # 检查数据库中的节点类型
            result = session.run('MATCH (n) RETURN DISTINCT labels(n) as labels')
            node_types = list(result)
            print(f"\n数据库中的节点类型: {[record['labels'] for record in node_types]}")
            
            # 检查每种节点类型的数量
            print("\n节点类型统计:")
            for node_type in node_types:
                labels = node_type['labels']
                if labels:
                    label_str = ':'.join(labels)
                    result = session.run(f'MATCH (n:{label_str}) RETURN count(n) as count')
                    count = result.single()['count']
                    print(f"  {label_str}: {count} 个节点")
            
            # 测试文件路径匹配功能
            print("\n=== 测试文件路径匹配功能 ===")
            
            # 模拟一个文件路径
            test_file_path = "gpt2.m"
            print(f"测试文件路径: {test_file_path}")
            
            # 查找匹配的实体
            entities = await analyzer._find_entities_by_file_path(test_file_path)
            print(f"找到 {len(entities)} 个匹配的实体")
            
            for i, entity in enumerate(entities, 1):
                print(f"  实体 {i}:")
                print(f"    名称: {entity.get('name', 'N/A')}")
                print(f"    类型: {entity.get('type', 'N/A')}")
                print(f"    文件路径: {entity.get('file_path', 'N/A')}")
                print()
            
            # 测试查询特定文件名的实体
            print("=== 测试查询特定文件名 ===")
            filename = "gpt2.m"
            entities = await analyzer._query_entities_by_filename(filename)
            print(f"文件名 '{filename}' 找到 {len(entities)} 个实体")
            
            for i, entity in enumerate(entities, 1):
                print(f"  实体 {i}:")
                print(f"    名称: {entity.get('name', 'N/A')}")
                print(f"    类型: {entity.get('type', 'N/A')}")
                print(f"    文件路径: {entity.get('file_path', 'N/A')}")
                print()
            
            # 测试关键词搜索
            print("=== 测试关键词搜索 ===")
            keyword = "gpt2"
            entities = await analyzer._query_entities_by_keyword(keyword)
            print(f"关键词 '{keyword}' 找到 {len(entities)} 个实体")
            
            for i, entity in enumerate(entities, 1):
                print(f"  实体 {i}:")
                print(f"    名称: {entity.get('name', 'N/A')}")
                print(f"    类型: {entity.get('type', 'N/A')}")
                print(f"    文件路径: {entity.get('file_path', 'N/A')}")
                print()
            
            # 测试关系查找
            if entities:
                print("=== 测试关系查找 ===")
                relationships = await analyzer._find_relationships_for_entities(entities[:3])  # 只测试前3个实体
                print(f"找到 {len(relationships)} 个关系")
                
                for i, rel in enumerate(relationships, 1):
                    print(f"  关系 {i}:")
                    print(f"    类型: {rel.get('type', 'N/A')}")
                    print(f"    源: {rel.get('source_name', 'N/A')} ({rel.get('source_type', 'N/A')})")
                    print(f"    目标: {rel.get('target_name', 'N/A')} ({rel.get('target_type', 'N/A')})")
                    print()
        
        print("✅ 所有测试完成!")
        
    except Exception as e:
        print(f"❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    asyncio.run(test_neo4j_analysis()) 