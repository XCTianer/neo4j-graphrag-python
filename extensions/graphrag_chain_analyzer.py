#!/usr/bin/env python3
"""
GraphRAG Chain Analyzer - 使用neo4j-graphrag库的影响链路分析器
利用neo4j-graphrag的检索功能进行智能影响链路分析
"""

import json
import logging
from typing import Dict, Any, List, Optional
from neo4j import GraphDatabase
from neo4j_graphrag.retrievers import Text2CypherRetriever, HybridCypherRetriever
from neo4j_graphrag.llm import OpenAILLM, AnthropicLLM, OllamaLLM
from neo4j_graphrag.embeddings import OpenAIEmbeddings, SentenceTransformersEmbeddings
from neo4j_graphrag.generation import GraphRAG
from neo4j_graphrag.generation.prompts import RagTemplate

# 配置日志
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class GraphRAGChainAnalyzer:
    """使用neo4j-graphrag库的智能影响链路分析器"""
    
    def __init__(self, 
                 neo4j_uri: str = "bolt://localhost:7687",
                 username: str = "neo4j", 
                 password: str = "password",
                 llm_type: str = "ollama",
                 embedder_type: str = "sentence_transformers"):
        """
        初始化分析器
        
        Args:
            neo4j_uri: Neo4j连接URI
            username: Neo4j用户名
            password: Neo4j密码
            llm_type: LLM类型 (openai, anthropic, ollama)
            embedder_type: 嵌入模型类型 (openai, sentence_transformers)
        """
        self.driver = GraphDatabase.driver(neo4j_uri, auth=(username, password))
        self.llm = self._setup_llm(llm_type)
        self.embedder = self._setup_embedder(embedder_type)
        self.text2cypher_retriever = None
        self.hybrid_retriever = None
        
    def _setup_llm(self, llm_type: str):
        """设置LLM"""
        if llm_type == "openai":
            return OpenAILLM(
                model="gpt-3.5-turbo",
                api_key="your-openai-api-key"  # 需要配置
            )
        elif llm_type == "anthropic":
            return AnthropicLLM(
                model="claude-3-sonnet-20240229",
                api_key="your-anthropic-api-key"  # 需要配置
            )
        elif llm_type == "ollama":
            return OllamaLLM(
                model="llama2",
                base_url="http://localhost:11434"
            )
        else:
            raise ValueError(f"不支持的LLM类型: {llm_type}")
    
    def _setup_embedder(self, embedder_type: str):
        """设置嵌入模型"""
        if embedder_type == "openai":
            return OpenAIEmbeddings(
                model="text-embedding-ada-002",
                api_key="your-openai-api-key"  # 需要配置
            )
        elif embedder_type == "sentence_transformers":
            return SentenceTransformersEmbeddings(
                model_name="all-MiniLM-L6-v2"
            )
        else:
            raise ValueError(f"不支持的嵌入模型类型: {embedder_type}")
    
    def setup_text2cypher_retriever(self, schema: Optional[str] = None):
        """设置Text2Cypher检索器"""
        self.text2cypher_retriever = Text2CypherRetriever(
            driver=self.driver,
            llm=self.llm,
            neo4j_schema=schema
        )
    
    def setup_hybrid_retriever(self, vector_index: str, fulltext_index: str):
        """设置混合检索器"""
        self.hybrid_retriever = HybridCypherRetriever(
            driver=self.driver,
            vector_index_name=vector_index,
            fulltext_index_name=fulltext_index,
            retrieval_query="""
            MATCH (node)-[:CALLS*]->(target)
            OPTIONAL MATCH (node)-[:USES]->(var:Variable)
            OPTIONAL MATCH (node)-[:BELONGS_TO]->(file:File)
            RETURN DISTINCT node.name as name, labels(node)[0] as type, 
                   collect(DISTINCT target.name) as calls,
                   collect(DISTINCT var.name) as variables,
                   collect(DISTINCT file.path) as files
            """,
            embedder=self.embedder
        )
    
    def analyze_function_impact(self, function_name: str) -> Dict[str, Any]:
        """分析函数变更影响"""
        if not self.text2cypher_retriever:
            self.setup_text2cypher_retriever()
        
        query = f"找出所有调用函数 '{function_name}' 的函数，并返回调用链"
        try:
            result = self.text2cypher_retriever.get_search_results(query)
            return {
                'function': function_name,
                'impact_analysis': 'text2cypher',
                'affected_functions': [record['name'] for record in result.records],
                'call_chain': result.records
            }
        except Exception as e:
            logger.error(f"分析函数 {function_name} 影响时出错: {e}")
            return {'function': function_name, 'error': str(e)}
    
    def analyze_variable_impact(self, variable_name: str) -> Dict[str, Any]:
        """分析变量变更影响"""
        if not self.hybrid_retriever:
            # 使用默认索引名称，实际使用时需要根据数据库调整
            self.setup_hybrid_retriever("code_embeddings", "code_fulltext")
        
        try:
            result = self.hybrid_retriever.get_search_results(
                query_text=f"使用变量 {variable_name} 的代码",
                top_k=10
            )
            return {
                'variable': variable_name,
                'impact_analysis': 'hybrid_search',
                'affected_code': [record['name'] for record in result.records],
                'usage_details': result.records
            }
        except Exception as e:
            logger.error(f"分析变量 {variable_name} 影响时出错: {e}")
            return {'variable': variable_name, 'error': str(e)}
    
    def analyze_file_impact(self, file_path: str) -> Dict[str, Any]:
        """分析文件变更影响"""
        if not self.text2cypher_retriever:
            self.setup_text2cypher_retriever()
        
        query = f"找出文件 '{file_path}' 中定义的所有函数和变量，以及它们被其他文件使用的情况"
        try:
            result = self.text2cypher_retriever.get_search_results(query)
            return {
                'file': file_path,
                'impact_analysis': 'text2cypher',
                'defined_entities': [record['name'] for record in result.records],
                'usage_analysis': result.records
            }
        except Exception as e:
            logger.error(f"分析文件 {file_path} 影响时出错: {e}")
            return {'file': file_path, 'error': str(e)}
    
    def get_comprehensive_chain(self, changes: Dict[str, Any]) -> List[Dict[str, Any]]:
        """获取综合分析的影响链路"""
        chain = []
        
        # 函数变更影响
        if changes.get('changed_functions'):
            for func in changes['changed_functions']:
                impact = self.analyze_function_impact(func)
                chain.append(impact)
        
        # 变量变更影响
        if changes.get('changed_variables'):
            for var in changes['changed_variables']:
                impact = self.analyze_variable_impact(var)
                chain.append(impact)
        
        # 文件变更影响
        if changes.get('modified_files'):
            for file_path in changes['modified_files']:
                impact = self.analyze_file_impact(file_path)
                chain.append(impact)
        
        return chain
    
    def get_smart_analysis(self, question: str) -> Dict[str, Any]:
        """使用GraphRAG进行智能分析"""
        if not self.text2cypher_retriever:
            self.setup_text2cypher_retriever()
        
        # 创建GraphRAG实例
        graphrag = GraphRAG(
            retriever=self.text2cypher_retriever,
            llm=self.llm
        )
        
        try:
            result = graphrag.generate(question)
            return {
                'question': question,
                'analysis_type': 'graphrag_smart_analysis',
                'answer': result.answer,
                'context': result.context,
                'metadata': result.metadata
            }
        except Exception as e:
            logger.error(f"智能分析时出错: {e}")
            return {'question': question, 'error': str(e)}
    
    def __del__(self):
        if hasattr(self, 'driver'):
            self.driver.close()


def main():
    """主函数示例"""
    # 创建分析器实例
    analyzer = GraphRAGChainAnalyzer(
        neo4j_uri="bolt://localhost:7687",
        username="neo4j",
        password="password",
        llm_type="ollama",  # 使用本地Ollama
        embedder_type="sentence_transformers"  # 使用本地嵌入模型
    )
    
    # 示例变更数据
    changes = {
        'modified_files': ['src/main.py', 'src/utils.py'],
        'changed_variables': ['config', 'data'],
        'changed_functions': ['process_data', 'validate_input']
    }
    
    print("=== 综合分析影响链路 ===")
    chain = analyzer.get_comprehensive_chain(changes)
    print(json.dumps(chain, ensure_ascii=False, indent=2))
    
    print("\n=== 智能分析示例 ===")
    smart_result = analyzer.get_smart_analysis(
        "如果修改了process_data函数，会对整个系统产生什么影响？"
    )
    print(json.dumps(smart_result, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main() 