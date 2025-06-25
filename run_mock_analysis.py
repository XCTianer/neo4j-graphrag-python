#!/usr/bin/env python3
"""
Run mock analysis using files that exist in the database
"""

import asyncio
import logging
from pathlib import Path
from extensions.pipelines.code_change_analyzer import CodeChangeAnalyzer

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

async def run_mock_analysis():
    """Run analysis with mock commits using existing database files."""
    
    # Initialize analyzer
    analyzer = CodeChangeAnalyzer(
        neo4j_uri="neo4j://localhost:7687",
        neo4j_username="neo4j",
        neo4j_password="kotei$88"
    )
    
    # Create mock commit data using files that exist in the database
    mock_commits = [
        {
            'hash': 'mock123456789',
            'message': 'Mock commit: Update BERT model implementation',
            'author_name': 'mock_user',
            'date': '2025-06-24T10:00:00Z',
            'changes': [
                {'status': 'modified', 'file_path': 'bert.m'},
                {'status': 'modified', 'file_path': 'finbert.m'},
                {'status': 'modified', 'file_path': 'predictMaskedToken.m'}
            ]
        },
        {
            'hash': 'mock987654321',
            'message': 'Mock commit: Update GPT2 model implementation',
            'author_name': 'mock_user',
            'date': '2025-06-24T11:00:00Z',
            'changes': [
                {'status': 'modified', 'file_path': 'gpt2.m'},
                {'status': 'modified', 'file_path': 'bert.m'}
            ]
        }
    ]
    
    logger.info(f"Running mock analysis with {len(mock_commits)} commits")
    
    # Analyze each mock commit
    analysis_results = []
    for commit in mock_commits:
        logger.info(f"\n=== Analyzing mock commit: {commit['hash'][:8]} ===")
        logger.info(f"Message: {commit['message']}")
        
        # Analyze each changed file
        file_analyses = []
        for change in commit['changes']:
            logger.info(f"  Analyzing file: {change['file_path']}")
            
            # Find entities in the file
            entities = await analyzer._find_entities_by_file_path(change['file_path'])
            logger.info(f"    Found {len(entities)} entities")
            
            # Find relationships
            relationships = await analyzer._find_relationships_for_entities(entities)
            logger.info(f"    Found {len(relationships)} relationships")
            
            # Generate queries for each entity
            queries = []
            for entity in entities:
                query = await analyzer.query_generator.generate_entity_impact_query(entity, commit)
                if query:
                    queries.append(query)
            
            file_analysis = {
                'file_path': change['file_path'],
                'entities': entities,
                'relationships': relationships,
                'queries': queries
            }
            file_analyses.append(file_analysis)
        
        # Generate impact analysis
        impact_analysis = await analyzer._generate_impact_analysis(file_analyses, commit)
        
        # Generate Neo4j queries
        queries = await analyzer._generate_queries_for_commit(file_analyses, commit)
        
        commit_analysis = {
            'commit': commit,
            'changes': commit['changes'],
            'file_analyses': file_analyses,
            'impact_analysis': impact_analysis,
            'queries': queries
        }
        analysis_results.append(commit_analysis)
    
    # Generate comprehensive analysis
    comprehensive_analysis = await analyzer._generate_comprehensive_analysis(
        analysis_results,
        {'name': 'mock-transformer-models'}
    )
    
    # Generate outputs
    output_dir = "mock_analysis_output"
    Path(output_dir).mkdir(parents=True, exist_ok=True)
    
    outputs = await analyzer._generate_outputs(comprehensive_analysis, output_dir)
    
    # Print summary
    logger.info("\n=== Mock Analysis Summary ===")
    logger.info(f"📊 Total commits analyzed: {len(mock_commits)}")
    
    total_entities = sum(len(fa['entities']) for ca in analysis_results for fa in ca['file_analyses'])
    total_relationships = sum(len(fa['relationships']) for ca in analysis_results for fa in ca['file_analyses'])
    total_queries = sum(len(fa['queries']) for ca in analysis_results for fa in ca['file_analyses'])
    
    logger.info(f"🔧 Total entities found: {total_entities}")
    logger.info(f"🔗 Total relationships found: {total_relationships}")
    logger.info(f"📝 Total queries generated: {total_queries}")
    
    logger.info(f"\n📁 Output files generated in: {output_dir}")
    for output_type, output_path in outputs.items():
        logger.info(f"  📄 {output_type}: {output_path}")
    
    analyzer.driver.close()
    logger.info("\n✅ Mock analysis completed successfully!")

if __name__ == "__main__":
    asyncio.run(run_mock_analysis()) 