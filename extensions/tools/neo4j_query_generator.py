"""
Neo4j query generator for code change impact analysis.
"""

import logging
from typing import Dict, List, Optional, Any
from neo4j import GraphDatabase, Driver

logger = logging.getLogger(__name__)


class Neo4jQueryGenerator:
    """Generate Neo4j queries for code change impact analysis."""
    
    def __init__(self, driver: Driver):
        """
        Initialize the query generator.
        
        Args:
            driver: Neo4j driver instance
        """
        self.driver = driver
    
    async def generate_entity_impact_query(
        self, 
        entity: Dict, 
        commit: Dict
    ) -> Optional[Dict]:
        """
        Generate impact query for an entity.
        
        Args:
            entity: Entity information
            commit: Commit information
            
        Returns:
            Query information dictionary
        """
        entity_type = entity.get('type')
        entity_name = entity.get('name', '')
        
        if entity_type == 'Function':
            return await self._generate_function_impact_query(entity, commit)
        elif entity_type == 'Variable':
            return await self._generate_variable_impact_query(entity, commit)
        elif entity_type == 'Script':
            return await self._generate_script_impact_query(entity, commit)
        else:
            logger.warning(f"Unknown entity type: {entity_type}")
            return None
    
    async def generate_relationship_impact_query(
        self, 
        relationship: Dict, 
        commit: Dict
    ) -> Optional[Dict]:
        """
        Generate impact query for a relationship.
        
        Args:
            relationship: Relationship information
            commit: Commit information
            
        Returns:
            Query information dictionary
        """
        rel_type = relationship.get('type')
        
        if rel_type == 'CALLS':
            return await self._generate_calls_impact_query(relationship, commit)
        elif rel_type == 'USES':
            return await self._generate_uses_impact_query(relationship, commit)
        elif rel_type == 'DEFINES':
            return await self._generate_defines_impact_query(relationship, commit)
        elif rel_type == 'MODIFIES':
            return await self._generate_modifies_impact_query(relationship, commit)
        elif rel_type == 'ASSIGNED_TO':
            return await self._generate_assigned_to_impact_query(relationship, commit)
        else:
            logger.warning(f"Unknown relationship type: {rel_type}")
            return None
    
    async def _generate_function_impact_query(
        self, 
        entity: Dict, 
        commit: Dict
    ) -> Dict:
        """Generate impact query for a function."""
        function_name = entity.get('name', '')
        
        # Query 1: Find all functions that call this function
        calls_query = f"""
        MATCH (caller:Function)-[:CALLS]->(target:Function {{name: '{function_name}'}})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        """
        
        # Query 2: Find all variables used by this function
        uses_query = f"""
        MATCH (func:Function {{name: '{function_name}'}})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        """
        
        # Query 3: Find all variables defined by this function
        defines_query = f"""
        MATCH (func:Function {{name: '{function_name}'}})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        """
        
        # Query 4: Impact chain analysis
        impact_chain_query = f"""
        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {{name: '{function_name}'}})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        """
        
        return {
            "entity_type": "Function",
            "entity_name": function_name,
            "commit_hash": commit.get('hash', ''),
            "commit_message": commit.get('message', ''),
            "queries": {
                "callers": {
                    "description": f"Functions that call '{function_name}'",
                    "query": calls_query
                },
                "used_variables": {
                    "description": f"Variables used by '{function_name}'",
                    "query": uses_query
                },
                "defined_variables": {
                    "description": f"Variables defined by '{function_name}'",
                    "query": defines_query
                },
                "impact_chain": {
                    "description": f"Impact chain analysis for '{function_name}'",
                    "query": impact_chain_query
                }
            }
        }
    
    async def _generate_variable_impact_query(
        self, 
        entity: Dict, 
        commit: Dict
    ) -> Dict:
        """Generate impact query for a variable."""
        variable_name = entity.get('name', '')
        scope_id = entity.get('scope_id', '')
        
        # Query 1: Find all functions/scripts that use this variable
        users_query = f"""
        MATCH (user)-[:USES]->(var:Variable {{name: '{variable_name}', scope_id: '{scope_id}'}})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        """
        
        # Query 2: Find all functions/scripts that modify this variable
        modifiers_query = f"""
        MATCH (modifier)-[:MODIFIES]->(var:Variable {{name: '{variable_name}', scope_id: '{scope_id}'}})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        """
        
        # Query 3: Find variables assigned to this variable
        assignments_query = f"""
        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {{name: '{variable_name}', scope_id: '{scope_id}'}})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        """
        
        # Query 4: Find variables this variable is assigned to
        assigned_to_query = f"""
        MATCH (source:Variable {{name: '{variable_name}', scope_id: '{scope_id}'}})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        """
        
        return {
            "entity_type": "Variable",
            "entity_name": variable_name,
            "scope_id": scope_id,
            "commit_hash": commit.get('hash', ''),
            "commit_message": commit.get('message', ''),
            "queries": {
                "users": {
                    "description": f"Functions/scripts that use variable '{variable_name}' in scope '{scope_id}'",
                    "query": users_query
                },
                "modifiers": {
                    "description": f"Functions/scripts that modify variable '{variable_name}' in scope '{scope_id}'",
                    "query": modifiers_query
                },
                "assignments_from": {
                    "description": f"Variables assigned to '{variable_name}' in scope '{scope_id}'",
                    "query": assignments_query
                },
                "assignments_to": {
                    "description": f"Variables that '{variable_name}' in scope '{scope_id}' is assigned to",
                    "query": assigned_to_query
                }
            }
        }
    
    async def _generate_script_impact_query(
        self, 
        entity: Dict, 
        commit: Dict
    ) -> Dict:
        """Generate impact query for a script."""
        script_name = entity.get('name', '')
        
        # Query 1: Find all scripts that call this script
        callers_query = f"""
        MATCH (caller:Script)-[:CALLS]->(target:Script {{name: '{script_name}'}})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller_name
        """
        
        # Query 2: Find all functions called by this script
        called_functions_query = f"""
        MATCH (script:Script {{name: '{script_name}'}})-[:CALLS]->(func:Function)
        RETURN func.name as function_name, func.file_path as function_file
        ORDER BY func.name
        """
        
        # Query 3: Find all variables used by this script
        used_variables_query = f"""
        MATCH (script:Script {{name: '{script_name}'}})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        """
        
        # Query 4: Find all variables defined by this script
        defined_variables_query = f"""
        MATCH (script:Script {{name: '{script_name}'}})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        """
        
        return {
            "entity_type": "Script",
            "entity_name": script_name,
            "commit_hash": commit.get('hash', ''),
            "commit_message": commit.get('message', ''),
            "queries": {
                "callers": {
                    "description": f"Scripts that call '{script_name}'",
                    "query": callers_query
                },
                "called_functions": {
                    "description": f"Functions called by '{script_name}'",
                    "query": called_functions_query
                },
                "used_variables": {
                    "description": f"Variables used by '{script_name}'",
                    "query": used_variables_query
                },
                "defined_variables": {
                    "description": f"Variables defined by '{script_name}'",
                    "query": defined_variables_query
                }
            }
        }
    
    async def _generate_calls_impact_query(
        self, 
        relationship: Dict, 
        commit: Dict
    ) -> Dict:
        """Generate impact query for CALLS relationship."""
        source_name = relationship.get('source_name', '')
        target_name = relationship.get('target_name', '')
        
        # Query: Find all paths that lead to this call
        call_path_query = f"""
        MATCH path = (start)-[:CALLS*1..5]->(caller)-[:CALLS]->(target)
        WHERE target.name = '{target_name}'
        WITH path, start, caller, target, length(path) as depth
        RETURN labels(start)[0] as start_type, start.name as start_name,
               labels(caller)[0] as caller_type, caller.name as caller_name,
               depth, [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start_name
        """
        
        return {
            "relationship_type": "CALLS",
            "source": source_name,
            "target": target_name,
            "commit_hash": commit.get('hash', ''),
            "commit_message": commit.get('message', ''),
            "queries": {
                "call_paths": {
                    "description": f"Call paths leading to '{target_name}'",
                    "query": call_path_query
                }
            }
        }
    
    async def _generate_uses_impact_query(
        self, 
        relationship: Dict, 
        commit: Dict
    ) -> Dict:
        """Generate impact query for USES relationship."""
        user_name = relationship.get('source_name', '')
        variable_name = relationship.get('target_name', '')
        
        # Query: Find all components that depend on this variable usage
        dependency_query = f"""
        MATCH (user)-[:USES]->(var:Variable {{name: '{variable_name}'}})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        """
        
        return {
            "relationship_type": "USES",
            "user": user_name,
            "variable": variable_name,
            "commit_hash": commit.get('hash', ''),
            "commit_message": commit.get('message', ''),
            "queries": {
                "dependencies": {
                    "description": f"Components that depend on usage of variable '{variable_name}'",
                    "query": dependency_query
                }
            }
        }
    
    async def _generate_defines_impact_query(
        self, 
        relationship: Dict, 
        commit: Dict
    ) -> Dict:
        """Generate impact query for DEFINES relationship."""
        definer_name = relationship.get('source_name', '')
        variable_name = relationship.get('target_name', '')
        
        # Query: Find all components that use this defined variable
        usage_query = f"""
        MATCH (definer)-[:DEFINES]->(var:Variable {{name: '{variable_name}'}})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        """
        
        return {
            "relationship_type": "DEFINES",
            "definer": definer_name,
            "variable": variable_name,
            "commit_hash": commit.get('hash', ''),
            "commit_message": commit.get('message', ''),
            "queries": {
                "usage": {
                    "description": f"Components that use variable '{variable_name}' defined by '{definer_name}'",
                    "query": usage_query
                }
            }
        }
    
    async def _generate_modifies_impact_query(
        self, 
        relationship: Dict, 
        commit: Dict
    ) -> Dict:
        """Generate impact query for MODIFIES relationship."""
        modifier_name = relationship.get('source_name', '')
        variable_name = relationship.get('target_name', '')
        
        # Query: Find all components affected by this modification
        impact_query = f"""
        MATCH (modifier)-[:MODIFIES]->(var:Variable {{name: '{variable_name}'}})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(modifier)[0] as modifier_type, modifier.name as modifier_name
        ORDER BY user_type, user_name
        """
        
        return {
            "relationship_type": "MODIFIES",
            "modifier": modifier_name,
            "variable": variable_name,
            "commit_hash": commit.get('hash', ''),
            "commit_message": commit.get('message', ''),
            "queries": {
                "impact": {
                    "description": f"Components affected by modification of variable '{variable_name}' by '{modifier_name}'",
                    "query": impact_query
                }
            }
        }
    
    async def _generate_assigned_to_impact_query(
        self, 
        relationship: Dict, 
        commit: Dict
    ) -> Dict:
        """Generate impact query for ASSIGNED_TO relationship."""
        source_name = relationship.get('source_name', '')
        target_name = relationship.get('target_name', '')
        
        # Query: Find all components that depend on this assignment chain
        dependency_query = f"""
        MATCH (source:Variable {{name: '{source_name}'}})-[:ASSIGNED_TO]->(target:Variable {{name: '{target_name}'}})
        MATCH (user)-[:USES]->(target)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               source.name as source_var, target.name as target_var
        ORDER BY user_type, user_name
        """
        
        return {
            "relationship_type": "ASSIGNED_TO",
            "source": source_name,
            "target": target_name,
            "commit_hash": commit.get('hash', ''),
            "commit_message": commit.get('message', ''),
            "queries": {
                "dependencies": {
                    "description": f"Components that depend on assignment from '{source_name}' to '{target_name}'",
                    "query": dependency_query
                }
            }
        }
    
    async def generate_comprehensive_impact_query(
        self, 
        commit_hash: str
    ) -> Dict:
        """
        Generate comprehensive impact query for a commit.
        
        Args:
            commit_hash: Git commit hash
            
        Returns:
            Comprehensive query information
        """
        # Query: Find all entities and relationships affected by this commit
        comprehensive_query = f"""
        MATCH (entity)
        WHERE entity.commit_hash = '{commit_hash}'
        OPTIONAL MATCH (entity)-[rel]->(related)
        RETURN labels(entity)[0] as entity_type, entity.name as entity_name,
               type(rel) as relationship_type, labels(related)[0] as related_type, related.name as related_name
        ORDER BY entity_type, entity_name, relationship_type
        """
        
        # Query: Find impact chains
        impact_chain_query = f"""
        MATCH path = (start)-[:CALLS|USES|DEFINES|MODIFIES|ASSIGNED_TO*1..5]->(end)
        WHERE start.commit_hash = '{commit_hash}' OR end.commit_hash = '{commit_hash}'
        WITH path, start, end, length(path) as depth
        RETURN [node in nodes(path) | {{name: node.name, type: labels(node)[0]}}] as impact_chain,
               depth, start.name as start_name, end.name as end_name
        ORDER BY depth, start_name
        """
        
        return {
            "commit_hash": commit_hash,
            "queries": {
                "affected_entities": {
                    "description": f"All entities and relationships affected by commit {commit_hash[:8]}",
                    "query": comprehensive_query
                },
                "impact_chains": {
                    "description": f"Impact chains for commit {commit_hash[:8]}",
                    "query": impact_chain_query
                }
            }
        } 