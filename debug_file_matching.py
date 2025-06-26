#!/usr/bin/env python3
"""
调试文件路径匹配问题
"""

import asyncio
from neo4j import GraphDatabase
import os

async def debug_file_matching():
    """调试文件路径匹配问题"""
    
    # Neo4j连接配置
    uri = "bolt://localhost:7687"
    username = "neo4j"
    password = "password"
    
    try:
        driver = GraphDatabase.driver(uri, auth=(username, password))
        
        with driver.session() as session:
            print("🔍 调试文件路径匹配问题")
            print("=" * 60)
            
            # 实际变更的文件路径
            actual_changed_file = "nj/transformer-models/+gpt2/model.m"
            print(f"实际变更文件: {actual_changed_file}")
            
            # 1. 检查实际变更文件是否存在于Neo4j中
            print(f"\n1. 检查实际变更文件是否存在...")
            query1 = """
            MATCH (n)
            WHERE n.file_path = $file_path
            RETURN labels(n)[0] as type, n.name as name, n.file_path as file_path
            """
            
            result1 = session.run(query1, file_path=actual_changed_file)
            exact_matches = list(result1)
            
            if exact_matches:
                print(f"✅ 找到 {len(exact_matches)} 个精确匹配:")
                for match in exact_matches:
                    print(f"   - {match['type']}: {match['name']}")
            else:
                print("❌ 没有找到精确匹配")
            
            # 2. 检查包含gpt2/model.m的文件
            print(f"\n2. 检查包含gpt2/model.m的文件...")
            query2 = """
            MATCH (n)
            WHERE n.file_path CONTAINS 'gpt2/model.m'
            RETURN labels(n)[0] as type, n.name as name, n.file_path as file_path
            ORDER BY n.file_path
            """
            
            result2 = session.run(query2)
            gpt2_model_files = list(result2)
            
            if gpt2_model_files:
                print(f"✅ 找到 {len(gpt2_model_files)} 个包含gpt2/model.m的文件:")
                files_by_path = {}
                for match in gpt2_model_files:
                    file_path = match['file_path']
                    if file_path not in files_by_path:
                        files_by_path[file_path] = []
                    files_by_path[file_path].append(f"{match['type']}: {match['name']}")
                
                for file_path, entities in files_by_path.items():
                    print(f"   📁 {file_path}")
                    for entity in entities[:5]:  # Show first 5
                        print(f"      - {entity}")
                    if len(entities) > 5:
                        print(f"      ... 还有 {len(entities) - 5} 个")
            else:
                print("❌ 没有找到包含gpt2/model.m的文件")
            
            # 3. 检查presents变量
            print(f"\n3. 检查presents变量...")
            query3 = """
            MATCH (var:Variable {name: 'presents'})
            RETURN var.name as name, var.scope_id as scope, var.file_path as file_path
            """
            
            result3 = session.run(query3)
            presents_vars = list(result3)
            
            if presents_vars:
                print(f"✅ 找到 {len(presents_vars)} 个presents变量:")
                for var in presents_vars:
                    print(f"   - 文件: {var['file_path']}")
                    print(f"   - 作用域: {var['scope']}")
                    
                    # 检查这个文件是否包含gpt2/model.m
                    if 'gpt2/model.m' in var['file_path']:
                        print(f"   ✅ 这个文件包含gpt2/model.m")
                    else:
                        print(f"   ❌ 这个文件不包含gpt2/model.m")
            else:
                print("❌ 没有找到presents变量")
            
            # 4. 检查文件路径匹配策略
            print(f"\n4. 测试文件路径匹配策略...")
            
            # 策略1: 精确路径匹配
            print("   策略1: 精确路径匹配")
            result4a = session.run(query1, file_path=actual_changed_file)
            exact_count = len(list(result4a))
            print(f"   结果: {exact_count} 个匹配")
            
            # 策略2: 文件名匹配
            filename = actual_changed_file.split('/')[-1]  # model.m
            print(f"   策略2: 文件名匹配 ({filename})")
            query4b = """
            MATCH (n)
            WHERE n.file_path ENDS WITH $filename
            RETURN labels(n)[0] as type, n.name as name, n.file_path as file_path
            """
            result4b = session.run(query4b, filename=filename)
            filename_matches = list(result4b)
            print(f"   结果: {len(filename_matches)} 个匹配")
            
            # 策略3: 路径变体匹配
            print("   策略3: 路径变体匹配")
            path_variations = [
                "+gpt2/model.m",
                "gpt2/model.m", 
                "model.m"
            ]
            
            for variation in path_variations:
                query4c = """
                MATCH (n)
                WHERE n.file_path CONTAINS $variation
                RETURN labels(n)[0] as type, n.name as name, n.file_path as file_path
                LIMIT 5
                """
                result4c = session.run(query4c, variation=variation)
                variation_matches = list(result4c)
                print(f"   变体 '{variation}': {len(variation_matches)} 个匹配")
            
            # 5. 分析为什么分析器选择了错误的文件
            print(f"\n5. 分析分析器选择错误文件的原因...")
            
            # 检查当前受影响变量来自哪些文件
            query5 = """
            MATCH (var:Variable)
            WHERE var.name IN ['params', 'val']
            RETURN var.name as name, var.file_path as file_path, COUNT(*) as count
            ORDER BY count DESC
            """
            
            result5 = session.run(query5)
            affected_var_files = list(result5)
            
            if affected_var_files:
                print(f"当前受影响变量来自的文件:")
                for var in affected_var_files:
                    print(f"   - {var['name']}: {var['file_path']} ({var['count']} 个)")
                    
                    # 检查是否包含gpt2/model.m
                    if 'gpt2/model.m' in var['file_path']:
                        print(f"     ✅ 包含gpt2/model.m")
                    else:
                        print(f"     ❌ 不包含gpt2/model.m")
            
            # 6. 检查实际变更文件中的变量
            print(f"\n6. 检查实际变更文件中的变量...")
            
            # 查找包含gpt2/model.m的文件中的变量
            query6 = """
            MATCH (var:Variable)
            WHERE var.file_path CONTAINS 'gpt2/model.m'
            RETURN var.name as name, var.file_path as file_path
            ORDER BY var.name
            """
            
            result6 = session.run(query6)
            actual_vars = list(result6)
            
            if actual_vars:
                print(f"实际变更文件中的变量:")
                for var in actual_vars:
                    print(f"   - {var['name']} (文件: {var['file_path']})")
                    
                    # 检查是否是presents变量
                    if var['name'] == 'presents':
                        print(f"     ✅ 这就是我们要找的presents变量!")
            else:
                print("❌ 没有找到实际变更文件中的变量")
        
        driver.close()
        
    except Exception as e:
        print(f"❌ 连接Neo4j时出错: {e}")

if __name__ == "__main__":
    asyncio.run(debug_file_matching()) 