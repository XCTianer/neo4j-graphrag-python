#!/usr/bin/env python3
"""
Neo4j数据库导出脚本
导出所有节点、关系和属性到JSON文件
"""

import json
import os
from datetime import datetime
from neo4j import GraphDatabase

class Neo4jExporter:
    def __init__(self, uri="bolt://localhost:7687", user="neo4j", password="kotei$88"):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))
        
    def close(self):
        self.driver.close()
        
    def export_all_data(self, output_dir="database_export"):
        """导出所有数据库数据"""
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)
            
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        
        # 导出节点
        nodes_data = self.export_nodes()
        nodes_file = os.path.join(output_dir, f"nodes_{timestamp}.json")
        with open(nodes_file, 'w', encoding='utf-8') as f:
            json.dump(nodes_data, f, ensure_ascii=False, indent=2)
        print(f"节点数据已导出到: {nodes_file}")
        
        # 导出关系
        relationships_data = self.export_relationships()
        relationships_file = os.path.join(output_dir, f"relationships_{timestamp}.json")
        with open(relationships_file, 'w', encoding='utf-8') as f:
            json.dump(relationships_data, f, ensure_ascii=False, indent=2)
        print(f"关系数据已导出到: {relationships_file}")
        
        # 导出统计信息
        stats_data = self.export_statistics()
        stats_file = os.path.join(output_dir, f"statistics_{timestamp}.json")
        with open(stats_file, 'w', encoding='utf-8') as f:
            json.dump(stats_data, f, ensure_ascii=False, indent=2)
        print(f"统计信息已导出到: {stats_file}")
        
        # 导出Cypher查询
        cypher_data = self.export_cypher_queries()
        cypher_file = os.path.join(output_dir, f"cypher_queries_{timestamp}.cypher")
        with open(cypher_file, 'w', encoding='utf-8') as f:
            f.write(cypher_data)
        print(f"Cypher查询已导出到: {cypher_file}")
        
        # 创建导出报告
        report_data = {
            "export_timestamp": timestamp,
            "export_files": {
                "nodes": nodes_file,
                "relationships": relationships_file,
                "statistics": stats_file,
                "cypher_queries": cypher_file
            },
            "summary": stats_data
        }
        
        report_file = os.path.join(output_dir, f"export_report_{timestamp}.json")
        with open(report_file, 'w', encoding='utf-8') as f:
            json.dump(report_data, f, ensure_ascii=False, indent=2)
        print(f"导出报告已保存到: {report_file}")
        
        return output_dir
        
    def export_nodes(self):
        """导出所有节点"""
        with self.driver.session() as session:
            result = session.run("""
                MATCH (n)
                RETURN labels(n) as labels, 
                       properties(n) as properties,
                       id(n) as id
                ORDER BY labels(n), id(n)
            """)
            
            nodes = []
            for record in result:
                nodes.append({
                    "id": record["id"],
                    "labels": record["labels"],
                    "properties": record["properties"]
                })
            return nodes
            
    def export_relationships(self):
        """导出所有关系"""
        with self.driver.session() as session:
            result = session.run("""
                MATCH (a)-[r]->(b)
                RETURN id(a) as source_id,
                       labels(a) as source_labels,
                       type(r) as relationship_type,
                       properties(r) as relationship_properties,
                       id(b) as target_id,
                       labels(b) as target_labels
                ORDER BY type(r), id(a), id(b)
            """)
            
            relationships = []
            for record in result:
                relationships.append({
                    "source_id": record["source_id"],
                    "source_labels": record["source_labels"],
                    "relationship_type": record["relationship_type"],
                    "relationship_properties": record["relationship_properties"],
                    "target_id": record["target_id"],
                    "target_labels": record["target_labels"]
                })
            return relationships
            
    def export_statistics(self):
        """导出数据库统计信息"""
        with self.driver.session() as session:
            # 节点统计
            node_stats = session.run("""
                MATCH (n)
                RETURN labels(n) as labels, count(n) as count
                ORDER BY labels(n)
            """)
            
            # 关系统计
            rel_stats = session.run("""
                MATCH ()-[r]->()
                RETURN type(r) as type, count(r) as count
                ORDER BY type(r)
            """)
            
            # 总统计
            total_stats = session.run("""
                MATCH (n)
                WITH count(n) as total_nodes
                MATCH ()-[r]->()
                WITH total_nodes, count(r) as total_relationships
                RETURN total_nodes, total_relationships
            """).single()
            
            stats = {
                "total_nodes": total_stats["total_nodes"],
                "total_relationships": total_stats["total_relationships"],
                "nodes_by_label": {':'.join(record["labels"]): record["count"] for record in node_stats},
                "relationships_by_type": {record["type"]: record["count"] for record in rel_stats}
            }
            return stats
            
    def export_cypher_queries(self):
        """导出重建数据库的Cypher查询"""
        cypher_queries = []
        
        # 获取所有节点
        with self.driver.session() as session:
            nodes = session.run("""
                MATCH (n)
                RETURN labels(n) as labels, properties(n) as properties, id(n) as id
                ORDER BY id(n)
            """)
            
            for record in nodes:
                labels = ':'.join(record["labels"])
                props = record["properties"]
                prop_str = ', '.join([f'{k}: "{v}"' if isinstance(v, str) else f'{k}: {v}' 
                                    for k, v in props.items()])
                query = f"CREATE (n:{labels} {{{prop_str}}})"
                cypher_queries.append(query)
            
            # 获取所有关系
            relationships = session.run("""
                MATCH (a)-[r]->(b)
                RETURN id(a) as source_id, type(r) as type, 
                       properties(r) as properties, id(b) as target_id
                ORDER BY id(a), id(b)
            """)
            
            for record in relationships:
                rel_type = record["type"]
                props = record["properties"]
                prop_str = ', '.join([f'{k}: "{v}"' if isinstance(v, str) else f'{k}: {v}' 
                                    for k, v in props.items()]) if props else ""
                
                if prop_str:
                    query = f"MATCH (a), (b) WHERE id(a) = {record['source_id']} AND id(b) = {record['target_id']} CREATE (a)-[r:{rel_type} {{{prop_str}}}]->(b)"
                else:
                    query = f"MATCH (a), (b) WHERE id(a) = {record['source_id']} AND id(b) = {record['target_id']} CREATE (a)-[r:{rel_type}]->(b)"
                cypher_queries.append(query)
        
        return '\n'.join(cypher_queries)

def main():
    print("开始导出Neo4j数据库...")
    
    try:
        exporter = Neo4jExporter()
        output_dir = exporter.export_all_data()
        exporter.close()
        
        print(f"\n数据库导出完成！")
        print(f"导出目录: {output_dir}")
        print(f"包含以下文件:")
        for file in os.listdir(output_dir):
            print(f"  - {file}")
            
    except Exception as e:
        print(f"导出过程中出现错误: {e}")
        return 1
    
    return 0

if __name__ == "__main__":
    exit(main()) 