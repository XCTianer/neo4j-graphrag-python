#!/usr/bin/env python3
"""
Main code change analyzer script.
"""

import asyncio
import logging
import os
import sys
from pathlib import Path

# Add the parent directory to the path to import extensions
sys.path.insert(0, str(Path(__file__).parent))

from pipelines.code_change_analyzer import CodeChangeAnalyzer
from config import get_config

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('code_change_analysis.log'),
        logging.StreamHandler()
    ]
)

logger = logging.getLogger(__name__)


async def main():
    """Main function to run the code change analysis."""
    
    # Get configuration
    config = get_config()
    
    # Extract configuration values
    REPO_URL = config["repository"]["url"]
    NEO4J_URI = config["neo4j"]["uri"]
    NEO4J_USERNAME = config["neo4j"]["username"]
    NEO4J_PASSWORD = config["neo4j"]["password"]
    ANALYSIS_DAYS = config["repository"]["analysis_days"]
    OUTPUT_DIR = config["analysis"]["output_dir"]
    ONLY_LATEST_COMMIT = config["repository"].get("only_latest_commit", False)
    MAX_COMMITS = config["repository"].get("max_commits", None)
    
    # Optional LLM configuration for enhanced analysis
    USE_LLM_ANALYSIS = True  # Set to True to enable LLM-enhanced analysis
    LLM_MODEL = config["ollama"]["model"]
    LLM_BASE_URL = config["ollama"]["base_url"]
    
    try:
        logger.info("Starting code change analysis...")
        
        if ONLY_LATEST_COMMIT:
            logger.info("🔍 Analyzing only the latest commit")
        elif MAX_COMMITS:
            logger.info(f"🔍 Analyzing up to {MAX_COMMITS} recent commits")
        else:
            logger.info(f"🔍 Analyzing commits from the last {ANALYSIS_DAYS} days")
        
        if USE_LLM_ANALYSIS:
            logger.info("🤖 LLM-enhanced analysis enabled")
        else:
            logger.info("📊 Using basic query-based analysis (no LLM)")
        
        # Initialize the analyzer
        analyzer = CodeChangeAnalyzer(
            neo4j_uri=NEO4J_URI,
            neo4j_username=NEO4J_USERNAME,
            neo4j_password=NEO4J_PASSWORD,
            use_llm_analysis=USE_LLM_ANALYSIS,
            llm_model=LLM_MODEL if USE_LLM_ANALYSIS else None,
            llm_base_url=LLM_BASE_URL if USE_LLM_ANALYSIS else None
        )
        
        # Run the analysis
        results = await analyzer.analyze_repository_changes(
            repo_url=REPO_URL,
            days=ANALYSIS_DAYS,
            output_dir=OUTPUT_DIR,
            only_latest_commit=ONLY_LATEST_COMMIT,
            max_commits=MAX_COMMITS
        )
        
        # Print summary
        if 'error' in results:
            logger.error(f"Analysis failed: {results['error']}")
            return results
        
        logger.info("✅ Analysis completed successfully!")
        logger.info(f"📁 Output files generated in: {OUTPUT_DIR}")
        
        outputs = results.get('outputs', {})
        for output_type, output_path in outputs.items():
            logger.info(f"📄 {output_type}: {output_path}")
        
        # Print summary statistics
        comprehensive_analysis = results.get('comprehensive_analysis', {})
        analysis_period = comprehensive_analysis.get('analysis_period', {})
        aggregated_impact = comprehensive_analysis.get('aggregated_impact', {})
        
        logger.info("\n=== Analysis Summary ===")
        logger.info(f"📊 Total commits analyzed: {analysis_period.get('total_commits', 0)}")
        logger.info(f"📄 Total files changed: {analysis_period.get('total_files_changed', 0)}")
        logger.info(f"🔧 Affected functions: {aggregated_impact.get('total_affected_functions', 0)}")
        logger.info(f"📝 Affected variables: {aggregated_impact.get('total_affected_variables', 0)}")
        logger.info(f"📜 Affected scripts: {aggregated_impact.get('total_affected_scripts', 0)}")
        
        if USE_LLM_ANALYSIS:
            logger.info("🤖 LLM-enhanced analysis included in results")
        
        # Return results for enhanced analysis
        return results
        
    except Exception as e:
        logger.error(f"Error during analysis: {e}")
        return {"error": str(e)}


if __name__ == "__main__":
    # Check if we're in the sunny conda environment
    if not os.environ.get('CONDA_DEFAULT_ENV') == 'sunny':
        logger.warning("Warning: Not running in 'sunny' conda environment")
        logger.info("Please activate the sunny environment: conda activate sunny")
    
    # Run the analysis
    asyncio.run(main()) 