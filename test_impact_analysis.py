#!/usr/bin/env python3
"""
Test impact analysis with existing database files
"""

import asyncio
import logging
from neo4j import GraphDatabase
from extensions.pipelines.code_change_analyzer import CodeChangeAnalyzer

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

async def test_impact_analysis():
    """Test impact analysis with existing database files."""
    
    # Initialize analyzer
    analyzer = CodeChangeAnalyzer(
        neo4j_uri="neo4j://localhost:7687",
        neo4j_username="neo4j",
        neo4j_password="kotei$88"
    )
    
    # Test with files that exist in the database
    test_files = [
        "predictMaskedToken.m",
        "finbert.m", 
        "bert.m",
        "gpt2.m"
    ]
    
    # Create mock commit for testing
    mock_commit = {
        'hash': 'test123',
        'message': 'Test commit for impact analysis',
        'author_name': 'test_user',
        'date': '2025-06-24T00:00:00Z'
    }
    
    # Create mock changes
    mock_changes = []
    for file_path in test_files:
        mock_changes.append({
            'status': 'modified',
            'file_path': file_path,
            'commit_hash': 'test123'
        })
    
    logger.info(f"Testing impact analysis with {len(test_files)} files")
    
    # Analyze each file
    file_analyses = []
    for change in mock_changes:
        logger.info(f"\n=== Analyzing file: {change['file_path']} ===")
        
        # Find entities in the file
        entities = await analyzer._find_entities_by_file_path(change['file_path'])
        logger.info(f"Found {len(entities)} entities")
        
        for entity in entities:
            logger.info(f"  - {entity.get('type')}: {entity.get('name')}")
        
        # Find relationships
        relationships = await analyzer._find_relationships_for_entities(entities)
        logger.info(f"Found {len(relationships)} relationships")
        
        # Generate queries for each entity
        queries = []
        for entity in entities:
            query = await analyzer.query_generator.generate_entity_impact_query(entity, mock_commit)
            if query:
                queries.append(query)
                logger.info(f"Generated {len(query.get('queries', {}))} queries for {entity.get('name')}")
        
        file_analysis = {
            'file_path': change['file_path'],
            'entities': entities,
            'relationships': relationships,
            'queries': queries
        }
        file_analyses.append(file_analysis)
    
    # Generate comprehensive impact analysis
    comprehensive_analysis = await analyzer._generate_comprehensive_analysis(
        [{
            'commit': mock_commit,
            'changes': mock_changes,
            'file_analyses': file_analyses
        }],
        {'name': 'test-repo'}
    )
    
    logger.info("\n=== Comprehensive Analysis Results ===")
    logger.info(f"Total files analyzed: {len(file_analyses)}")
    
    total_entities = sum(len(fa['entities']) for fa in file_analyses)
    total_relationships = sum(len(fa['relationships']) for fa in file_analyses)
    total_queries = sum(len(fa['queries']) for fa in file_analyses)
    
    logger.info(f"Total entities found: {total_entities}")
    logger.info(f"Total relationships found: {total_relationships}")
    logger.info(f"Total queries generated: {total_queries}")
    
    # Generate outputs
    outputs = await analyzer._generate_outputs(comprehensive_analysis, "test_output")
    
    logger.info(f"\nOutput files generated:")
    for output_type, output_path in outputs.items():
        logger.info(f"  {output_type}: {output_path}")
    
    analyzer.driver.close()

if __name__ == "__main__":
    asyncio.run(test_impact_analysis()) 