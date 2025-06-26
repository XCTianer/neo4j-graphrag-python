#!/usr/bin/env python3
"""
检查数据库中当前的路径情况
"""

import asyncio
from neo4j import GraphDatabase
import os

async def check_database_paths():
    """检查数据库中当前的路径情况"""
    
    # Neo4j连接配置
    uri = "bolt://localhost:7687"
    username = "neo4j"
    password = "password"
    
    try:
        driver = GraphDatabase.driver(uri, auth=(username, password))
        
        with driver.session() as session:
            print("🔍 检查数据库中的路径情况")
            print("=" * 60)
            
            # 1. 检查所有文件路径
            print("1. 检查所有文件路径...")
            query1 = """
            MATCH (n)
            WHERE n.file_path IS NOT NULL
            RETURN DISTINCT n.file_path as file_path
            ORDER BY n.file_path
            LIMIT 20
            """
            
            result1 = session.run(query1)
            all_paths = list(result1)
            
            if all_paths:
                print(f"✅ 找到 {len(all_paths)} 个不同的文件路径:")
                for path in all_paths:
                    print(f"   - {path['file_path']}")
            else:
                print("❌ 没有找到文件路径")
            
            # 2. 检查gpt2相关文件
            print(f"\n2. 检查gpt2相关文件...")
            query2 = """
            MATCH (n)
            WHERE n.file_path CONTAINS 'gpt2'
            RETURN DISTINCT n.file_path as file_path
            ORDER BY n.file_path
            """
            
            result2 = session.run(query2)
            gpt2_paths = list(result2)
            
            if gpt2_paths:
                print(f"✅ 找到 {len(gpt2_paths)} 个gpt2相关文件:")
                for path in gpt2_paths:
                    print(f"   - {path['file_path']}")
            else:
                print("❌ 没有找到gpt2相关文件")
            
            # 3. 检查model.m文件
            print(f"\n3. 检查model.m文件...")
            query3 = """
            MATCH (n)
            WHERE n.file_path ENDS WITH 'model.m'
            RETURN DISTINCT n.file_path as file_path
            ORDER BY n.file_path
            """
            
            result3 = session.run(query3)
            model_files = list(result3)
            
            if model_files:
                print(f"✅ 找到 {len(model_files)} 个model.m文件:")
                for path in model_files:
                    print(f"   - {path['file_path']}")
            else:
                print("❌ 没有找到model.m文件")
            
            # 4. 检查presents变量
            print(f"\n4. 检查presents变量...")
            query4 = """
            MATCH (var:Variable {name: 'presents'})
            RETURN var.name as name, var.file_path as file_path, var.scope_id as scope
            """
            
            result4 = session.run(query4)
            presents_vars = list(result4)
            
            if presents_vars:
                print(f"✅ 找到 {len(presents_vars)} 个presents变量:")
                for var in presents_vars:
                    print(f"   - 文件: {var['file_path']}")
                    print(f"   - 作用域: {var['scope']}")
            else:
                print("❌ 没有找到presents变量")
            
            # 5. 检查路径长度分布
            print(f"\n5. 检查路径长度分布...")
            query5 = """
            MATCH (n)
            WHERE n.file_path IS NOT NULL
            RETURN n.file_path as file_path, size(split(n.file_path, '/')) as path_length
            ORDER BY path_length DESC
            LIMIT 10
            """
            
            result5 = session.run(query5)
            path_lengths = list(result5)
            
            if path_lengths:
                print(f"路径长度分布 (前10个):")
                for item in path_lengths:
                    print(f"   - 长度 {item['path_length']}: {item['file_path']}")
            else:
                print("❌ 没有找到路径信息")
            
            # 6. 检查是否包含绝对路径
            print(f"\n6. 检查是否包含绝对路径...")
            query6 = """
            MATCH (n)
            WHERE n.file_path IS NOT NULL AND n.file_path STARTS WITH '/'
            RETURN DISTINCT n.file_path as file_path
            ORDER BY n.file_path
            LIMIT 10
            """
            
            result6 = session.run(query6)
            absolute_paths = list(result6)
            
            if absolute_paths:
                print(f"⚠️  找到 {len(absolute_paths)} 个绝对路径:")
                for path in absolute_paths:
                    print(f"   - {path['file_path']}")
            else:
                print("✅ 没有找到绝对路径")
            
            # 7. 检查相对路径
            print(f"\n7. 检查相对路径...")
            query7 = """
            MATCH (n)
            WHERE n.file_path IS NOT NULL AND NOT n.file_path STARTS WITH '/'
            RETURN DISTINCT n.file_path as file_path
            ORDER BY n.file_path
            LIMIT 10
            """
            
            result7 = session.run(query7)
            relative_paths = list(result7)
            
            if relative_paths:
                print(f"✅ 找到 {len(relative_paths)} 个相对路径:")
                for path in relative_paths:
                    print(f"   - {path['file_path']}")
            else:
                print("❌ 没有找到相对路径")
        
        driver.close()
        
    except Exception as e:
        print(f"❌ 连接Neo4j时出错: {e}")

if __name__ == "__main__":
    asyncio.run(check_database_paths()) 