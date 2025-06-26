"""
MCP Plugin for Code Change Impact Analysis
"""

import asyncio
import json
import logging
import os
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional, Union
from datetime import datetime

# Add the parent directory to the path to import the analysis modules
sys.path.insert(0, str(Path(__file__).parent.parent))

try:
    from extensions.run_analysis import main as run_analysis
    from extensions.config import get_config, validate_config
    from extensions.pipelines.code_change_analyzer import CodeChangeAnalyzer
    from extensions.tools.report_generator import ReportGenerator
except ImportError as e:
    logging.error(f"Failed to import analysis modules: {e}")
    raise

class CodeChangeImpactPlugin:
    """MCP Plugin for Code Change Impact Analysis"""
    
    def __init__(self):
        self.config = get_config()
        self.analyzer = None
        self.report_generator = None
        self.setup_logging()
    
    def setup_logging(self):
        """Setup logging configuration"""
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
        )
        self.logger = logging.getLogger(__name__)
    
    async def analyze_code_changes(
        self,
        repo_url: Optional[str] = None,
        days: int = 7,
        output_dir: str = "analysis_output",
        detailed_chains: bool = True,
        show_chains: bool = True
    ) -> Dict[str, Any]:
        """
        Analyze code changes and their impact
        
        Args:
            repo_url: Repository URL to analyze
            days: Number of days to analyze
            output_dir: Output directory for reports
            detailed_chains: Whether to generate detailed chain analysis
            show_chains: Whether to show chains in output
            
        Returns:
            Analysis results
        """
        try:
            # Override configuration if provided
            if repo_url:
                self.config["repository"]["url"] = repo_url
            if days != 7:
                self.config["repository"]["analysis_days"] = days
            if output_dir != "analysis_output":
                self.config["analysis"]["output_dir"] = output_dir
            
            # Validate configuration
            if not validate_config():
                return {"error": "Configuration validation failed"}
            
            # Run analysis
            results = await run_analysis()
            
            if 'error' in results:
                return {"error": results['error']}
            
            comprehensive_analysis = results.get('comprehensive_analysis', {})
            
            # Generate additional reports if requested
            if detailed_chains:
                output_path = Path(output_dir)
                output_path.mkdir(parents=True, exist_ok=True)
                
                # Generate impact chain report
                chain_report_path = self._generate_impact_chain_report(
                    comprehensive_analysis, output_dir
                )
                
                # Generate Cypher queries
                queries_path = self._generate_cypher_queries(
                    comprehensive_analysis, output_dir
                )
                
                results['reports'] = {
                    'chain_report': str(chain_report_path),
                    'cypher_queries': str(queries_path)
                }
            
            return results
            
        except Exception as e:
            self.logger.error(f"Analysis failed: {e}", exc_info=True)
            return {"error": str(e)}
    
    def _generate_impact_chain_report(self, comprehensive_analysis: Dict, output_dir: str) -> str:
        """Generate detailed impact chain report"""
        from extensions.run_analysis import generate_impact_chain_report
        return generate_impact_chain_report(comprehensive_analysis, output_dir)
    
    def _generate_cypher_queries(self, comprehensive_analysis: Dict, output_dir: str) -> str:
        """Generate Cypher queries for impact chains"""
        from extensions.run_analysis import generate_cypher_queries_for_chains
        return generate_cypher_queries_for_chains(comprehensive_analysis, output_dir)
    
    async def get_impact_chains(
        self,
        repo_url: Optional[str] = None,
        days: int = 7,
        severity_filter: Optional[str] = None
    ) -> Dict[str, Any]:
        """
        Get impact chains for a repository
        
        Args:
            repo_url: Repository URL
            days: Number of days to analyze
            severity_filter: Filter by severity (HIGH, MEDIUM, LOW)
            
        Returns:
            Impact chains data
        """
        results = await self.analyze_code_changes(repo_url, days)
        
        if 'error' in results:
            return results
        
        comprehensive_analysis = results.get('comprehensive_analysis', {})
        dependency_chains = comprehensive_analysis.get('dependency_chains', [])
        
        # Filter by severity if requested
        if severity_filter:
            dependency_chains = [
                chain for chain in dependency_chains 
                if chain.get('severity') == severity_filter.upper()
            ]
        
        return {
            'total_chains': len(dependency_chains),
            'chains': dependency_chains,
            'summary': self._generate_chain_summary(dependency_chains)
        }
    
    def _generate_chain_summary(self, chains: List[Dict]) -> Dict[str, Any]:
        """Generate summary of impact chains"""
        if not chains:
            return {
                'high_risk': 0,
                'medium_risk': 0,
                'low_risk': 0,
                'total': 0
            }
        
        high_risk = len([c for c in chains if c.get('severity') == 'HIGH'])
        medium_risk = len([c for c in chains if c.get('severity') == 'MEDIUM'])
        low_risk = len([c for c in chains if c.get('severity') == 'LOW'])
        
        return {
            'high_risk': high_risk,
            'medium_risk': medium_risk,
            'low_risk': low_risk,
            'total': len(chains)
        }
    
    async def get_file_impact(
        self,
        repo_url: Optional[str] = None,
        days: int = 7,
        file_path: Optional[str] = None
    ) -> Dict[str, Any]:
        """
        Get impact analysis for specific files
        
        Args:
            repo_url: Repository URL
            days: Number of days to analyze
            file_path: Specific file path to analyze
            
        Returns:
            File impact data
        """
        results = await self.analyze_code_changes(repo_url, days)
        
        if 'error' in results:
            return results
        
        comprehensive_analysis = results.get('comprehensive_analysis', {})
        commit_details = comprehensive_analysis.get('commit_details', [])
        
        file_impacts = []
        
        for commit_analysis in commit_details:
            file_analyses = commit_analysis.get('file_analyses', [])
            
            for file_analysis in file_analyses:
                file_path_analysis = file_analysis.get('file_path', '')
                
                # Filter by file path if specified
                if file_path and file_path not in file_path_analysis:
                    continue
                
                file_impacts.append({
                    'file_path': file_path_analysis,
                    'status': file_analysis.get('status'),
                    'entities': file_analysis.get('entities', []),
                    'relationships': file_analysis.get('relationships', []),
                    'commit': commit_analysis.get('commit', {})
                })
        
        return {
            'total_files': len(file_impacts),
            'files': file_impacts
        }
    
    async def get_commit_analysis(
        self,
        repo_url: Optional[str] = None,
        days: int = 7,
        commit_hash: Optional[str] = None
    ) -> Dict[str, Any]:
        """
        Get analysis for specific commits
        
        Args:
            repo_url: Repository URL
            days: Number of days to analyze
            commit_hash: Specific commit hash to analyze
            
        Returns:
            Commit analysis data
        """
        results = await self.analyze_code_changes(repo_url, days)
        
        if 'error' in results:
            return results
        
        comprehensive_analysis = results.get('comprehensive_analysis', {})
        commit_details = comprehensive_analysis.get('commit_details', [])
        
        # Filter by commit hash if specified
        if commit_hash:
            commit_details = [
                commit for commit in commit_details
                if commit.get('commit', {}).get('hash', '').startswith(commit_hash)
            ]
        
        return {
            'total_commits': len(commit_details),
            'commits': commit_details
        }
    
    async def get_neo4j_queries(self, repo_url: Optional[str] = None, days: int = 7) -> Dict[str, Any]:
        """
        Get Neo4j Cypher queries for analysis
        
        Args:
            repo_url: Repository URL
            days: Number of days to analyze
            
        Returns:
            Cypher queries
        """
        results = await self.analyze_code_changes(repo_url, days, detailed_chains=True)
        
        if 'error' in results:
            return results
        
        # Read the generated Cypher queries file
        queries_path = results.get('reports', {}).get('cypher_queries')
        
        if not queries_path or not os.path.exists(queries_path):
            return {"error": "Cypher queries file not found"}
        
        try:
            with open(queries_path, 'r', encoding='utf-8') as f:
                queries_content = f.read()
            
            return {
                'queries_file': queries_path,
                'queries_content': queries_content
            }
        except Exception as e:
            return {"error": f"Failed to read queries file: {e}"}
    
    async def get_analysis_config(self) -> Dict[str, Any]:
        """Get current analysis configuration"""
        return {
            'config': self.config,
            'is_valid': validate_config()
        }
    
    async def update_config(self, config_updates: Dict[str, Any]) -> Dict[str, Any]:
        """
        Update analysis configuration
        
        Args:
            config_updates: Configuration updates to apply
            
        Returns:
            Updated configuration
        """
        try:
            # Apply updates to configuration
            for section, updates in config_updates.items():
                if section in self.config:
                    self.config[section].update(updates)
            
            # Validate updated configuration
            is_valid = validate_config()
            
            return {
                'config': self.config,
                'is_valid': is_valid,
                'message': 'Configuration updated successfully' if is_valid else 'Configuration validation failed'
            }
        except Exception as e:
            return {"error": f"Failed to update configuration: {e}"}

# Global plugin instance
plugin = CodeChangeImpactPlugin() 