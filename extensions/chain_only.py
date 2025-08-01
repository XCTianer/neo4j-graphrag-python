#!/usr/bin/env python3
"""
Chain Only - 最终极简影响链路分析器
只输出最简洁的影响链路，没有任何额外信息
"""

import json
from typing import Dict, Any, List
from neo4j import GraphDatabase

class ChainOnly:
    """最终极简影响链路分析器"""
    
    def __init__(self, neo4j_uri: str = "bolt://localhost:7687",
                 username: str = "neo4j", password: str = "password"):
        self.driver = GraphDatabase.driver(neo4j_uri, auth=(username, password))
    
    def get_chain(self, changes: Dict[str, Any]) -> List[Dict[str, Any]]:
        """获取最简洁的影响链路"""
        chain = []
        
        # 函数变更影响
        if changes.get('changed_functions'):
            for func in changes['changed_functions']:
                callers = self._get_callers(func)
                if callers:
                    chain.append({
                        'function': func,
                        'affected': callers
                    })
        
        # 变量变更影响
        if changes.get('changed_variables'):
            for var in changes['changed_variables']:
                users = self._get_users(var)
                if users:
                    chain.append({
                        'variable': var,
                        'affected': users
                    })
        
        # 文件变更影响
        if changes.get('modified_files'):
            for file_path in changes['modified_files']:
                entities = self._get_entities(file_path)
                if entities:
                    chain.append({
                        'file': file_path,
                        'affected': entities
                    })
        
        return chain
    
    def _get_callers(self, function_name: str) -> List[str]:
        """获取函数调用者"""
        try:
            with self.driver.session() as session:
                result = session.run("""
                    MATCH (caller:Function)-[:CALLS]->(target:Function {name: $name})
                    RETURN DISTINCT caller.name as name
                    """, name=function_name)
                return [record['name'] for record in result]
        except:
            return []
    
    def _get_users(self, variable_name: str) -> List[str]:
        """获取变量使用者"""
        try:
            with self.driver.session() as session:
                result = session.run("""
                    MATCH (user)-[:USES]->(var:Variable {name: $name})
                    RETURN DISTINCT user.name as name, labels(user)[0] as type
                    """, name=variable_name)
                return [f"{record['type']}:{record['name']}" for record in result]
        except:
            return []
    
    def _get_entities(self, file_path: str) -> List[str]:
        """获取文件实体"""
        try:
            with self.driver.session() as session:
                result = session.run("""
                    MATCH (entity)
                    WHERE entity.file_path CONTAINS $path
                    RETURN DISTINCT entity.name as name, labels(entity)[0] as type
                    """, path=file_path)
                return [f"{record['type']}:{record['name']}" for record in result]
        except:
            return []
    
    def __del__(self):
        if hasattr(self, 'driver'):
            self.driver.close()


def main():
    """主函数"""
    analyzer = ChainOnly()
    
    changes = {
        'modified_files': ['src/main.m', 'src/utils.m'],
        'changed_variables': ['config', 'data'],
        'changed_functions': ['process_data', 'validate_input']
    }
    
    chain = analyzer.get_chain(changes)
    print(json.dumps(chain, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main() 