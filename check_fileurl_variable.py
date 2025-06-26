#!/usr/bin/env python3
"""
检查Neo4j数据库中是否包含fileURL变量
"""

import asyncio
from neo4j import GraphDatabase
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class Neo4jChecker:
    def __init__(self, uri="neo4j://localhost:7687", username="neo4j", password="password"):
        self.driver = GraphDatabase.driver(uri, auth=(username, password))
    
    def close(self):
        self.driver.close()
    
    async def check_fileurl_variable(self):
        """检查fileURL变量是否在Neo4j数据库中"""
        print("🔍 检查Neo4j数据库中的fileURL变量")
        print("=" * 50)
        
        try:
            # 查询所有变量节点
            with self.driver.session() as session:
                # 查询所有Variable类型的节点
                result = session.run("""
                    MATCH (v:Variable)
                    RETURN v.name as name, v.file_path as file_path, 
                           v.scope_id as scope_id, elementId(v) as node_id
                    ORDER BY v.name
                """)
                
                variables = []
                for record in result:
                    variables.append({
                        'name': record['name'],
                        'file_path': record['file_path'],
                        'scope_id': record['scope_id'],
                        'node_id': record['node_id']
                    })
                
                print(f"📊 数据库中总共有 {len(variables)} 个变量")
                
                # 查找fileURL变量
                fileurl_vars = [v for v in variables if v['name'] and 'fileurl' in str(v['name']).lower()]
                
                if fileurl_vars:
                    print(f"\n✅ 找到 {len(fileurl_vars)} 个fileURL相关变量:")
                    for var in fileurl_vars:
                        print(f"  - {var['name']} (文件: {var['file_path']}, 作用域: {var['scope_id']})")
                else:
                    print(f"\n❌ 没有找到fileURL相关变量")
                
                # 查找getSupportFilePath.m文件中的变量
                support_file_vars = [v for v in variables if v['file_path'] and 'getSupportFilePath' in str(v['file_path'])]
                
                if support_file_vars:
                    print(f"\n📁 getSupportFilePath.m文件中的变量:")
                    for var in support_file_vars:
                        print(f"  - {var['name']} (作用域: {var['scope_id']})")
                else:
                    print(f"\n❌ 没有找到getSupportFilePath.m文件中的变量")
                
                # 显示所有变量名称（前20个）
                print(f"\n📋 数据库中的变量名称（前20个）:")
                for i, var in enumerate(variables[:20], 1):
                    print(f"  {i}. {var['name']}")
                
                if len(variables) > 20:
                    print(f"  ... 还有 {len(variables) - 20} 个变量")
                
                # 检查是否有局部变量
                local_vars = [v for v in variables if v['scope_id'] and v['scope_id'] != '']
                global_vars = [v for v in variables if not v['scope_id'] or v['scope_id'] == '']
                
                print(f"\n📊 变量作用域统计:")
                print(f"  - 全局变量: {len(global_vars)} 个")
                print(f"  - 局部变量: {len(local_vars)} 个")
                
        except Exception as e:
            logger.error(f"查询Neo4j数据库时出错: {e}")
            print(f"❌ 查询失败: {e}")

async def main():
    """主函数"""
    checker = Neo4jChecker()
    try:
        await checker.check_fileurl_variable()
    finally:
        checker.close()

if __name__ == "__main__":
    asyncio.run(main()) 