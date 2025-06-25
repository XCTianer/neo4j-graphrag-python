#!/usr/bin/env python3
"""
文件变更影响分析脚本
通过文件路径定位节点，然后进行影响链路分析
"""

import sys
import os
from typing import List, Dict, Any, Optional
from neo4j import GraphDatabase
from dataclasses import dataclass
from datetime import datetime

@dataclass
class NodeInfo:
    """节点信息"""
    node_id: int
    name: str
    node_type: str
    file_path: Optional[str]
    content: Optional[str]
    properties: Dict[str, Any]

@dataclass
class ImpactPath:
    """影响路径"""
    source_node: NodeInfo
    target_node: NodeInfo
    relationship_type: str
    path_length: int
    path_nodes: List[NodeInfo]

class FileImpactAnalyzer:
    """文件影响分析器"""
    
    def __init__(self, uri: str = "neo4j://localhost:7687", 
                 username: str = "neo4j", password: str = "password"):
        self.driver = GraphDatabase.driver(uri, auth=(username, password))
    
    def close(self):
        """关闭数据库连接"""
        self.driver.close()
    
    def find_nodes_by_file_path(self, file_path: str) -> List[NodeInfo]:
        """通过文件路径查找节点"""
        with self.driver.session() as session:
            result = session.run("""
                MATCH (n)
                WHERE n.file_path = $file_path
                RETURN elementId(n) as node_id, n.name as name, labels(n) as node_type, 
                       n.file_path as file_path, properties(n) as properties
                ORDER BY node_type, name
            """, file_path=file_path)
            
            nodes = []
            for record in result:
                node_type = list(record["node_type"])[0] if record["node_type"] else "Unknown"
                nodes.append(NodeInfo(
                    node_id=record["node_id"],
                    name=record["name"],
                    node_type=node_type,
                    file_path=record["file_path"],
                    content=record["properties"].get("content"),
                    properties=record["properties"]
                ))
            
            return nodes
    
    def find_nodes_by_name_pattern(self, name_pattern: str) -> List[NodeInfo]:
        """通过名称模式查找节点"""
        with self.driver.session() as session:
            result = session.run("""
                MATCH (n)
                WHERE n.name CONTAINS $name_pattern OR n.file_path CONTAINS $name_pattern
                RETURN elementId(n) as node_id, n.name as name, labels(n) as node_type, 
                       n.file_path as file_path, properties(n) as properties
                ORDER BY node_type, name
            """, name_pattern=name_pattern)
            
            nodes = []
            for record in result:
                node_type = list(record["node_type"])[0] if record["node_type"] else "Unknown"
                nodes.append(NodeInfo(
                    node_id=record["node_id"],
                    name=record["name"],
                    node_type=node_type,
                    file_path=record["file_path"],
                    content=record["properties"].get("content"),
                    properties=record["properties"]
                ))
            
            return nodes
    
    def analyze_impact_paths(self, source_node_id: str, max_depth: int = 3) -> List[ImpactPath]:
        """分析从指定节点开始的影响路径"""
        with self.driver.session() as session:
            # 使用Cypher的shortestPath算法查找影响路径，固定深度为3
            result = session.run("""
                MATCH path = shortestPath((source)-[*1..3]->(target))
                WHERE elementId(source) = $source_node_id
                AND source <> target
                RETURN source, target, relationships(path) as rels, length(path) as path_length
                ORDER BY path_length, target.name
                LIMIT 50
            """, source_node_id=source_node_id)
            
            impact_paths = []
            for record in result:
                source_node = self._record_to_node_info(record["source"])
                target_node = self._record_to_node_info(record["target"])
                
                # 获取路径中的所有节点
                path_nodes = self._get_path_nodes(session, source_node_id, elementId(record["target"]))
                
                # 获取关系类型
                rels = list(record["rels"])
                relationship_type = rels[0].type if rels else "UNKNOWN"
                
                impact_paths.append(ImpactPath(
                    source_node=source_node,
                    target_node=target_node,
                    relationship_type=relationship_type,
                    path_length=record["path_length"],
                    path_nodes=path_nodes
                ))
            
            return impact_paths
    
    def analyze_direct_relationships(self, node_id: str) -> Dict[str, List[NodeInfo]]:
        """分析节点的直接关系"""
        with self.driver.session() as session:
            # 查找出边关系
            outgoing_result = session.run("""
                MATCH (source)-[r]->(target)
                WHERE elementId(source) = $node_id
                RETURN type(r) as rel_type, target
                ORDER BY rel_type, target.name
            """, node_id=node_id)
            
            # 查找入边关系
            incoming_result = session.run("""
                MATCH (source)-[r]->(target)
                WHERE elementId(target) = $node_id
                RETURN type(r) as rel_type, source
                ORDER BY rel_type, source.name
            """, node_id=node_id)
            
            relationships = {
                "outgoing": {},
                "incoming": {}
            }
            
            # 处理出边关系
            for record in outgoing_result:
                rel_type = record["rel_type"]
                target_node = self._record_to_node_info(record["target"])
                
                if rel_type not in relationships["outgoing"]:
                    relationships["outgoing"][rel_type] = []
                relationships["outgoing"][rel_type].append(target_node)
            
            # 处理入边关系
            for record in incoming_result:
                rel_type = record["rel_type"]
                source_node = self._record_to_node_info(record["source"])
                
                if rel_type not in relationships["incoming"]:
                    relationships["incoming"][rel_type] = []
                relationships["incoming"][rel_type].append(source_node)
            
            return relationships
    
    def _record_to_node_info(self, node_record) -> NodeInfo:
        """将Neo4j记录转换为NodeInfo对象"""
        node_type = list(node_record.labels)[0] if node_record.labels else "Unknown"
        return NodeInfo(
            node_id=elementId(node_record),
            name=node_record.get("name"),
            node_type=node_type,
            file_path=node_record.get("file_path"),
            content=node_record.get("content"),
            properties=dict(node_record)
        )
    
    def _get_path_nodes(self, session, source_id: str, target_id: str) -> List[NodeInfo]:
        """获取路径中的所有节点"""
        result = session.run("""
            MATCH path = shortestPath((source)-[*]->(target))
            WHERE elementId(source) = $source_id AND elementId(target) = $target_id
            RETURN nodes(path) as path_nodes
        """, source_id=source_id, target_id=target_id)
        
        record = result.single()
        if record:
            return [self._record_to_node_info(node) for node in record["path_nodes"]]
        return []

