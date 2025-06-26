#!/usr/bin/env python3
"""
检查presents变量是否存在于Neo4j中
"""

import asyncio
from neo4j import GraphDatabase
import os

async def check_presents_variable():
    """检查presents变量是否存在于Neo4j中"""
    
    # Neo4j连接配置
    uri = "bolt://localhost:7687"
    username = "neo4j"
    password = "password"
    
    try:
        driver = GraphDatabase.driver(uri, auth=(username, password))
        
        with driver.session() as session:
            print("🔍 检查presents变量是否存在...")
            
            # 1. 检查是否存在名为presents的变量
            query1 = """
            MATCH (var:Variable {name: 'presents'})
            RETURN var.name as name, var.scope_id as scope, var.file_path as file_path
            """
            
            result1 = session.run(query1)
            presents_vars = list(result1)
            
            if presents_vars:
                print(f"✅ 找到 {len(presents_vars)} 个presents变量:")
                for var in presents_vars:
                    print(f"   - 名称: {var['name']}")
                    print(f"   - 作用域: {var['scope']}")
                    print(f"   - 文件: {var['file_path']}")
            else:
                print("❌ 没有找到名为presents的变量")
            
            # 2. 检查变更文件中的变量
            print("\n🔍 检查变更文件中的变量...")
            query2 = """
            MATCH (var:Variable)
            WHERE var.file_path CONTAINS '+gpt2/model.m'
            RETURN var.name as name, var.scope_id as scope, var.file_path as file_path
            ORDER BY var.name
            """
            
            result2 = session.run(query2)
            gpt2_vars = list(result2)
            
            if gpt2_vars:
                print(f"✅ 在+gpt2/model.m文件中找到 {len(gpt2_vars)} 个变量:")
                for var in gpt2_vars:
                    print(f"   - {var['name']} (作用域: {var['scope']})")
            else:
                print("❌ 在+gpt2/model.m文件中没有找到变量")
            
            # 3. 检查所有包含presents的文件
            print("\n🔍 检查所有包含presents的文件...")
            query3 = """
            MATCH (var:Variable)
            WHERE var.name CONTAINS 'present'
            RETURN var.name as name, var.scope_id as scope, var.file_path as file_path
            ORDER BY var.name
            """
            
            result3 = session.run(query3)
            present_vars = list(result3)
            
            if present_vars:
                print(f"✅ 找到 {len(present_vars)} 个包含'present'的变量:")
                for var in present_vars:
                    print(f"   - {var['name']} (作用域: {var['scope']}, 文件: {var['file_path']})")
            else:
                print("❌ 没有找到包含'present'的变量")
            
            # 4. 检查变更文件中的所有实体
            print("\n🔍 检查变更文件中的所有实体...")
            query4 = """
            MATCH (entity)
            WHERE entity.file_path CONTAINS '+gpt2/model.m'
            RETURN labels(entity)[0] as type, entity.name as name, entity.file_path as file_path
            ORDER BY type, name
            """
            
            result4 = session.run(query4)
            all_entities = list(result4)
            
            if all_entities:
                print(f"✅ 在+gpt2/model.m文件中找到 {len(all_entities)} 个实体:")
                entities_by_type = {}
                for entity in all_entities:
                    entity_type = entity['type']
                    if entity_type not in entities_by_type:
                        entities_by_type[entity_type] = []
                    entities_by_type[entity_type].append(entity['name'])
                
                for entity_type, names in entities_by_type.items():
                    print(f"   {entity_type} ({len(names)}): {', '.join(names[:10])}")
                    if len(names) > 10:
                        print(f"     ... 还有 {len(names) - 10} 个")
            else:
                print("❌ 在+gpt2/model.m文件中没有找到实体")
            
            # 5. 分析为什么presents没有出现在受影响变量中
            print("\n🔍 分析受影响变量确定逻辑...")
            
            # 检查当前受影响变量
            query5 = """
            MATCH (var:Variable)
            WHERE var.name IN ['params', 'val']
            RETURN var.name as name, var.scope_id as scope, var.file_path as file_path
            """
            
            result5 = session.run(query5)
            affected_vars = list(result5)
            
            if affected_vars:
                print(f"✅ 当前受影响变量:")
                for var in affected_vars:
                    print(f"   - {var['name']} (作用域: {var['scope']}, 文件: {var['file_path']})")
            else:
                print("❌ 没有找到params或val变量")
            
            # 6. 检查这些变量是否真的在变更文件中
            print("\n🔍 检查params和val变量是否在变更文件中...")
            query6 = """
            MATCH (var:Variable)
            WHERE var.name IN ['params', 'val'] AND var.file_path CONTAINS '+gpt2/model.m'
            RETURN var.name as name, var.scope_id as scope, var.file_path as file_path
            """
            
            result6 = session.run(query6)
            actual_affected_vars = list(result6)
            
            if actual_affected_vars:
                print(f"✅ 在变更文件中找到的变量:")
                for var in actual_affected_vars:
                    print(f"   - {var['name']} (作用域: {var['scope']})")
            else:
                print("❌ params和val变量不在变更文件中")
                print("   这说明受影响变量分析可能有问题")
        
        driver.close()
        
    except Exception as e:
        print(f"❌ 连接Neo4j时出错: {e}")

if __name__ == "__main__":
    asyncio.run(check_presents_variable()) 