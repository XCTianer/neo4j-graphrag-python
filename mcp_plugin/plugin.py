"""
MCP Plugin for Code Change Impact Analysis - Optimized Version
"""

import asyncio
import json
import logging
import os
import sys
import time
import hashlib
import pickle
from pathlib import Path
from typing import Any, Dict, List, Optional, Union, Set
from datetime import datetime, timedelta
from concurrent.futures import ThreadPoolExecutor, as_completed
from functools import lru_cache, wraps
import threading
from dataclasses import dataclass, asdict
from collections import defaultdict, deque

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

@dataclass
class AnalysisCache:
    """Cache entry for analysis results"""
    timestamp: datetime
    results: Dict[str, Any]
    hash: str
    config_snapshot: Dict[str, Any]

@dataclass
class PerformanceMetrics:
    """Performance metrics for monitoring"""
    operation: str
    start_time: float
    end_time: float
    duration: float
    success: bool
    error: Optional[str] = None
    cache_hit: bool = False
    parallel_workers: int = 0

class OptimizedCodeChangeImpactPlugin:
    """Optimized MCP Plugin for Code Change Impact Analysis"""
    
    def __init__(self):
        self.config = get_config()
        self.analyzer = None
        self.report_generator = None
        self.cache_dir = Path("mcp_plugin/cache")
        self.cache_dir.mkdir(parents=True, exist_ok=True)
        self.cache_ttl = timedelta(hours=1)  # Cache TTL
        self.max_workers = min(4, os.cpu_count() or 1)  # Parallel processing
        self.executor = ThreadPoolExecutor(max_workers=self.max_workers)
        self.performance_metrics = deque(maxlen=1000)  # Keep last 1000 metrics
        self.analysis_lock = threading.Lock()
        self.setup_logging()
        
        # Initialize monitoring
        self.monitoring_enabled = self.config.get('monitoring', {}).get('enabled', True)
        self.metrics_file = self.cache_dir / "performance_metrics.json"
        
    def setup_logging(self):
        """Setup logging configuration with performance tracking"""
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
            handlers=[
                logging.FileHandler('mcp_plugin/logs/plugin.log'),
                logging.StreamHandler()
            ]
        )
        self.logger = logging.getLogger(__name__)
    
    def performance_monitor(self, operation: str):
        """Decorator for performance monitoring"""
        def decorator(func):
            @wraps(func)
            async def wrapper(*args, **kwargs):
                start_time = time.time()
                success = True
                error = None
                cache_hit = False
                
                try:
                    # Check cache first for cacheable operations
                    if hasattr(self, '_get_cache_key'):
                        cache_key = self._get_cache_key(operation, args, kwargs)
                        cached_result = self._get_cached_result(cache_key)
                        if cached_result:
                            cache_hit = True
                            self._record_metric(operation, start_time, time.time(), True, cache_hit=cache_hit)
                            return cached_result
                    
                    result = await func(*args, **kwargs)
                    return result
                except Exception as e:
                    success = False
                    error = str(e)
                    self.logger.error(f"Operation {operation} failed: {e}")
                    raise
                finally:
                    end_time = time.time()
                    self._record_metric(operation, start_time, end_time, success, error, cache_hit)
            
            return wrapper
        return decorator
    
    def _record_metric(self, operation: str, start_time: float, end_time: float, 
                      success: bool, error: Optional[str] = None, cache_hit: bool = False):
        """Record performance metric"""
        if not self.monitoring_enabled:
            return
            
        metric = PerformanceMetrics(
            operation=operation,
            start_time=start_time,
            end_time=end_time,
            duration=end_time - start_time,
            success=success,
            error=error,
            cache_hit=cache_hit,
            parallel_workers=self.max_workers
        )
        
        self.performance_metrics.append(asdict(metric))
        
        # Save metrics periodically
        if len(self.performance_metrics) % 10 == 0:
            self._save_metrics()
    
    def _save_metrics(self):
        """Save performance metrics to file"""
        try:
            with open(self.metrics_file, 'w') as f:
                json.dump(list(self.performance_metrics), f, indent=2, default=str)
        except Exception as e:
            self.logger.warning(f"Failed to save metrics: {e}")
    
    def _get_cache_key(self, operation: str, args: tuple, kwargs: dict) -> str:
        """Generate cache key for operation"""
        # Create a hash of the operation and parameters
        key_data = {
            'operation': operation,
            'args': args,
            'kwargs': kwargs,
            'config_hash': hashlib.md5(json.dumps(self.config, sort_keys=True).encode()).hexdigest()
        }
        return hashlib.md5(json.dumps(key_data, sort_keys=True).encode()).hexdigest()
    
    def _get_cached_result(self, cache_key: str) -> Optional[Dict[str, Any]]:
        """Get cached result if available and valid"""
        cache_file = self.cache_dir / f"{cache_key}.pkl"
        
        if not cache_file.exists():
            return None
        
        try:
            with open(cache_file, 'rb') as f:
                cache_entry: AnalysisCache = pickle.load(f)
            
            # Check if cache is still valid
            if datetime.now() - cache_entry.timestamp < self.cache_ttl:
                self.logger.info(f"Cache hit for key: {cache_key}")
                return cache_entry.results
            else:
                # Remove expired cache
                cache_file.unlink()
                return None
        except Exception as e:
            self.logger.warning(f"Failed to read cache: {e}")
            return None
    
    def _cache_result(self, cache_key: str, results: Dict[str, Any]):
        """Cache analysis results"""
        try:
            cache_entry = AnalysisCache(
                timestamp=datetime.now(),
                results=results,
                hash=cache_key,
                config_snapshot=self.config.copy()
            )
            
            cache_file = self.cache_dir / f"{cache_key}.pkl"
            with open(cache_file, 'wb') as f:
                pickle.dump(cache_entry, f)
                
            self.logger.info(f"Cached result for key: {cache_key}")
        except Exception as e:
            self.logger.warning(f"Failed to cache result: {e}")
    
    async def analyze_code_changes(
        self,
        repo_url: Optional[str] = None,
        days: int = 7,
        output_dir: str = "analysis_output",
        detailed_chains: bool = True,
        show_chains: bool = True,
        incremental: bool = True,
        parallel: bool = True
    ) -> Dict[str, Any]:
        """
        Analyze code changes and their impact with optimizations
        
        Args:
            repo_url: Repository URL to analyze
            days: Number of days to analyze
            output_dir: Output directory for reports
            detailed_chains: Whether to generate detailed chain analysis
            show_chains: Whether to show chains in output
            incremental: Whether to use incremental analysis
            parallel: Whether to use parallel processing
            
        Returns:
            Analysis results
        """
        start_time = time.time()
        operation = "analyze_code_changes"
        
        try:
            # Check cache first
            cache_key = self._get_cache_key("analyze_code_changes", 
                                          (repo_url, days, output_dir, detailed_chains, show_chains),
                                          {"incremental": incremental, "parallel": parallel})
            cached_result = self._get_cached_result(cache_key)
            if cached_result:
                self._record_metric(operation, start_time, time.time(), True, cache_hit=True)
                return cached_result
            
            # Override configuration if provided
            if repo_url:
                self.config["repository"]["url"] = repo_url
            if days != 7:
                self.config["repository"]["analysis_days"] = days
            if output_dir != "analysis_output":
                self.config["analysis"]["output_dir"] = output_dir
            
            # Validate configuration
            if not validate_config():
                self._record_metric(operation, start_time, time.time(), False, "Configuration validation failed")
                return {"error": "Configuration validation failed"}
            
            # Run analysis with optimizations
            if parallel:
                results = await self._run_parallel_analysis()
            else:
                results = await run_analysis()
            
            # Handle None result
            if results is None:
                # Check if analysis files were actually generated
                output_path = Path(output_dir)
                if output_path.exists() and any(output_path.iterdir()):
                    # Analysis files were generated, return success with file paths
                    files = list(output_path.glob("*"))
                    return {
                        "success": True,
                        "message": "Analysis completed successfully",
                        "output_files": [str(f) for f in files],
                        "output_directory": str(output_path)
                    }
                else:
                    self._record_metric(operation, start_time, time.time(), False, "Analysis returned None")
                    return {"error": "Analysis returned None - check logs for details"}
            
            if 'error' in results:
                self._record_metric(operation, start_time, time.time(), False, results['error'])
                return {"error": results['error']}
                
            comprehensive_analysis = results.get('comprehensive_analysis', {})
            
            # Generate additional reports if requested
            if detailed_chains:
                output_path = Path(output_dir)
                output_path.mkdir(parents=True, exist_ok=True)
                
                # Generate reports in parallel if requested
                if parallel and isinstance(comprehensive_analysis, dict):
                    reports = await self._generate_reports_parallel(comprehensive_analysis, output_dir)
                elif isinstance(comprehensive_analysis, dict):
                    reports = await self._generate_reports_sequential(comprehensive_analysis, output_dir)
                else:
                    reports = {}
                
                results['reports'] = reports
            
            # Convert any PosixPath objects to strings for JSON serialization
            results = self._convert_paths(results)
            
            # Cache the result
            self._cache_result(cache_key, results)
            
            self._record_metric(operation, start_time, time.time(), True)
            return results
            
        except Exception as e:
            self.logger.error(f"Analysis failed: {e}", exc_info=True)
            self._record_metric(operation, start_time, time.time(), False, str(e))
            return {"error": str(e)}
    
    async def _run_parallel_analysis(self) -> Dict[str, Any]:
        """Run analysis with parallel processing"""
        loop = asyncio.get_event_loop()
        
        # Run analysis in thread pool to avoid blocking
        result = await loop.run_in_executor(self.executor, run_analysis)
        return result
    
    async def _generate_reports_parallel(self, comprehensive_analysis: Dict[str, Any], output_dir: str) -> Dict[str, str]:
        """Generate reports in parallel"""
        loop = asyncio.get_event_loop()
        
        # Create tasks for parallel report generation
        tasks = [
            loop.run_in_executor(self.executor, self._generate_impact_chain_report, comprehensive_analysis, output_dir),
            loop.run_in_executor(self.executor, self._generate_cypher_queries, comprehensive_analysis, output_dir)
        ]
        
        results = await asyncio.gather(*tasks, return_exceptions=True)
        
        return {
            'chain_report': str(results[0]) if not isinstance(results[0], Exception) else str(results[0]),
            'cypher_queries': str(results[1]) if not isinstance(results[1], Exception) else str(results[1])
        }
    
    async def _generate_reports_sequential(self, comprehensive_analysis: Dict[str, Any], output_dir: str) -> Dict[str, str]:
        """Generate reports sequentially"""
        chain_report_path = self._generate_impact_chain_report(comprehensive_analysis, output_dir)
        queries_path = self._generate_cypher_queries(comprehensive_analysis, output_dir)
        
        return {
            'chain_report': str(chain_report_path),
            'cypher_queries': str(queries_path)
        }
    
    def _convert_paths(self, obj: Any) -> Any:
        """Convert PosixPath objects to strings for JSON serialization"""
        if isinstance(obj, dict):
            return {k: self._convert_paths(v) for k, v in obj.items()}
        elif isinstance(obj, list):
            return [self._convert_paths(item) for item in obj]
        elif hasattr(obj, '__str__') and 'PosixPath' in str(type(obj)):
            return str(obj)
        else:
            return obj
    
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
        severity_filter: Optional[str] = None,
        limit: Optional[int] = None,
        include_metadata: bool = True
    ) -> Dict[str, Any]:
        """
        Get impact chains for a repository with optimizations
        
        Args:
            repo_url: Repository URL
            days: Number of days to analyze
            severity_filter: Filter by severity (HIGH, MEDIUM, LOW)
            limit: Limit number of chains returned
            include_metadata: Whether to include metadata
            
        Returns:
            Impact chains data
        """
        start_time = time.time()
        operation = "get_impact_chains"
        
        try:
            # Check cache first
            cache_key = self._get_cache_key("get_impact_chains", 
                                          (repo_url, days, severity_filter, limit),
                                          {"include_metadata": include_metadata})
            cached_result = self._get_cached_result(cache_key)
            if cached_result:
                self._record_metric(operation, start_time, time.time(), True, cache_hit=True)
                return cached_result
            
            results = await self.analyze_code_changes(repo_url, days)
            
            if 'error' in results:
                self._record_metric(operation, start_time, time.time(), False, results['error'])
                return results
            
            comprehensive_analysis = results.get('comprehensive_analysis', {})
            dependency_chains = comprehensive_analysis.get('dependency_chains', [])
            
            # Apply filters
            if severity_filter:
                dependency_chains = [
                    chain for chain in dependency_chains 
                    if chain.get('severity') == severity_filter.upper()
                ]
            
            # Apply limit
            if limit:
                dependency_chains = dependency_chains[:limit]
            
            # Calculate impact scores
            for chain in dependency_chains:
                chain['impact_score'] = self._calculate_impact_score(chain)
            
            # Sort by impact score
            dependency_chains.sort(key=lambda x: x.get('impact_score', 0), reverse=True)
            
            result = {
                'total_chains': len(dependency_chains),
                'chains': dependency_chains,
                'summary': self._generate_chain_summary(dependency_chains)
            }
            
            if include_metadata:
                result['metadata'] = {
                    'analysis_timestamp': datetime.now().isoformat(),
                    'filters_applied': {
                        'severity': severity_filter,
                        'limit': limit
                    },
                    'cache_info': {
                        'cached': False,
                        'cache_key': cache_key
                    }
                }
            
            # Cache the result
            self._cache_result(cache_key, result)
            
            self._record_metric(operation, start_time, time.time(), True)
            return result
            
        except Exception as e:
            self.logger.error(f"Get impact chains failed: {e}", exc_info=True)
            self._record_metric(operation, start_time, time.time(), False, str(e))
            return {"error": str(e)}
    
    def _calculate_impact_score(self, chain: Dict[str, Any]) -> float:
        """Calculate impact score for a chain"""
        base_score = {
            'HIGH': 3.0,
            'MEDIUM': 2.0,
            'LOW': 1.0
        }.get(chain.get('severity', 'LOW'), 1.0)
        
        # Factor in chain length
        chain_length = len(chain.get('chain', []))
        length_multiplier = min(chain_length / 5.0, 2.0)  # Cap at 2x
        
        # Factor in affected files
        affected_files = len(chain.get('affected_files', []))
        file_multiplier = min(affected_files / 10.0, 1.5)  # Cap at 1.5x
        
        return base_score * length_multiplier * file_multiplier
    
    def _generate_chain_summary(self, chains: List[Dict]) -> Dict[str, Any]:
        """Generate summary of impact chains with enhanced metrics"""
        if not chains:
            return {
                'high_risk': 0,
                'medium_risk': 0,
                'low_risk': 0,
                'total': 0,
                'average_impact_score': 0.0,
                'total_affected_files': 0
            }
        
        high_risk = len([c for c in chains if c.get('severity') == 'HIGH'])
        medium_risk = len([c for c in chains if c.get('severity') == 'MEDIUM'])
        low_risk = len([c for c in chains if c.get('severity') == 'LOW'])
        
        impact_scores = [c.get('impact_score', 0) for c in chains]
        average_impact_score = sum(impact_scores) / len(impact_scores) if impact_scores else 0.0
        
        total_affected_files = sum(len(c.get('affected_files', [])) for c in chains)
        
        return {
            'high_risk': high_risk,
            'medium_risk': medium_risk,
            'low_risk': low_risk,
            'total': len(chains),
            'average_impact_score': round(average_impact_score, 2),
            'total_affected_files': total_affected_files
        }
    
    async def get_file_impact(
        self,
        repo_url: Optional[str] = None,
        days: int = 7,
        file_path: Optional[str] = None,
        file_type: Optional[str] = None,
        include_dependencies: bool = True
    ) -> Dict[str, Any]:
        """
        Get impact analysis for specific files with optimizations
        
        Args:
            repo_url: Repository URL
            days: Number of days to analyze
            file_path: Specific file path to analyze
            file_type: Filter by file type (e.g., 'py', 'js', 'java')
            include_dependencies: Whether to include dependency analysis
            
        Returns:
            File impact data
        """
        start_time = time.time()
        operation = "get_file_impact"
        
        try:
            # Check cache first
            cache_key = self._get_cache_key("get_file_impact", 
                                          (repo_url, days, file_path, file_type),
                                          {"include_dependencies": include_dependencies})
            cached_result = self._get_cached_result(cache_key)
            if cached_result:
                self._record_metric(operation, start_time, time.time(), True, cache_hit=True)
                return cached_result
            
            results = await self.analyze_code_changes(repo_url, days)
            
            if 'error' in results:
                self._record_metric(operation, start_time, time.time(), False, results['error'])
                return results
            
            comprehensive_analysis = results.get('comprehensive_analysis', {})
            commit_details = comprehensive_analysis.get('commit_details', [])
            
            file_impacts = []
            file_dependencies = defaultdict(set)
            
            for commit_analysis in commit_details:
                file_analyses = commit_analysis.get('file_analyses', [])
                
                for file_analysis in file_analyses:
                    file_path_analysis = file_analysis.get('file_path', '')
                    
                    # Filter by file path if specified
                    if file_path and file_path not in file_path_analysis:
                        continue
                    
                    # Filter by file type if specified
                    if file_type and not file_path_analysis.endswith(f'.{file_type}'):
                        continue
                    
                    impact_entry = {
                        'file_path': file_path_analysis,
                        'status': file_analysis.get('status'),
                        'entities': file_analysis.get('entities', []),
                        'relationships': file_analysis.get('relationships', []),
                        'commit': commit_analysis.get('commit', {}),
                        'impact_score': self._calculate_file_impact_score(file_analysis)
                    }
                    
                    file_impacts.append(impact_entry)
                    
                    # Track dependencies if requested
                    if include_dependencies:
                        dependencies = file_analysis.get('dependencies', [])
                        file_dependencies[file_path_analysis].update(dependencies)
            
            # Sort by impact score
            file_impacts.sort(key=lambda x: x.get('impact_score', 0), reverse=True)
            
            result = {
                'total_files': len(file_impacts),
                'files': file_impacts
            }
            
            if include_dependencies:
                result['file_dependencies'] = dict(file_dependencies)
            
            # Cache the result
            self._cache_result(cache_key, result)
            
            self._record_metric(operation, start_time, time.time(), True)
            return result
            
        except Exception as e:
            self.logger.error(f"Get file impact failed: {e}", exc_info=True)
            self._record_metric(operation, start_time, time.time(), False, str(e))
            return {"error": str(e)}
    
    def _calculate_file_impact_score(self, file_analysis: Dict[str, Any]) -> float:
        """Calculate impact score for a file"""
        base_score = 1.0
        
        # Factor in number of entities
        entities_count = len(file_analysis.get('entities', []))
        entity_multiplier = min(entities_count / 10.0, 2.0)
        
        # Factor in number of relationships
        relationships_count = len(file_analysis.get('relationships', []))
        relationship_multiplier = min(relationships_count / 5.0, 1.5)
        
        # Factor in file status
        status_multiplier = {
            'modified': 1.2,
            'added': 1.0,
            'deleted': 0.8
        }.get(file_analysis.get('status', 'modified'), 1.0)
        
        return base_score * entity_multiplier * relationship_multiplier * status_multiplier
    
    async def get_commit_analysis(
        self,
        repo_url: Optional[str] = None,
        days: int = 7,
        commit_hash: Optional[str] = None,
        author: Optional[str] = None,
        include_quality_metrics: bool = True
    ) -> Dict[str, Any]:
        """
        Get analysis for specific commits with optimizations
        
        Args:
            repo_url: Repository URL
            days: Number of days to analyze
            commit_hash: Specific commit hash to analyze
            author: Filter by commit author
            include_quality_metrics: Whether to include quality metrics
            
        Returns:
            Commit analysis data
        """
        start_time = time.time()
        operation = "get_commit_analysis"
        
        try:
            # Check cache first
            cache_key = self._get_cache_key("get_commit_analysis", 
                                          (repo_url, days, commit_hash, author),
                                          {"include_quality_metrics": include_quality_metrics})
            cached_result = self._get_cached_result(cache_key)
            if cached_result:
                self._record_metric(operation, start_time, time.time(), True, cache_hit=True)
                return cached_result
            
            results = await self.analyze_code_changes(repo_url, days)
            
            if 'error' in results:
                self._record_metric(operation, start_time, time.time(), False, results['error'])
                return results
            
            comprehensive_analysis = results.get('comprehensive_analysis', {})
            commit_details = comprehensive_analysis.get('commit_details', [])
            
            # Apply filters
            if commit_hash:
                commit_details = [
                    commit for commit in commit_details
                    if commit.get('commit', {}).get('hash', '').startswith(commit_hash)
                ]
            
            if author:
                commit_details = [
                    commit for commit in commit_details
                    if author.lower() in commit.get('commit', {}).get('author', '').lower()
                ]
            
            # Add quality metrics if requested
            if include_quality_metrics:
                for commit in commit_details:
                    commit['quality_metrics'] = self._calculate_commit_quality(commit)
            
            # Sort by quality score if metrics are included
            if include_quality_metrics:
                commit_details.sort(key=lambda x: x.get('quality_metrics', {}).get('overall_score', 0), reverse=True)
            
            result = {
                'total_commits': len(commit_details),
                'commits': commit_details
            }
            
            # Cache the result
            self._cache_result(cache_key, result)
            
            self._record_metric(operation, start_time, time.time(), True)
            return result
            
        except Exception as e:
            self.logger.error(f"Get commit analysis failed: {e}", exc_info=True)
            self._record_metric(operation, start_time, time.time(), False, str(e))
            return {"error": str(e)}
    
    def _calculate_commit_quality(self, commit: Dict[str, Any]) -> Dict[str, Any]:
        """Calculate quality metrics for a commit"""
        commit_info = commit.get('commit', {})
        file_analyses = commit.get('file_analyses', [])
        
        # Calculate various quality metrics
        total_files = len(file_analyses)
        total_lines_changed = sum(
            file.get('lines_added', 0) + file.get('lines_deleted', 0)
            for file in file_analyses
        )
        
        # Message quality (simple heuristic)
        message = commit_info.get('message', '')
        message_length = len(message)
        message_quality = min(message_length / 50.0, 1.0)  # Prefer longer messages
        
        # File change distribution
        file_types = set()
        for file in file_analyses:
            file_path = file.get('file_path', '')
            if '.' in file_path:
                file_types.add(file_path.split('.')[-1])
        
        diversity_score = min(len(file_types) / 5.0, 1.0)  # Prefer diverse file types
        
        # Overall score
        overall_score = (message_quality + diversity_score) / 2.0
        
        return {
            'total_files': total_files,
            'total_lines_changed': total_lines_changed,
            'message_quality': round(message_quality, 2),
            'diversity_score': round(diversity_score, 2),
            'overall_score': round(overall_score, 2)
        }
    
    async def get_neo4j_queries(
        self, 
        repo_url: Optional[str] = None, 
        days: int = 7,
        query_type: Optional[str] = None,
        include_optimizations: bool = True
    ) -> Dict[str, Any]:
        """
        Get Neo4j Cypher queries for analysis with optimizations
        
        Args:
            repo_url: Repository URL
            days: Number of days to analyze
            query_type: Type of queries to include (impact_chains, file_analysis, etc.)
            include_optimizations: Whether to include query optimizations
            
        Returns:
            Cypher queries
        """
        start_time = time.time()
        operation = "get_neo4j_queries"
        
        try:
            # Check cache first
            cache_key = self._get_cache_key("get_neo4j_queries", 
                                          (repo_url, days, query_type),
                                          {"include_optimizations": include_optimizations})
            cached_result = self._get_cached_result(cache_key)
            if cached_result:
                self._record_metric(operation, start_time, time.time(), True, cache_hit=True)
                return cached_result
            
            results = await self.analyze_code_changes(repo_url, days, detailed_chains=True)
            
            if 'error' in results:
                self._record_metric(operation, start_time, time.time(), False, results['error'])
                return results
            
            # Read the generated Cypher queries file
            queries_path = results.get('reports', {}).get('cypher_queries')
            
            if not queries_path or not os.path.exists(queries_path):
                self._record_metric(operation, start_time, time.time(), False, "Cypher queries file not found")
                return {"error": "Cypher queries file not found"}
            
            try:
                with open(queries_path, 'r', encoding='utf-8') as f:
                    queries_content = f.read()
                
                # Parse and categorize queries
                categorized_queries = self._categorize_queries(queries_content, query_type)
                
                result = {
                    'queries_file': queries_path,
                    'queries_content': queries_content,
                    'categorized_queries': categorized_queries
                }
                
                if include_optimizations:
                    result['optimization_tips'] = self._generate_query_optimization_tips(categorized_queries)
                
                # Cache the result
                self._cache_result(cache_key, result)
                
                self._record_metric(operation, start_time, time.time(), True)
                return result
            except Exception as e:
                self._record_metric(operation, start_time, time.time(), False, f"Failed to read queries file: {e}")
                return {"error": f"Failed to read queries file: {e}"}
                
        except Exception as e:
            self.logger.error(f"Get Neo4j queries failed: {e}", exc_info=True)
            self._record_metric(operation, start_time, time.time(), False, str(e))
            return {"error": str(e)}
    
    def _categorize_queries(self, queries_content: str, query_type: Optional[str] = None) -> Dict[str, List[str]]:
        """Categorize Cypher queries by type"""
        queries = queries_content.split(';')
        categorized = {
            'impact_chains': [],
            'file_analysis': [],
            'commit_analysis': [],
            'dependency_analysis': [],
            'visualization': []
        }
        
        for query in queries:
            query = query.strip()
            if not query:
                continue
            
            query_lower = query.lower()
            
            if 'impact' in query_lower and 'chain' in query_lower:
                categorized['impact_chains'].append(query)
            elif 'file' in query_lower:
                categorized['file_analysis'].append(query)
            elif 'commit' in query_lower:
                categorized['commit_analysis'].append(query)
            elif 'dependency' in query_lower or 'depends' in query_lower:
                categorized['dependency_analysis'].append(query)
            elif 'visual' in query_lower or 'graph' in query_lower:
                categorized['visualization'].append(query)
        
        # Filter by type if specified
        if query_type and query_type in categorized:
            return {query_type: categorized[query_type]}
        
        return categorized
    
    def _generate_query_optimization_tips(self, categorized_queries: Dict[str, List[str]]) -> List[str]:
        """Generate optimization tips for queries"""
        tips = []
        
        for category, queries in categorized_queries.items():
            if not queries:
                continue
                
            if category == 'impact_chains':
                tips.append("Consider adding LIMIT clauses to impact chain queries for better performance")
                tips.append("Use INDEX hints for frequently queried properties")
            
            elif category == 'file_analysis':
                tips.append("Add file path filters to reduce result set size")
                tips.append("Consider using APOC procedures for file path operations")
            
            elif category == 'dependency_analysis':
                tips.append("Use depth-limited traversals to avoid infinite loops")
                tips.append("Consider caching dependency graphs for large repositories")
        
        return tips
    
    async def get_analysis_config(self) -> Dict[str, Any]:
        """Get current analysis configuration with validation details"""
        start_time = time.time()
        operation = "get_analysis_config"
        
        try:
            result = {
                'config': self.config,
                'is_valid': validate_config(),
                'cache_info': {
                    'cache_dir': str(self.cache_dir),
                    'cache_ttl': str(self.cache_ttl),
                    'cache_size': len(list(self.cache_dir.glob('*.pkl')))
                },
                'performance_info': {
                    'max_workers': self.max_workers,
                    'monitoring_enabled': self.monitoring_enabled,
                    'metrics_count': len(self.performance_metrics)
                }
            }
            
            self._record_metric(operation, start_time, time.time(), True)
            return result
            
        except Exception as e:
            self.logger.error(f"Get analysis config failed: {e}", exc_info=True)
            self._record_metric(operation, start_time, time.time(), False, str(e))
            return {"error": str(e)}
    
    async def update_config(self, config_updates: Dict[str, Any]) -> Dict[str, Any]:
        """
        Update analysis configuration with validation
        
        Args:
            config_updates: Configuration updates to apply
            
        Returns:
            Updated configuration
        """
        start_time = time.time()
        operation = "update_config"
        
        try:
            # Apply updates to configuration
            for section, updates in config_updates.items():
                if section in self.config:
                    self.config[section].update(updates)
            
            # Validate updated configuration
            is_valid = validate_config()
            
            # Clear cache if configuration changed significantly
            if self._should_clear_cache(config_updates):
                self._clear_cache()
            
            result = {
                'config': self.config,
                'is_valid': is_valid,
                'message': 'Configuration updated successfully' if is_valid else 'Configuration validation failed',
                'cache_cleared': self._should_clear_cache(config_updates)
            }
            
            self._record_metric(operation, start_time, time.time(), True)
            return result
            
        except Exception as e:
            self.logger.error(f"Update config failed: {e}", exc_info=True)
            self._record_metric(operation, start_time, time.time(), False, str(e))
            return {"error": f"Failed to update configuration: {e}"}
    
    def _should_clear_cache(self, config_updates: Dict[str, Any]) -> bool:
        """Determine if cache should be cleared based on config updates"""
        critical_sections = ['repository', 'analysis', 'neo4j']
        return any(section in config_updates for section in critical_sections)
    
    def _clear_cache(self):
        """Clear all cached results"""
        try:
            for cache_file in self.cache_dir.glob('*.pkl'):
                cache_file.unlink()
            self.logger.info("Cache cleared")
        except Exception as e:
            self.logger.warning(f"Failed to clear cache: {e}")
    
    async def get_performance_metrics(self, limit: int = 100) -> Dict[str, Any]:
        """Get performance metrics for monitoring"""
        if not self.monitoring_enabled:
            return {"error": "Performance monitoring is disabled"}
        
        metrics = list(self.performance_metrics)[-limit:] if limit else list(self.performance_metrics)
        
        # Calculate summary statistics
        if metrics:
            durations = [m['duration'] for m in metrics if m['success']]
            success_rate = len([m for m in metrics if m['success']]) / len(metrics)
            
            summary = {
                'total_operations': len(metrics),
                'success_rate': round(success_rate, 2),
                'average_duration': round(sum(durations) / len(durations), 3) if durations else 0,
                'max_duration': round(max(durations), 3) if durations else 0,
                'min_duration': round(min(durations), 3) if durations else 0
            }
        else:
            summary = {
                'total_operations': 0,
                'success_rate': 0,
                'average_duration': 0,
                'max_duration': 0,
                'min_duration': 0
            }
        
        return {
            'metrics': metrics,
            'summary': summary,
            'cache_info': {
                'cache_size': len(list(self.cache_dir.glob('*.pkl'))),
                'cache_ttl': str(self.cache_ttl)
            }
        }
    
    async def cleanup_cache(self, older_than_hours: int = 24) -> Dict[str, Any]:
        """Clean up old cache entries"""
        try:
            cutoff_time = datetime.now() - timedelta(hours=older_than_hours)
            removed_count = 0
            
            for cache_file in self.cache_dir.glob('*.pkl'):
                try:
                    with open(cache_file, 'rb') as f:
                        cache_entry: AnalysisCache = pickle.load(f)
                    
                    if cache_entry.timestamp < cutoff_time:
                        cache_file.unlink()
                        removed_count += 1
                except Exception:
                    # Remove corrupted cache files
                    cache_file.unlink()
                    removed_count += 1
            
            return {
                'removed_entries': removed_count,
                'message': f'Cleaned up {removed_count} cache entries older than {older_than_hours} hours'
            }
        except Exception as e:
            return {"error": f"Failed to cleanup cache: {e}"}

# Global plugin instance
plugin = OptimizedCodeChangeImpactPlugin() 