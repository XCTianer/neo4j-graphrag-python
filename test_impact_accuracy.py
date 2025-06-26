#!/usr/bin/env python3
"""测试影响链路的真实性"""

from neo4j import GraphDatabase
import json

def test_impact_accuracy():
    """测试影响链路的真实性"""
    driver = GraphDatabase.driver('neo4j://localhost:7687', auth=('neo4j', 'password'))
    
    try:
        with driver.session() as session:
            print("=== 测试影响链路的真实性 ===\n")
            
            # 1. 检查变更的文件是否真实存在
            print("1. 检查变更的文件是否真实存在")
            result = session.run("""
                MATCH (n)
                WHERE n.file_path CONTAINS 'getSupportFilePath.m'
                RETURN n.name as name, labels(n) as node_type, n.file_path as file_path
                LIMIT 10
            """)
            
            print("找到的变更文件相关节点:")
            for record in result:
                print(f"  {record['name']} ({record['node_type']}) - {record['file_path']}")
            
            print("\n" + "="*50 + "\n")
            
            # 2. 检查影响链路中的节点是否真实存在
            print("2. 检查影响链路中的节点是否真实存在")
            result = session.run("""
                MATCH (n)
                WHERE n.name IN ['download', 'getSupportFilePath', 'iCreateDirectoryIfItDoesNotExist', 'directory']
                RETURN n.name as name, labels(n) as node_type, n.file_path as file_path
            """)
            
            print("影响链路中的关键节点:")
            for record in result:
                print(f"  {record['name']} ({record['node_type']}) - {record['file_path']}")
            
            print("\n" + "="*50 + "\n")
            
            # 3. 检查影响链路中的关系是否真实存在
            print("3. 检查影响链路中的关系是否真实存在")
            result = session.run("""
                MATCH (n1)-[r]->(n2)
                WHERE n1.name IN ['download', 'getSupportFilePath', 'iCreateDirectoryIfItDoesNotExist']
                AND n2.name IN ['directory', 'destination', 'source']
                RETURN n1.name as source, type(r) as rel_type, n2.name as target
            """)
            
            print("影响链路中的关键关系:")
            for record in result:
                print(f"  {record['source']} --[{record['rel_type']}]--> {record['target']}")
            
            print("\n" + "="*50 + "\n")
            
            # 4. 验证具体的依赖链路
            print("4. 验证具体的依赖链路")
            
            # 验证链路1: download → directory
            print("验证链路1: download → directory")
            result = session.run("""
                MATCH path = shortestPath((source)-[*1..3]->(target))
                WHERE source.name = 'download' AND target.name = 'directory'
                RETURN path, length(path) as path_length
            """)
            
            records = list(result)
            if records:
                for record in records:
                    path = record["path"]
                    print(f"  路径长度: {record['path_length']}")
                    print("  路径节点:")
                    for i, node in enumerate(path.nodes):
                        print(f"    {i+1}. {node.get('name', 'unknown')} ({list(node.labels)[0] if node.labels else 'Unknown'})")
                    print("  路径关系:")
                    for i, rel in enumerate(path.relationships):
                        print(f"    {i+1}. {rel.start_node.get('name', 'unknown')} --[{rel.type}]--> {rel.end_node.get('name', 'unknown')}")
            else:
                print("  未找到此链路")
            
            print("\n" + "="*50 + "\n")
            
            # 5. 检查是否有虚假的链路
            print("5. 检查是否有虚假的链路")
            result = session.run("""
                MATCH (n1)-[r]->(n2)
                WHERE n1.name = n2.name
                RETURN n1.name as name, type(r) as rel_type
                LIMIT 5
            """)
            
            print("自引用关系（可能是虚假的）:")
            for record in result:
                print(f"  {record['name']} --[{record['rel_type']}]--> {record['name']}")
            
            print("\n" + "="*50 + "\n")
            
            # 6. 检查变更文件的实际影响范围
            print("6. 检查变更文件的实际影响范围")
            result = session.run("""
                MATCH (n)-[r]-(m)
                WHERE n.file_path CONTAINS 'getSupportFilePath.m'
                RETURN n.name as source_name, type(r) as rel_type, m.name as target_name, m.file_path as target_file
                LIMIT 10
            """)
            
            print("变更文件的实际影响:")
            for record in result:
                print(f"  {record['source_name']} --[{record['rel_type']}]--> {record['target_name']} ({record['target_file']})")
            
            print("\n" + "="*50 + "\n")
            
            # 7. 统计分析
            print("7. 统计分析")
            
            # 统计节点数量
            result = session.run("MATCH (n) RETURN count(n) as total_nodes")
            total_nodes = result.single()["total_nodes"]
            print(f"总节点数: {total_nodes}")
            
            # 统计关系数量
            result = session.run("MATCH ()-[r]->() RETURN count(r) as total_rels")
            total_rels = result.single()["total_rels"]
            print(f"总关系数: {total_rels}")
            
            # 统计变更文件相关节点
            result = session.run("""
                MATCH (n)
                WHERE n.file_path CONTAINS 'getSupportFilePath.m'
                RETURN count(n) as changed_nodes
            """)
            changed_nodes = result.single()["changed_nodes"]
            print(f"变更文件相关节点数: {changed_nodes}")
            
            # 统计影响链路数量
            result = session.run("""
                MATCH path = shortestPath((source)-[*1..3]->(target))
                WHERE source.file_path CONTAINS 'getSupportFilePath.m' OR target.file_path CONTAINS 'getSupportFilePath.m'
                RETURN count(path) as impact_chains
            """)
            impact_chains = result.single()["impact_chains"]
            print(f"影响链路数: {impact_chains}")
            
            print(f"\n影响链路密度: {impact_chains / changed_nodes if changed_nodes > 0 else 0:.2f}")
            
    except Exception as e:
        print(f"错误: {e}")
    finally:
        driver.close()

if __name__ == "__main__":
    test_impact_accuracy() 