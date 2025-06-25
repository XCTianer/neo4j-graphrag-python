#!/usr/bin/env python3
"""
Check Neo4j database structure
"""

from neo4j import GraphDatabase
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def check_database_structure():
    """Check the structure of the Neo4j database."""
    
    # Connect to Neo4j
    driver = GraphDatabase.driver(
        "neo4j://localhost:7687",
        auth=("neo4j", "kotei$88")
    )
    
    try:
        # Check what node labels exist
        result = driver.execute_query("CALL db.labels() YIELD label RETURN collect(label) as labels")
        labels = result.records[0]["labels"]
        print(f"Available node labels: {labels}")
        
        # Check what relationship types exist
        result = driver.execute_query("CALL db.relationshipTypes() YIELD relationshipType RETURN collect(relationshipType) as types")
        types = result.records[0]["types"]
        print(f"Available relationship types: {types}")
        
        # Check properties for each label
        for label in labels:
            result = driver.execute_query(f"MATCH (n:{label}) RETURN keys(n) as properties LIMIT 1")
            if result.records:
                properties = result.records[0]["properties"]
                print(f"Properties for {label}: {properties}")
            else:
                print(f"No nodes found for label: {label}")
        
        # Check some sample data
        print("\nSample data:")
        for label in labels:
            result = driver.execute_query(f"MATCH (n:{label}) RETURN n LIMIT 3")
            print(f"\n{label} nodes:")
            for record in result.records:
                node = record["n"]
                print(f"  {dict(node)}")
                
    except Exception as e:
        logger.error(f"Error checking database structure: {e}")
    finally:
        driver.close()

if __name__ == "__main__":
    check_database_structure() 