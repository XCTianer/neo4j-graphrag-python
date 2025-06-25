#!/usr/bin/env python3
"""
Test script to verify improved file path matching functionality.
"""

import asyncio
import logging
from extensions.pipelines.code_change_analyzer import CodeChangeAnalyzer

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

async def test_path_matching():
    """Test the improved path matching functionality."""
    
    # Initialize the analyzer
    analyzer = CodeChangeAnalyzer(
        neo4j_uri="neo4j://localhost:7687",
        neo4j_username="neo4j",
        neo4j_password="password"
    )
    
    # Test file paths that should match
    test_paths = [
        "nj/transformer-models/+gpt2/+internal/getSupportFilePath.m",
        "nj/transformer-models/+bert/+internal/getSupportFilePath.m", 
        "nj/transformer-models/+finbert/+internal/getSupportFilePath.m",
        "some/other/path/getSupportFilePath.m",
        "getSupportFilePath.m"
    ]
    
    print("Testing improved path matching functionality...")
    print("=" * 60)
    
    for file_path in test_paths:
        print(f"\nTesting file path: {file_path}")
        print("-" * 40)
        
        # Test path variations generation
        variations = analyzer._generate_path_variations(file_path)
        print(f"Generated path variations: {variations}")
        
        # Test entity finding
        entities = await analyzer._find_entities_by_file_path(file_path)
        
        if entities:
            print(f"✅ Found {len(entities)} entities:")
            for entity in entities:
                print(f"  - {entity['type']}: {entity['name']} in {entity['file_path']}")
        else:
            print("❌ No entities found")
    
    # Test with a known file that should exist
    print("\n" + "=" * 60)
    print("Testing with known file paths from database...")
    
    # Query for all files in the database to see what's available
    try:
        query = """
        MATCH (n)
        WHERE n.file_path IS NOT NULL
        RETURN DISTINCT n.file_path as file_path
        ORDER BY n.file_path
        LIMIT 20
        """
        
        result = analyzer.driver.execute_query(query)
        available_files = [record["file_path"] for record in result.records]
        
        print(f"Available files in database (first 20):")
        for file_path in available_files:
            print(f"  - {file_path}")
        
        # Test with some available files
        if available_files:
            print(f"\nTesting with first available file: {available_files[0]}")
            entities = await analyzer._find_entities_by_file_path(available_files[0])
            if entities:
                print(f"✅ Found {len(entities)} entities for {available_files[0]}")
            else:
                print(f"❌ No entities found for {available_files[0]}")
                
    except Exception as e:
        print(f"Error querying database: {e}")

if __name__ == "__main__":
    asyncio.run(test_path_matching()) 