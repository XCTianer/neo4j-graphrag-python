#!/usr/bin/env python3
"""测试完全展开的查询"""

from neo4j import GraphDatabase

def test_expanded_queries():
    """测试完全展开的查询"""
    driver = GraphDatabase.driver('neo4j://localhost:7687', auth=('neo4j', 'password'))
    
    try:
        with driver.session() as session:
            print("=== 测试完全展开的查询 ===\n")
            
            # 测试查询9：查询链路节点的完整关系网络（推荐使用）
            print("1. 测试查询9：查询链路节点的完整关系网络")
            result = session.run("""
                MATCH path = shortestPath((source)-[*1..8]->(target))
                WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3715' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
                WITH nodes(path) as path_nodes
                UNWIND path_nodes as node
                MATCH (n)-[r]-(m)
                WHERE n = node
                RETURN n.name as source_name, type(r) as rel_type, m.name as target_name
                LIMIT 10
            """)
            
            print("找到的关系:")
            for record in result:
                print(f"  {record['source_name']} --[{record['rel_type']}]--> {record['target_name']}")
            
            print("\n" + "="*50 + "\n")
            
            # 测试查询10：查询链路节点的2跳关系网络（最完整显示）
            print("2. 测试查询10：查询链路节点的2跳关系网络")
            result = session.run("""
                MATCH path = shortestPath((source)-[*1..8]->(target))
                WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3715' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
                WITH nodes(path) as path_nodes
                UNWIND path_nodes as node
                MATCH (n)-[r1]-(m1)-[r2]-(m2)
                WHERE n = node
                RETURN n.name as source_name, type(r1) as rel1_type, m1.name as mid_name, type(r2) as rel2_type, m2.name as target_name
                LIMIT 10
            """)
            
            print("找到的2跳关系:")
            for record in result:
                print(f"  {record['source_name']} --[{record['rel1_type']}]--> {record['mid_name']} --[{record['rel2_type']}]--> {record['target_name']}")
            
            print("\n" + "="*50 + "\n")
            
            # 测试特定文件节点的完整关系网络
            print("3. 测试特定文件节点的完整关系网络")
            result = session.run("""
                MATCH (n)
                WHERE n.file_path CONTAINS 'getSupportFilePath.m'
                MATCH (n)-[r]-(m)
                RETURN n.name as source_name, type(r) as rel_type, m.name as target_name
                LIMIT 10
            """)
            
            print("找到的关系:")
            for record in result:
                print(f"  {record['source_name']} --[{record['rel_type']}]--> {record['target_name']}")
            
    except Exception as e:
        print(f"错误: {e}")
    finally:
        driver.close()

if __name__ == "__main__":
    test_expanded_queries() 