def elementId(node):
    """获取节点的元素ID"""
    return node.element_id

def print_node_info(node: NodeInfo, prefix: str = ""):
    """打印节点信息"""
    print(f"{prefix}📄 节点ID: {node.node_id}")
    print(f"{prefix}   名称: {node.name}")
    print(f"{prefix}   类型: {node.node_type}")
    print(f"{prefix}   文件路径: {node.file_path}")
    if node.content:
        content_preview = node.content[:100] + "..." if len(node.content) > 100 else node.content
        print(f"{prefix}   内容预览: {content_preview}")

def print_impact_analysis(file_path: str):
    """打印文件影响分析结果"""
    print(f"\n{'='*60}")
    print(f"🔍 文件影响分析: {file_path}")
    print(f"{'='*60}")
    
    analyzer = FileImpactAnalyzer()
    
    try:
        # 1. 查找文件对应的节点
        print(f"\n📂 查找文件节点: {file_path}")
        nodes = analyzer.find_nodes_by_file_path(file_path)
        
        if not nodes:
            print(f"❌ 未找到文件: {file_path}")
            return
        
        print(f"✅ 找到 {len(nodes)} 个节点:")
        for node in nodes:
            print_node_info(node, "  ")
        
        # 2. 分析每个节点的影响
        for node in nodes:
            print(f"\n{'='*50}")
            print(f"🎯 分析节点: {node.name} (ID: {node.node_id})")
            print(f"{'='*50}")
            
            # 分析直接关系
            print(f"\n🔗 直接关系分析:")
            relationships = analyzer.analyze_direct_relationships(node.node_id)
            
            # 出边关系
            if relationships["outgoing"]:
                print(f"  📤 出边关系:")
                for rel_type, targets in relationships["outgoing"].items():
                    print(f"    {rel_type}: {len(targets)} 个目标节点")
                    for target in targets[:3]:  # 只显示前3个
                        print(f"      - {target.name} ({target.node_type})")
                    if len(targets) > 3:
                        print(f"      ... 还有 {len(targets) - 3} 个")
            
            # 入边关系
            if relationships["incoming"]:
                print(f"  📥 入边关系:")
                for rel_type, sources in relationships["incoming"].items():
                    print(f"    {rel_type}: {len(sources)} 个源节点")
                    for source in sources[:3]:  # 只显示前3个
                        print(f"      - {source.name} ({source.node_type})")
                    if len(sources) > 3:
                        print(f"      ... 还有 {len(sources) - 3} 个")
            
            # 分析影响路径
            print(f"\n🔄 影响路径分析 (最大深度: 3):")
            impact_paths = analyzer.analyze_impact_paths(node.node_id, max_depth=3)
            
            if impact_paths:
                print(f"  找到 {len(impact_paths)} 条影响路径:")
                for i, path in enumerate(impact_paths[:10], 1):  # 只显示前10条
                    print(f"  {i}. {path.source_node.name} -> {path.target_node.name}")
                    print(f"     关系类型: {path.relationship_type}")
                    print(f"     路径长度: {path.path_length}")
                    print(f"     目标类型: {path.target_node.node_type}")
                    if path.target_node.file_path:
                        print(f"     目标文件: {path.target_node.file_path}")
                    print()
            else:
                print("  未找到影响路径")
    
    finally:
        analyzer.close()

def main():
    """主函数"""
    if len(sys.argv) < 2:
        print("用法: python analyze_file_impact.py <file_path>")
        print("示例: python analyze_file_impact.py '+bert/+internal/getSupportFilePath.m'")
        return
    
    file_path = sys.argv[1]
    print_impact_analysis(file_path)

if __name__ == "__main__":
    main() 