#!/usr/bin/env python3
"""
Neo4j查询 vs GraphRAG检索器对比示例
展示不使用LLM时两者的区别
"""

import json
from typing import List, Dict, Any
from neo4j import GraphDatabase
from neo4j_graphrag.retrievers import HybridRetriever, VectorRetriever
from neo4j_graphrag.embeddings import SentenceTransformersEmbeddings

class QueryComparison:
    """Neo4j查询与GraphRAG检索器对比"""
    
    def __init__(self, neo4j_uri: str = "bolt://localhost:7687",
                 username: str = "neo4j", password: str = "password"):
        self.driver = GraphDatabase.driver(neo4j_uri, auth=(username, password))
        self.embedder = SentenceTransformersEmbeddings(model_name="all-MiniLM-L6-v2")
        
    def traditional_neo4j_query(self, function_name: str) -> List[str]:
        """传统Neo4j查询 - 精确匹配"""
        try:
            with self.driver.session() as session:
                result = session.run("""
                    MATCH (caller:Function)-[:CALLS]->(target:Function {name: $name})
                    RETURN DISTINCT caller.name as name
                    """, name=function_name)
                return [record['name'] for record in result]
        except Exception as e:
            print(f"传统查询错误: {e}")
            return []
    
    def graphrag_vector_search(self, query_text: str, top_k: int = 5) -> List[Dict]:
        """GraphRAG向量搜索 - 语义匹配"""
        try:
            # 使用向量检索器
            retriever = VectorRetriever(
                driver=self.driver,
                index_name="code_embeddings",
                embedder=self.embedder
            )
            
            result = retriever.get_search_results(
                query_text=query_text,
                top_k=top_k
            )
            
            return [
                {
                    'name': record.get('name', ''),
                    'score': record.get('score', 0),
                    'type': record.get('type', '')
                }
                for record in result.records
            ]
        except Exception as e:
            print(f"GraphRAG向量搜索错误: {e}")
            return []
    
    def graphrag_hybrid_search(self, query_text: str, top_k: int = 5) -> List[Dict]:
        """GraphRAG混合搜索 - 向量+全文"""
        try:
            # 使用混合检索器
            retriever = HybridRetriever(
                driver=self.driver,
                vector_index_name="code_embeddings",
                fulltext_index_name="code_fulltext",
                embedder=self.embedder
            )
            
            result = retriever.get_search_results(
                query_text=query_text,
                top_k=top_k
            )
            
            return [
                {
                    'name': record.get('name', ''),
                    'score': record.get('score', 0),
                    'type': record.get('type', '')
                }
                for record in result.records
            ]
        except Exception as e:
            print(f"GraphRAG混合搜索错误: {e}")
            return []
    
    def compare_search_methods(self, search_target: str):
        """对比不同搜索方法"""
        print(f"\n=== 搜索目标: {search_target} ===\n")
        
        # 1. 传统Neo4j查询
        print("1. 传统Neo4j查询 (精确匹配):")
        traditional_results = self.traditional_neo4j_query(search_target)
        print(f"   结果: {traditional_results}")
        print(f"   特点: 需要精确的函数名，无法处理语义查询")
        
        # 2. GraphRAG向量搜索
        print("\n2. GraphRAG向量搜索 (语义匹配):")
        vector_results = self.graphrag_vector_search(f"使用{search_target}的代码")
        print(f"   结果: {vector_results}")
        print(f"   特点: 可以理解语义，找到相关的代码")
        
        # 3. GraphRAG混合搜索
        print("\n3. GraphRAG混合搜索 (向量+全文):")
        hybrid_results = self.graphrag_hybrid_search(f"使用{search_target}的代码")
        print(f"   结果: {hybrid_results}")
        print(f"   特点: 结合向量相似性和全文搜索，结果更全面")
        
        return {
            'traditional': traditional_results,
            'vector': vector_results,
            'hybrid': hybrid_results
        }
    
    def demonstrate_semantic_search(self):
        """演示语义搜索的优势"""
        print("\n=== 语义搜索演示 ===\n")
        
        # 示例1: 模糊查询
        print("示例1: 查询'数据处理'相关代码")
        results1 = self.graphrag_vector_search("数据处理相关的函数")
        print(f"向量搜索结果: {results1}")
        
        # 示例2: 功能描述查询
        print("\n示例2: 查询'配置管理'相关代码")
        results2 = self.graphrag_vector_search("配置管理和设置相关的代码")
        print(f"向量搜索结果: {results2}")
        
        # 示例3: 错误处理查询
        print("\n示例3: 查询'错误处理'相关代码")
        results3 = self.graphrag_vector_search("错误处理和异常捕获的代码")
        print(f"向量搜索结果: {results3}")
    
    def demonstrate_traditional_limitations(self):
        """演示传统查询的局限性"""
        print("\n=== 传统查询局限性演示 ===\n")
        
        # 传统查询需要精确的函数名
        print("传统查询需要精确的函数名:")
        exact_results = self.traditional_neo4j_query("process_data")
        print(f"精确查询'process_data': {exact_results}")
        
        # 如果函数名不完全匹配，就找不到
        print("\n如果函数名不完全匹配:")
        partial_results = self.traditional_neo4j_query("process")  # 可能找不到
        print(f"部分匹配查询'process': {partial_results}")
        
        # 无法进行语义查询
        print("\n传统查询无法进行语义查询:")
        print("无法查询'处理数据的函数'这样的自然语言")
    
    def __del__(self):
        if hasattr(self, 'driver'):
            self.driver.close()


def main():
    """主函数"""
    comparator = QueryComparison()
    
    # 对比搜索方法
    results = comparator.compare_search_methods("process_data")
    
    # 演示语义搜索
    comparator.demonstrate_semantic_search()
    
    # 演示传统查询局限性
    comparator.demonstrate_traditional_limitations()
    
    print("\n=== 总结 ===")
    print("1. 传统Neo4j查询:")
    print("   - 优点: 简单直接，性能好")
    print("   - 缺点: 需要精确匹配，无法语义搜索")
    print("   - 适用: 已知确切名称的查询")
    
    print("\n2. GraphRAG检索器:")
    print("   - 优点: 支持语义搜索，更灵活")
    print("   - 缺点: 需要向量索引，计算开销大")
    print("   - 适用: 模糊查询，语义理解")
    
    print("\n3. 选择建议:")
    print("   - 简单精确查询: 使用传统Neo4j查询")
    print("   - 复杂语义查询: 使用GraphRAG检索器")
    print("   - 混合场景: 可以结合使用")


if __name__ == "__main__":
    main() 