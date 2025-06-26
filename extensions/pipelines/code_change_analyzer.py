"""
Code change analyzer pipeline for Neo4j GraphRAG.
"""

import asyncio
import json
import logging
import os
import sys
from datetime import datetime, timedelta
from typing import List, Dict, Optional, Tuple, Any
from pathlib import Path

from neo4j import GraphDatabase
from neo4j_graphrag.embeddings import OllamaEmbeddings
from neo4j_graphrag.llm import OllamaLLM
from neo4j_graphrag.experimental.pipeline.kg_builder import SimpleKGPipeline

from integrations.github_integration import GitHubIntegration
from tools.neo4j_query_generator import Neo4jQueryGenerator
from tools.report_generator import ReportGenerator

from requirements import SCHEMA

logger = logging.getLogger(__name__)

# Add the parent directory to the path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

class CodeChangeAnalyzer:
    """Analyze code changes and their impact using existing Neo4j data with optional LLM enhancement."""
    
    def __init__(
        self,
        neo4j_uri: str = "neo4j://localhost:7687",
        neo4j_username: str = "neo4j",
        neo4j_password: str = "password",
        use_llm_analysis: bool = False,
        llm_model: Optional[str] = None,
        llm_base_url: Optional[str] = None
    ):
        """Initialize the analyzer with Neo4j configuration and optional LLM."""
        # Initialize Neo4j driver
        self.driver = GraphDatabase.driver(
            neo4j_uri, 
            auth=(neo4j_username, neo4j_password)
        )
        
        # Optional LLM for enhanced analysis
        self.use_llm_analysis = use_llm_analysis
        self.llm = None
        if use_llm_analysis and llm_model and llm_base_url:
            try:
                from neo4j_graphrag.llm import OllamaLLM
                self.llm = OllamaLLM(
                    model_name=llm_model,
                    model_params={
                        "max_tokens": 2000,
                        "temperature": 0.1,
                    },
                    host=llm_base_url,
                )
                logger.info(f"LLM initialized: {llm_model}")
            except Exception as e:
                logger.warning(f"Failed to initialize LLM: {e}")
                self.use_llm_analysis = False
        
        # Initialize components
        self.query_generator = Neo4jQueryGenerator(self.driver)
        self.report_generator = ReportGenerator()
        
    def __del__(self):
        """Cleanup Neo4j driver."""
        if hasattr(self, 'driver'):
            self.driver.close()
    
    async def analyze_repository_changes(
        self,
        repo_url: str,
        days: int = 7,
        output_dir: str = "analysis_output",
        only_latest_commit: bool = False,
        max_commits: Optional[int] = None
    ) -> Dict[str, Any]:
        """
        Analyze code changes in a repository.
        
        Args:
            repo_url: GitHub repository URL
            days: Number of days to analyze
            output_dir: Output directory for results
            only_latest_commit: If True, only analyze the latest commit
            max_commits: Maximum number of commits to analyze
            
        Returns:
            Analysis results
        """
        logger.info(f"Starting analysis of repository: {repo_url}")
        
        # Create output directory
        Path(output_dir).mkdir(parents=True, exist_ok=True)
        
        # Initialize GitHub integration
        github_integration = GitHubIntegration(repo_url)
        
        # Clone or update repository
        if not github_integration.clone_or_update_repository():
            raise Exception("Failed to clone or update repository")
        
        # Get commits based on configuration
        if only_latest_commit:
            latest_commit = github_integration.get_latest_commit()
            if not latest_commit:
                logger.warning("No latest commit found")
                return {"error": "No latest commit found"}
            commits = [latest_commit]
            logger.info(f"Analyzing only the latest commit: {latest_commit['hash'][:8]}")
        else:
            commits = github_integration.get_recent_commits(days, max_commits=max_commits)
            if not commits:
                logger.warning(f"No commits found in the last {days} days")
                return {"error": "No commits found"}
        
        # Analyze each commit
        analysis_results = []
        for commit in commits:
            logger.info(f"Analyzing commit: {commit['hash'][:8]} - {commit['message']}")
            
            commit_analysis = await self._analyze_commit(
                github_integration, 
                commit
            )
            analysis_results.append(commit_analysis)
        
        # Generate comprehensive analysis
        comprehensive_analysis = await self._generate_comprehensive_analysis(
            analysis_results, 
            github_integration.get_repository_info()
        )
        
        # Generate outputs
        outputs = await self._generate_outputs(
            comprehensive_analysis, 
            output_dir
        )
        
        logger.info("Analysis completed successfully")
        return {
            "analysis_results": analysis_results,
            "comprehensive_analysis": comprehensive_analysis,
            "outputs": outputs
        }
    
    async def _analyze_commit(
        self, 
        github_integration: GitHubIntegration, 
        commit: Dict
    ) -> Dict[str, Any]:
        """
        Analyze a single commit.
        
        Args:
            github_integration: GitHub integration instance
            commit: Commit information
            
        Returns:
            Commit analysis results
        """
        logger.info(f"Analyzing commit: {commit['hash'][:8]} - {commit['message']}")
        
        # Get commit changes
        changes = github_integration.get_commit_changes(commit['hash'])
        
        # Filter out configuration files that should be ignored
        filtered_changes = self._filter_config_files(changes)
        
        if not filtered_changes:
            logger.info(f"No relevant file changes found in commit {commit['hash'][:8]}")
            return {
                "commit": commit,
                "changes": changes,
                "file_analyses": [],
                "impact_analysis": {
                    "summary": {
                        "risk_level": "LOW",
                        "impact_scope": "CONFIG_ONLY",
                        "total_files_changed": len(changes),
                        "affected_functions": 0,
                        "affected_variables": 0,
                        "affected_scripts": 0
                    },
                    "affected_functions": [],
                    "affected_variables": [],
                    "affected_scripts": []
                },
                "queries": []
            }
        
        # Analyze each file change
        file_analyses = []
        for change in filtered_changes:
            file_analysis = await self._analyze_file_change(github_integration, commit, change)
            file_analyses.append(file_analysis)
        
        # Generate impact analysis
        impact_analysis = await self._generate_impact_analysis(file_analyses, commit)
        
        # Generate queries for this commit
        queries = await self._generate_queries_for_commit(file_analyses, commit)
        
        return {
            "commit": commit,
            "changes": changes,
            "file_analyses": file_analyses,
            "impact_analysis": impact_analysis,
            "queries": queries
        }
    
    def _filter_config_files(self, changes: List[Dict]) -> List[Dict]:
        """
        Filter out configuration files that should be ignored in code analysis.
        
        Args:
            changes: List of file changes
            
        Returns:
            Filtered list of changes excluding config files
        """
        # Files to ignore in code analysis
        ignored_files = {
            '.gitignore',
            '.gitattributes',
            '.gitmodules',
            '.editorconfig',
            '.eslintrc',
            '.prettierrc',
            '.babelrc',
            'tsconfig.json',
            'package.json',
            'package-lock.json',
            'yarn.lock',
            'requirements.txt',
            'setup.py',
            'pyproject.toml',
            'Cargo.toml',
            'go.mod',
            'go.sum',
            'Gemfile',
            'Gemfile.lock',
            'composer.json',
            'composer.lock',
            'Dockerfile',
            'docker-compose.yml',
            '.dockerignore',
            'Makefile',
            'CMakeLists.txt',
            'README.md',
            'README.txt',
            'LICENSE',
            'LICENSE.txt',
            'CHANGELOG.md',
            'SECURITY.md',
            'CONTRIBUTING.md',
            '.github/workflows/',
            '.github/ISSUE_TEMPLATE/',
            '.github/PULL_REQUEST_TEMPLATE.md',
            'docs/',
            'documentation/',
            '*.md',
            '*.txt',
            '*.yml',
            '*.yaml',
            '*.json',
            '*.toml',
            '*.lock',
            '*.log',
            '*.tmp',
            '*.temp'
        }
        
        filtered_changes = []
        ignored_count = 0
        
        for change in changes:
            file_path = change.get('file_path', '')
            filename = file_path.split('/')[-1] if '/' in file_path else file_path
            
            # Check if file should be ignored
            should_ignore = False
            
            # Check exact filename match
            if filename in ignored_files:
                should_ignore = True
            
            # Check file extensions
            for pattern in ignored_files:
                if pattern.startswith('*.') and filename.endswith(pattern[1:]):
                    should_ignore = True
                    break
            
            # Check directory patterns
            for pattern in ignored_files:
                if pattern.endswith('/') and file_path.startswith(pattern):
                    should_ignore = True
                    break
            
            if should_ignore:
                ignored_count += 1
                logger.info(f"Ignoring config file: {file_path}")
            else:
                filtered_changes.append(change)
        
        if ignored_count > 0:
            logger.info(f"Filtered out {ignored_count} configuration files from analysis")
        
        return filtered_changes
    
    async def _analyze_file_change(
        self, 
        github_integration: GitHubIntegration, 
        commit: Dict, 
        change: Dict
    ) -> Dict[str, Any]:
        """
        Analyze a single file change.
        
        Args:
            github_integration: GitHub integration instance
            commit: Commit information
            change: File change information
            
        Returns:
            File analysis results
        """
        file_path = change['file_path']
        status = change['status']
        
        # Get file content
        content = github_integration.get_file_content(file_path, commit['hash'])
        
        if not content:
            return {
                "file_path": file_path,
                "status": status,
                "content": None,
                "entities": [],
                "relationships": []
            }
        
        # Extract entities and relationships using GraphRAG
        entities, relationships = await self._extract_code_entities(content, file_path)
        
        return {
            "file_path": file_path,
            "status": status,
            "content": content,
            "entities": entities,
            "relationships": relationships
        }
    
    async def _extract_code_entities(
        self, 
        content: str, 
        file_path: str
    ) -> Tuple[List[Dict], List[Dict]]:
        """
        Extract code entities and relationships from existing Neo4j data.
        
        Args:
            content: File content (for reference, not used for extraction)
            file_path: File path to find related entities
            
        Returns:
            Tuple of (entities, relationships) from existing data
        """
        try:
            # Query existing entities related to this file
            entities = await self._find_entities_by_file_path(file_path)
            
            # Query existing relationships for these entities
            relationships = await self._find_relationships_for_entities(entities)
            
            logger.info(f"Found {len(entities)} entities and {len(relationships)} relationships for {file_path}")
            
            return entities, relationships
            
        except Exception as e:
            logger.error(f"Error extracting entities from {file_path}: {e}")
            return [], []
    
    async def _find_entities_by_file_path(self, file_path: str) -> List[Dict]:
        """
        Find all entities (functions, variables, scripts) related to a file path.
        
        Args:
            file_path: Path to the file
            
        Returns:
            List of entities found in the file
        """
        # Extract filename from full path (e.g., "nj/transformer-models/file.m" -> "file.m")
        filename = file_path.split('/')[-1]
        
        # Try multiple path matching strategies with priority
        entities = []
        
        # Strategy 1: Exact path match (highest priority)
        entities = await self._query_entities_by_exact_path(file_path)
        if entities:
            logger.info(f"Found {len(entities)} entities using exact path match for {file_path}")
            return entities
        
        # Strategy 2: Normalized path match (remove common prefixes)
        normalized_path = self._normalize_file_path(file_path)
        entities = await self._query_entities_by_exact_path(normalized_path)
        if entities:
            logger.info(f"Found {len(entities)} entities using normalized path match for {normalized_path}")
            return entities
        
        # Strategy 3: Enhanced path variations with better matching
        path_variations = self._generate_enhanced_path_variations(file_path)
        for variation in path_variations:
            entities = await self._query_entities_by_exact_path(variation)
            if entities:
                logger.info(f"Found {len(entities)} entities using enhanced path variation: {variation}")
                return entities
        
        # Strategy 4: Smart filename matching with context awareness
        entities = await self._query_entities_by_smart_filename(filename, file_path)
        if entities:
            logger.info(f"Found {len(entities)} entities using smart filename match for {filename}")
            # Apply enhanced filtering
            filtered_entities = self._filter_entities_by_enhanced_relevance(entities, file_path)
            if filtered_entities:
                logger.info(f"Filtered to {len(filtered_entities)} most relevant entities")
                return filtered_entities
            return entities
        
        # Strategy 5: Try without extension
        if '.' in filename:
            base_name = filename.split('.')[0]
            entities = await self._query_entities_by_filename(base_name)
            if entities:
                logger.info(f"Found {len(entities)} entities using base name match for {base_name}")
                filtered_entities = self._filter_entities_by_enhanced_relevance(entities, file_path)
                if filtered_entities:
                    logger.info(f"Filtered to {len(filtered_entities)} most relevant entities")
                    return filtered_entities
                return entities
        
        # Strategy 6: Context-aware keyword search
        if self._should_use_keyword_search(file_path):
            entities = await self._query_entities_by_context_aware_keyword(file_path)
            if entities:
                logger.info(f"Found {len(entities)} entities using context-aware keyword search")
                filtered_entities = self._filter_entities_by_enhanced_relevance(entities, file_path)
                if filtered_entities:
                    logger.info(f"Filtered to {len(filtered_entities)} most relevant entities")
                    return filtered_entities
                return entities
        
        # Strategy 7: Find related files based on path components
        related_entities = await self._find_related_entities_by_path(file_path)
        if related_entities:
            logger.info(f"Found {len(related_entities)} related entities for {file_path}")
            return related_entities
        
        logger.info(f"No entities found for file {file_path} (tried filename: {filename})")
        return []
    
    def _normalize_file_path(self, file_path: str) -> str:
        """
        Normalize file path by removing common prefixes.
        
        Args:
            file_path: Original file path
            
        Returns:
            Normalized file path
        """
        path_parts = file_path.split('/')
        
        # Remove common prefixes
        prefixes_to_remove = ['nj', 'transformer-models', 'matlab']
        
        # Find the first non-prefix part
        start_index = 0
        for i, part in enumerate(path_parts):
            if part not in prefixes_to_remove:
                start_index = i
                break
        
        return '/'.join(path_parts[start_index:])
    
    def _generate_enhanced_path_variations(self, file_path: str) -> List[str]:
        """
        Generate enhanced path variations with better matching logic.
        
        Args:
            file_path: Original file path
            
        Returns:
            List of path variations to try
        """
        variations = []
        path_parts = file_path.split('/')
        
        # Remove common prefixes with more comprehensive list
        prefixes_to_remove = ['nj', 'transformer-models', 'matlab', 'tests', 'matlab_test', 'test_data']
        
        # Strategy 1: Remove prefixes one by one
        for i, part in enumerate(path_parts):
            if part in prefixes_to_remove:
                # Create variation without this prefix
                variation = '/'.join(path_parts[i+1:])
                if variation:
                    variations.append(variation)
        
        # Strategy 2: Remove multiple prefixes at once
        start_index = 0
        for i, part in enumerate(path_parts):
            if part not in prefixes_to_remove:
                start_index = i
                break
        if start_index > 0:
            variations.append('/'.join(path_parts[start_index:]))
        
        # Strategy 3: Keep only the most specific parts (last 3-4 parts)
        if len(path_parts) >= 4:
            variations.append('/'.join(path_parts[-4:]))  # Last 4 parts
        if len(path_parts) >= 3:
            variations.append('/'.join(path_parts[-3:]))  # Last 3 parts
        if len(path_parts) >= 2:
            variations.append('/'.join(path_parts[-2:]))  # Last 2 parts
        
        # Strategy 4: Special handling for model files
        if 'model.m' in file_path:
            # For model files, try to match the specific model type
            for part in path_parts:
                if part in ['gpt2', 'bert', 'finbert', 'transformer']:
                    variations.append(f"+{part}/model.m")
                    variations.append(f"{part}/model.m")
                    variations.append(f"model.m")
        
        # Strategy 5: Handle internal directories
        if 'internal' in path_parts:
            internal_index = path_parts.index('internal')
            if internal_index + 1 < len(path_parts):
                # Include the file after internal
                variations.append('/'.join(path_parts[internal_index:]))
        
        # Remove duplicates while preserving order
        seen = set()
        unique_variations = []
        for variation in variations:
            if variation not in seen:
                seen.add(variation)
                unique_variations.append(variation)
        
        return unique_variations
    
    async def _query_entities_by_exact_path(self, file_path: str) -> List[Dict]:
        """Query entities by exact file path."""
        # Query for functions in the file
        functions_query = """
        MATCH (f:Function)
        WHERE f.file_path = $file_path
        RETURN f.name as name, f.file_path as file_path, 'Function' as type,
               f.line_range as line_range, f.id as id
        """
        
        # Query for variables in the file
        variables_query = """
        MATCH (v:Variable)
        WHERE v.file_path = $file_path
        RETURN v.name as name, v.file_path as file_path, 'Variable' as type,
               v.line_range as line_range, v.id as id
        """
        
        # Query for scripts in the file
        scripts_query = """
        MATCH (s:Script)
        WHERE s.file_path = $file_path
        RETURN s.name as name, s.file_path as file_path, 'Script' as type,
               s.line_range as line_range, s.id as id
        """
        
        entities = []
        
        try:
            # Execute queries using the correct async syntax
            functions_result = self.driver.execute_query(functions_query, file_path=file_path)
            variables_result = self.driver.execute_query(variables_query, file_path=file_path)
            scripts_result = self.driver.execute_query(scripts_query, file_path=file_path)
            
            # Convert results to dictionaries
            for record in functions_result.records:
                entities.append(dict(record))
            
            for record in variables_result.records:
                entities.append(dict(record))
                
            for record in scripts_result.records:
                entities.append(dict(record))
                
        except Exception as e:
            logger.error(f"Error querying entities for exact path {file_path}: {e}")
        
        return entities
    
    async def _query_entities_by_filename(self, filename: str) -> List[Dict]:
        """Query entities by exact filename."""
        # Query for functions in the file - try multiple matching strategies
        functions_query = """
        MATCH (f:Function)
        WHERE f.file_path = $filename 
           OR f.file_path ENDS WITH $filename
           OR f.file_path CONTAINS $filename
           OR f.file_path ENDS WITH '/' + $filename
        RETURN f.name as name, f.file_path as file_path, 'Function' as type,
               f.line_range as line_range, f.id as id
        """
        
        # Query for variables in the file
        variables_query = """
        MATCH (v:Variable)
        WHERE v.file_path = $filename 
           OR v.file_path ENDS WITH $filename
           OR v.file_path CONTAINS $filename
           OR v.file_path ENDS WITH '/' + $filename
        RETURN v.name as name, v.file_path as file_path, 'Variable' as type,
               v.line_range as line_range, v.id as id
        """
        
        # Query for scripts in the file
        scripts_query = """
        MATCH (s:Script)
        WHERE s.file_path = $filename 
           OR s.file_path ENDS WITH $filename
           OR s.file_path CONTAINS $filename
           OR s.file_path ENDS WITH '/' + $filename
        RETURN s.name as name, s.file_path as file_path, 'Script' as type,
               s.line_range as line_range, s.id as id
        """
        
        entities = []
        
        try:
            # Execute queries using the correct async syntax
            functions_result = self.driver.execute_query(functions_query, filename=filename)
            variables_result = self.driver.execute_query(variables_query, filename=filename)
            scripts_result = self.driver.execute_query(scripts_query, filename=filename)
            
            # Convert results to dictionaries
            for record in functions_result.records:
                entities.append(dict(record))
            
            for record in variables_result.records:
                entities.append(dict(record))
                
            for record in scripts_result.records:
                entities.append(dict(record))
                
        except Exception as e:
            logger.error(f"Error querying entities for filename {filename}: {e}")
        
        return entities
    
    async def _query_entities_by_keyword(self, keyword: str) -> List[Dict]:
        """Query entities by keyword search."""
        query = """
        MATCH (n)
        WHERE n.file_path CONTAINS $keyword
        RETURN n.name as name, n.file_path as file_path, labels(n)[0] as type,
               n.line_range as line_range, n.id as id
        ORDER BY n.file_path
        LIMIT 20
        """
        
        entities = []
        
        try:
            result = self.driver.execute_query(query, keyword=keyword)
            for record in result.records:
                entities.append(dict(record))
        except Exception as e:
            logger.error(f"Error querying entities by keyword {keyword}: {e}")
        
        return entities
    
    async def _query_entities_by_smart_filename(self, filename: str, original_file_path: str) -> List[Dict]:
        """Query entities by filename with smart context awareness."""
        # Extract context from original file path
        path_parts = original_file_path.lower().split('/')
        context_keywords = []
        
        # Extract meaningful context keywords
        for part in path_parts:
            if part not in ['', 'nj', 'transformer-models', 'matlab', 'tests', 'matlab_test', 'test_data']:
                context_keywords.append(part)
        
        # Build a more specific query based on context
        if context_keywords:
            # Try to match files that contain both the filename and context keywords
            context_conditions = []
            for keyword in context_keywords:
                context_conditions.append(f"n.file_path CONTAINS '{keyword}'")
            
            context_condition = " OR ".join(context_conditions)
            
            query = f"""
            MATCH (n)
            WHERE (n.file_path = $filename 
               OR n.file_path ENDS WITH $filename
               OR n.file_path ENDS WITH '/' + $filename)
            AND ({context_condition})
            RETURN n.name as name, n.file_path as file_path, labels(n)[0] as type,
                   n.line_range as line_range, n.id as id
            ORDER BY n.file_path
            """
        else:
            # Fallback to basic filename matching
            query = """
            MATCH (n)
            WHERE n.file_path = $filename 
               OR n.file_path ENDS WITH $filename
               OR n.file_path ENDS WITH '/' + $filename
            RETURN n.name as name, n.file_path as file_path, labels(n)[0] as type,
                   n.line_range as line_range, n.id as id
            ORDER BY n.file_path
            """
        
        entities = []
        
        try:
            result = self.driver.execute_query(query, filename=filename)
            for record in result.records:
                entities.append(dict(record))
        except Exception as e:
            logger.error(f"Error querying entities by smart filename {filename}: {e}")
        
        return entities
    
    def _filter_entities_by_enhanced_relevance(self, entities: List[Dict], target_file_path: str) -> List[Dict]:
        """
        Enhanced filtering of entities by relevance to the target file path.
        
        Args:
            entities: List of entities to filter
            target_file_path: Target file path
            
        Returns:
            Filtered list of entities
        """
        if not entities:
            return []
        
        # Extract key components from target path
        target_parts = target_file_path.lower().split('/')
        target_keywords = set()
        
        # Extract meaningful keywords with better filtering
        for part in target_parts:
            if part not in ['', 'nj', 'transformer-models', 'matlab', 'tests', 'matlab_test', 'test_data', 'internal']:
                target_keywords.add(part)
        
        # Score entities by enhanced relevance
        scored_entities = []
        for entity in entities:
            entity_path = entity.get('file_path', '').lower()
            entity_parts = entity_path.split('/')
            
            # Calculate enhanced relevance score
            score = 0
            
            # Exact path match gets highest score
            if entity_path in target_file_path.lower() or target_file_path.lower() in entity_path:
                score += 200
            
            # Path component matching with higher weight
            common_parts = set(target_parts) & set(entity_parts)
            score += len(common_parts) * 15
            
            # Keyword matching with context awareness
            for keyword in target_keywords:
                if keyword in entity_path:
                    score += 20
                    # Bonus for exact keyword match
                    if f"/{keyword}/" in entity_path or entity_path.endswith(f"/{keyword}"):
                        score += 10
            
            # Prefer files that are more likely to be the actual source
            # Penalize test files if we're looking for source files
            if 'test' in entity_path and 'test' not in target_file_path.lower():
                score -= 50
            
            # Bonus for files that match the expected structure
            if 'gpt2' in target_file_path.lower() and 'gpt2' in entity_path:
                score += 30
            if 'bert' in target_file_path.lower() and 'bert' in entity_path:
                score += 30
            if 'finbert' in target_file_path.lower() and 'finbert' in entity_path:
                score += 30
            
            # Prefer shorter paths (more specific)
            score -= len(entity_parts) * 3
            
            scored_entities.append((entity, score))
        
        # Sort by score and return top matches
        scored_entities.sort(key=lambda x: x[1], reverse=True)
        
        # Return entities with score > 10, or top 3 if all scores are low
        relevant_entities = [entity for entity, score in scored_entities if score > 10]
        
        if not relevant_entities and scored_entities:
            # If no relevant matches, return top 3
            relevant_entities = [entity for entity, score in scored_entities[:3]]
        
        return relevant_entities
    
    def _should_use_keyword_search(self, file_path: str) -> bool:
        """Determine if keyword search should be used based on file path."""
        path_lower = file_path.lower()
        keywords = ['gpt2', 'bert', 'transformer', 'model', 'layer', 'attention']
        return any(keyword in path_lower for keyword in keywords)
    
    async def _query_entities_by_context_aware_keyword(self, file_path: str) -> List[Dict]:
        """Query entities using context-aware keyword search."""
        path_parts = file_path.lower().split('/')
        keywords = []
        
        # Extract relevant keywords
        for part in path_parts:
            if part in ['gpt2', 'bert', 'finbert', 'transformer', 'model', 'layer', 'attention']:
                keywords.append(part)
        
        if not keywords:
            return []
        
        # Build query with multiple keywords
        keyword_conditions = []
        for keyword in keywords:
            keyword_conditions.append(f"n.file_path CONTAINS '{keyword}'")
        
        keyword_condition = " OR ".join(keyword_conditions)
        
        query = f"""
        MATCH (n)
        WHERE ({keyword_condition})
        AND n.file_path IS NOT NULL
        RETURN n.name as name, n.file_path as file_path, labels(n)[0] as type,
               n.line_range as line_range, n.id as id
        ORDER BY n.file_path
        LIMIT 20
        """
        
        entities = []
        
        try:
            result = self.driver.execute_query(query)
            for record in result.records:
                entities.append(dict(record))
        except Exception as e:
            logger.error(f"Error querying entities by context-aware keyword: {e}")
        
        return entities
    
    async def _find_related_entities_by_path(self, file_path: str) -> List[Dict]:
        """Find related entities based on path components."""
        path_parts = file_path.lower().split('/')
        related_entities = []
        
        # Look for key terms in the path
        key_terms = []
        for part in path_parts:
            if part in ['gpt2', 'bert', 'transformer', 'models', 'support', 'internal']:
                key_terms.append(part)
        
        if not key_terms:
            return []
        
        # Query for files containing these terms
        query = """
        MATCH (n)
        WHERE n.file_path IS NOT NULL
        AND any(term IN $key_terms WHERE toLower(n.file_path) CONTAINS toLower(term))
        RETURN n.name as name, n.file_path as file_path, labels(n)[0] as type,
               n.line_range as line_range, n.id as id
        ORDER BY n.file_path
        LIMIT 20
        """
        
        try:
            result = self.driver.execute_query(query, key_terms=key_terms)
            for record in result.records:
                entity = dict(record)
                # Add a note that this is a related entity
                entity['related_file'] = True
                entity['original_file'] = file_path
                related_entities.append(entity)
        except Exception as e:
            logger.error(f"Error finding related entities for {file_path}: {e}")
        
        return related_entities
    
    async def _find_relationships_for_entities(self, entities: List[Dict]) -> List[Dict]:
        """
        Find relationships for the given entities.
        
        Args:
            entities: List of entities to find relationships for
            
        Returns:
            List of relationships
        """
        if not entities:
            return []
        
        relationships = []
        
        for entity in entities:
            entity_name = entity.get('name', '')
            entity_type = entity.get('type', '')
            
            if not entity_name:
                continue
            
            # Query relationships based on entity type
            if entity_type == 'Function':
                rels = await self._find_function_relationships(entity_name)
            elif entity_type == 'Variable':
                rels = await self._find_variable_relationships(entity_name)
            elif entity_type == 'Script':
                rels = await self._find_script_relationships(entity_name)
            else:
                rels = []
            
            relationships.extend(rels)
        
        return relationships
    
    async def _find_function_relationships(self, function_name: str) -> List[Dict]:
        """Find relationships for a function."""
        # Query for CALLS relationships
        calls_query = """
        MATCH (caller:Function)-[:CALLS]->(target:Function {name: $function_name})
        RETURN 'CALLS' as type, caller.name as source_name, target.name as target_name,
               'Function' as source_type, 'Function' as target_type
        """
        
        # Query for USES relationships
        uses_query = """
        MATCH (func:Function {name: $function_name})-[:USES]->(var:Variable)
        RETURN 'USES' as type, func.name as source_name, var.name as target_name,
               'Function' as source_type, 'Variable' as target_type
        """
        
        # Query for DEFINES relationships
        defines_query = """
        MATCH (func:Function {name: $function_name})-[:DEFINES]->(var:Variable)
        RETURN 'DEFINES' as type, func.name as source_name, var.name as target_name,
               'Function' as source_type, 'Variable' as target_type
        """
        
        relationships = []
        
        try:
            calls_result = self.driver.execute_query(calls_query, function_name=function_name)
            uses_result = self.driver.execute_query(uses_query, function_name=function_name)
            defines_result = self.driver.execute_query(defines_query, function_name=function_name)
            
            for record in calls_result.records:
                relationships.append(dict(record))
            for record in uses_result.records:
                relationships.append(dict(record))
            for record in defines_result.records:
                relationships.append(dict(record))
                
        except Exception as e:
            logger.error(f"Error querying function relationships for {function_name}: {e}")
        
        return relationships
    
    async def _find_variable_relationships(self, variable_name: str, scope_id: str = "") -> List[Dict]:
        """Find relationships for a variable."""
        # Query for USES relationships
        uses_query = """
        MATCH (user)-[:USES]->(var:Variable {name: $variable_name})
        RETURN 'USES' as type, user.name as source_name, var.name as target_name,
               labels(user)[0] as source_type, 'Variable' as target_type
        """
        
        # Query for MODIFIES relationships
        modifies_query = """
        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: $variable_name})
        RETURN 'MODIFIES' as type, modifier.name as source_name, var.name as target_name,
               labels(modifier)[0] as source_type, 'Variable' as target_type
        """
        
        relationships = []
        
        try:
            uses_result = self.driver.execute_query(uses_query, variable_name=variable_name)
            modifies_result = self.driver.execute_query(modifies_query, variable_name=variable_name)
            
            for record in uses_result.records:
                relationships.append(dict(record))
            for record in modifies_result.records:
                relationships.append(dict(record))
                
        except Exception as e:
            logger.error(f"Error querying variable relationships for {variable_name}: {e}")
        
        return relationships
    
    async def _find_script_relationships(self, script_name: str) -> List[Dict]:
        """Find relationships for a script."""
        # Query for CALLS relationships
        calls_query = """
        MATCH (caller:Script)-[:CALLS]->(target:Script {name: $script_name})
        RETURN 'CALLS' as type, caller.name as source_name, target.name as target_name,
               'Script' as source_type, 'Script' as target_type
        """
        
        # Query for USES relationships
        uses_query = """
        MATCH (script:Script {name: $script_name})-[:USES]->(var:Variable)
        RETURN 'USES' as type, script.name as source_name, var.name as target_name,
               'Script' as source_type, 'Variable' as target_type
        """
        
        relationships = []
        
        try:
            calls_result = self.driver.execute_query(calls_query, script_name=script_name)
            uses_result = self.driver.execute_query(uses_query, script_name=script_name)
            
            for record in calls_result.records:
                relationships.append(dict(record))
            for record in uses_result.records:
                relationships.append(dict(record))
                
        except Exception as e:
            logger.error(f"Error querying script relationships for {script_name}: {e}")
        
        return relationships
    
    async def _generate_impact_analysis(
        self, 
        file_analyses: List[Dict], 
        commit: Dict
    ) -> Dict[str, Any]:
        """
        Generate impact analysis for a commit.
        
        Args:
            file_analyses: List of file analyses
            commit: Commit information
            
        Returns:
            Impact analysis results
        """
        # Analyze affected components with optimization
        affected_functions = []
        affected_variables = []
        affected_scripts = []
        
        # Track processed entities to avoid duplicates
        processed_entities = set()
        
        for analysis in file_analyses:
            file_path = analysis.get('file_path', '')
            entities = analysis.get('entities', [])
            
            # Filter entities by relevance to the actual changed file
            relevant_entities = self._filter_entities_by_enhanced_relevance(entities, file_path)
            
            for entity in relevant_entities:
                # Create unique identifier to avoid duplicates
                entity_id = f"{entity.get('type')}:{entity.get('name')}:{entity.get('file_path')}"
                
                if entity_id not in processed_entities:
                    processed_entities.add(entity_id)
                    
                    if entity.get('type') == 'Function':
                        affected_functions.append(entity)
                    elif entity.get('type') == 'Variable':
                        affected_variables.append(entity)
                    elif entity.get('type') == 'Script':
                        affected_scripts.append(entity)
        
        # Generate basic impact summary
        impact_summary = {
            "total_files_changed": len(file_analyses),
            "affected_functions": len(affected_functions),
            "affected_variables": len(affected_variables),
            "affected_scripts": len(affected_scripts),
            "risk_level": self._calculate_risk_level(file_analyses),
            "impact_scope": self._determine_impact_scope(file_analyses)
        }
        
        # Enhanced analysis with LLM if available
        enhanced_analysis = {}
        if self.use_llm_analysis and self.llm:
            enhanced_analysis = await self._generate_llm_enhanced_analysis(
                file_analyses, commit, affected_functions, affected_variables, affected_scripts
            )
        
        return {
            "summary": impact_summary,
            "affected_functions": affected_functions,
            "affected_variables": affected_variables,
            "affected_scripts": affected_scripts,
            "enhanced_analysis": enhanced_analysis
        }
    
    async def _generate_llm_enhanced_analysis(
        self,
        file_analyses: List[Dict],
        commit: Dict,
        affected_functions: List[Dict],
        affected_variables: List[Dict],
        affected_scripts: List[Dict]
    ) -> Dict[str, Any]:
        """
        Generate enhanced impact analysis using LLM.
        
        Args:
            file_analyses: List of file analyses
            commit: Commit information
            affected_functions: List of affected functions
            affected_variables: List of affected variables
            affected_scripts: List of affected scripts
            
        Returns:
            Enhanced analysis results
        """
        try:
            # Prepare context for LLM analysis
            context = self._prepare_llm_context(
                file_analyses, commit, affected_functions, affected_variables, affected_scripts
            )
            
            # Generate LLM prompt
            prompt = self._generate_impact_analysis_prompt(context)
            
            # Get LLM response
            response = await self.llm.agenerate([prompt])
            llm_analysis = response.generations[0][0].text
            
            # Parse LLM response (simplified)
            return {
                "semantic_analysis": llm_analysis,
                "business_impact": self._extract_business_impact(llm_analysis),
                "risk_assessment": self._extract_risk_assessment(llm_analysis),
                "recommendations": self._extract_recommendations(llm_analysis)
            }
            
        except Exception as e:
            logger.error(f"Error in LLM enhanced analysis: {e}")
            return {
                "error": f"LLM analysis failed: {str(e)}"
            }
    
    def _prepare_llm_context(
        self,
        file_analyses: List[Dict],
        commit: Dict,
        affected_functions: List[Dict],
        affected_variables: List[Dict],
        affected_scripts: List[Dict]
    ) -> Dict[str, Any]:
        """Prepare context for LLM analysis."""
        return {
            "commit_hash": commit.get('hash', '')[:8],
            "commit_message": commit.get('message', ''),
            "commit_author": commit.get('author_name', ''),
            "commit_date": commit.get('date', ''),
            "changed_files": [analysis.get('file_path', '') for analysis in file_analyses],
            "affected_functions": [f.get('name', '') for f in affected_functions],
            "affected_variables": [v.get('name', '') for v in affected_variables],
            "affected_scripts": [s.get('name', '') for s in affected_scripts],
            "file_changes": [
                {
                    "file_path": analysis.get('file_path', ''),
                    "status": analysis.get('status', ''),
                    "entities": analysis.get('entities', []),
                    "relationships": analysis.get('relationships', [])
                }
                for analysis in file_analyses
            ]
        }
    
    def _generate_impact_analysis_prompt(self, context: Dict[str, Any]) -> str:
        """Generate prompt for LLM impact analysis."""
        return f"""
你是一个专业的代码变更影响分析专家。请分析以下代码变更的影响：

## 变更信息
- 提交哈希: {context['commit_hash']}
- 提交信息: {context['commit_message']}
- 提交作者: {context['commit_author']}
- 提交时间: {context['commit_date']}

## 变更文件
{chr(10).join(f"- {file}" for file in context['changed_files'])}

## 受影响的组件
- 函数: {', '.join(context['affected_functions']) if context['affected_functions'] else '无'}
- 变量: {', '.join(context['affected_variables']) if context['affected_variables'] else '无'}
- 脚本: {', '.join(context['affected_scripts']) if context['affected_scripts'] else '无'}

## 详细变更
{chr(10).join(f"### {change['file_path']} ({change['status']})" + chr(10) + f"实体: {len(change['entities'])}个, 关系: {len(change['relationships'])}个" for change in context['file_changes'])}

请从以下角度分析这次变更的影响：

1. **业务影响分析**
   - 这次变更会影响哪些业务功能？
   - 对用户体验有什么影响？
   - 是否需要更新文档？

2. **技术风险评估**
   - 变更的复杂度和风险等级
   - 潜在的bug风险点
   - 性能影响评估

3. **依赖关系分析**
   - 变更会如何影响其他模块？
   - 是否存在循环依赖风险？
   - 需要重点关注哪些测试？

4. **建议和后续行动**
   - 代码审查重点
   - 测试建议
   - 部署注意事项

请用中文回答，结构清晰，重点突出。
"""
    
    def _extract_business_impact(self, llm_analysis: str) -> str:
        """Extract business impact from LLM analysis."""
        # Simple extraction - in practice, you might use more sophisticated parsing
        if "业务影响" in llm_analysis:
            start = llm_analysis.find("业务影响")
            end = llm_analysis.find("技术风险") if "技术风险" in llm_analysis else len(llm_analysis)
            return llm_analysis[start:end].strip()
        return "业务影响分析不可用"
    
    def _extract_risk_assessment(self, llm_analysis: str) -> str:
        """Extract risk assessment from LLM analysis."""
        if "技术风险" in llm_analysis:
            start = llm_analysis.find("技术风险")
            end = llm_analysis.find("依赖关系") if "依赖关系" in llm_analysis else len(llm_analysis)
            return llm_analysis[start:end].strip()
        return "风险评估不可用"
    
    def _extract_recommendations(self, llm_analysis: str) -> str:
        """Extract recommendations from LLM analysis."""
        if "建议" in llm_analysis:
            start = llm_analysis.find("建议")
            return llm_analysis[start:].strip()
        return "建议不可用"
    
    def _calculate_risk_level(self, file_analyses: List[Dict]) -> str:
        """Calculate risk level based on file changes."""
        total_entities = sum(len(analysis.get('entities', [])) for analysis in file_analyses)
        
        if total_entities > 50:
            return "HIGH"
        elif total_entities > 20:
            return "MEDIUM"
        else:
            return "LOW"
    
    def _determine_impact_scope(self, file_analyses: List[Dict]) -> str:
        """Determine the scope of impact."""
        file_types = set()
        for analysis in file_analyses:
            file_path = analysis.get('file_path', '')
            if file_path.endswith('.m'):
                file_types.add('MATLAB')
            elif file_path.endswith('.py'):
                file_types.add('Python')
            elif file_path.endswith('.js'):
                file_types.add('JavaScript')
            # Add more file type detection as needed
        
        if len(file_types) > 1:
            return "CROSS_LANGUAGE"
        elif len(file_types) == 1:
            return f"SINGLE_LANGUAGE_{list(file_types)[0]}"
        else:
            return "UNKNOWN"
    
    async def _generate_queries_for_commit(
        self, 
        file_analyses: List[Dict], 
        commit: Dict
    ) -> List[Dict]:
        """
        Generate Neo4j queries for a commit.
        
        Args:
            file_analyses: List of file analyses
            commit: Commit information
            
        Returns:
            List of Neo4j queries
        """
        queries = []
        
        # Generate queries for affected entities
        for analysis in file_analyses:
            for entity in analysis.get('entities', []):
                query = await self.query_generator.generate_entity_impact_query(
                    entity, 
                    commit
                )
                if query:
                    queries.append(query)
        
        # Generate queries for relationships
        for analysis in file_analyses:
            for relationship in analysis.get('relationships', []):
                query = await self.query_generator.generate_relationship_impact_query(
                    relationship, 
                    commit
                )
                if query:
                    queries.append(query)
        
        return queries
    
    async def _generate_comprehensive_analysis(
        self, 
        analysis_results: List[Dict], 
        repo_info: Dict
    ) -> Dict[str, Any]:
        """
        Generate comprehensive analysis across all commits.
        
        Args:
            analysis_results: List of commit analysis results
            repo_info: Repository information
            
        Returns:
            Comprehensive analysis results
        """
        # Aggregate statistics
        total_commits = len(analysis_results)
        total_files_changed = sum(
            len(result.get('changes', [])) for result in analysis_results
        )
        
        # Collect all affected entities
        all_affected_functions = []
        all_affected_variables = []
        all_affected_scripts = []
        
        for result in analysis_results:
            impact = result.get('impact_analysis', {})
            all_affected_functions.extend(impact.get('affected_functions', []))
            all_affected_variables.extend(impact.get('affected_variables', []))
            all_affected_scripts.extend(impact.get('affected_scripts', []))
        
        # Generate dependency chain analysis
        dependency_chains = await self._analyze_dependency_chains(
            all_affected_functions, 
            all_affected_variables, 
            all_affected_scripts
        )
        
        # 为每个提交分配相关的依赖链路
        commit_details_with_chains = []
        for commit_detail in analysis_results:
            # 获取该提交影响的实体
            impact = commit_detail.get('impact_analysis', {})
            commit_functions = impact.get('affected_functions', [])
            commit_variables = impact.get('affected_variables', [])
            commit_scripts = impact.get('affected_scripts', [])
            
            # 找到与该提交相关的依赖链路
            related_chains = []
            for chain in dependency_chains:
                path_nodes = chain.get('path_nodes', [])
                
                # 检查链路是否包含该提交影响的实体
                for node in path_nodes:
                    node_name = node.get('name', '')
                    node_file_path = node.get('file_path', '')
                    
                    # 检查是否匹配该提交影响的函数
                    for func in commit_functions:
                        if (func.get('name') == node_name and 
                            func.get('file_path') == node_file_path):
                            related_chains.append(chain)
                            break
                    
                    # 检查是否匹配该提交影响的变量
                    for var in commit_variables:
                        if (var.get('name') == node_name and 
                            var.get('file_path') == node_file_path):
                            related_chains.append(chain)
                            break
                    
                    # 检查是否匹配该提交影响的脚本
                    for script in commit_scripts:
                        if (script.get('name') == node_name and 
                            script.get('file_path') == node_file_path):
                            related_chains.append(chain)
                            break
                    
                    if chain in related_chains:
                        break
            
            # 去重并排序
            unique_related_chains = []
            seen_chain_ids = set()
            for chain in related_chains:
                if chain.get('chain_id') not in seen_chain_ids:
                    unique_related_chains.append(chain)
                    seen_chain_ids.add(chain.get('chain_id'))
            
            # 按严重程度排序
            sorted_related_chains = sorted(
                unique_related_chains, 
                key=lambda x: self._get_severity_score(x), 
                reverse=True
            )
            
            # 创建包含依赖链路的提交详情
            commit_detail_with_chains = commit_detail.copy()
            commit_detail_with_chains['dependency_chains'] = sorted_related_chains
            
            commit_details_with_chains.append(commit_detail_with_chains)
        
        return {
            "repository_info": repo_info,
            "analysis_period": {
                "total_commits": total_commits,
                "total_files_changed": total_files_changed,
                "analysis_timestamp": datetime.now().isoformat()
            },
            "aggregated_impact": {
                "total_affected_functions": len(all_affected_functions),
                "total_affected_variables": len(all_affected_variables),
                "total_affected_scripts": len(all_affected_scripts)
            },
            "dependency_chains": dependency_chains,
            "commit_details": commit_details_with_chains
        }
    
    async def _analyze_dependency_chains(
        self, 
        functions: List[Dict], 
        variables: List[Dict], 
        scripts: List[Dict]
    ) -> List[Dict]:
        """
        Analyze dependency chains between affected components using real graph traversal.
        
        Args:
            functions: List of affected functions
            variables: List of affected variables
            scripts: List of affected scripts
            
        Returns:
            List of dependency chains with detailed path information
        """
        all_entities = functions + variables + scripts
        dependency_chains = []
        
        if not all_entities:
            return dependency_chains
        
        try:
            # Analyze each affected entity
            for entity in all_entities:
                entity_name = entity.get('name', '')
                entity_type = entity.get('type', '')
                file_path = entity.get('file_path', '')
                
                if not entity_name:
                    continue
                
                logger.info(f"Analyzing dependency chains for {entity_type}: {entity_name} in {file_path}")
                
                # Find the entity node in Neo4j
                entity_node = await self._find_entity_node(entity_name, entity_type, file_path)
                if not entity_node:
                    logger.warning(f"Entity node not found: {entity_name} ({entity_type}) in {file_path}")
                    continue
                
                # Analyze downstream dependencies (what this entity affects)
                downstream_chains = await self._analyze_downstream_dependencies(entity_node)
                
                # Analyze upstream dependencies (what affects this entity)
                upstream_chains = await self._analyze_upstream_dependencies(entity_node)
                
                # Combine all chains for this entity
                entity_chains = downstream_chains + upstream_chains
                
                if entity_chains:
                    dependency_chains.extend(entity_chains)
                    logger.info(f"Found {len(entity_chains)} dependency chains for {entity_name}")
                else:
                    logger.info(f"No dependency chains found for {entity_name}")
        
        except Exception as e:
            logger.error(f"Error analyzing dependency chains: {e}")
            # Return simplified structure as fallback
            return [
                {
                    "chain_id": "fallback_chain",
                    "source_entity": "unknown",
                    "target_entity": "unknown",
                    "path_nodes": [],
                    "relationships": [],
                    "path_length": 0,
                    "chain_type": "fallback",
                    "severity": "unknown",
                    "error": str(e)
                }
            ]
        
        # Remove duplicates and sort by severity
        unique_chains = self._deduplicate_chains(dependency_chains)
        sorted_chains = sorted(unique_chains, key=lambda x: self._get_severity_score(x), reverse=True)
        
        logger.info(f"Total dependency chains found: {len(sorted_chains)}")
        return sorted_chains
    
    async def _find_entity_node(self, entity_name: str, entity_type: str, file_path: str) -> Optional[Dict]:
        """Find an entity node in Neo4j by name, type, and file path."""
        try:
            # Try exact match first
            query = """
            MATCH (n)
            WHERE n.name = $entity_name 
            AND $entity_type IN labels(n)
            AND n.file_path = $file_path
            RETURN elementId(n) as node_id, n.name as name, labels(n) as node_type,
                   n.file_path as file_path, properties(n) as properties
            LIMIT 1
            """
            
            result = self.driver.execute_query(
                query, 
                entity_name=entity_name, 
                entity_type=entity_type, 
                file_path=file_path
            )
            
            if result.records:
                record = result.records[0]
                return {
                    "node_id": record["node_id"],
                    "name": record["name"],
                    "node_type": list(record["node_type"])[0],
                    "file_path": record["file_path"],
                    "properties": record["properties"]
                }
            
            # Try partial match if exact match fails
            query_fallback = """
            MATCH (n)
            WHERE n.name = $entity_name 
            AND $entity_type IN labels(n)
            RETURN elementId(n) as node_id, n.name as name, labels(n) as node_type,
                   n.file_path as file_path, properties(n) as properties
            LIMIT 1
            """
            
            result = self.driver.execute_query(
                query_fallback, 
                entity_name=entity_name, 
                entity_type=entity_type
            )
            
            if result.records:
                record = result.records[0]
                return {
                    "node_id": record["node_id"],
                    "name": record["name"],
                    "node_type": list(record["node_type"])[0],
                    "file_path": record["file_path"],
                    "properties": record["properties"]
                }
            
            return None
            
        except Exception as e:
            logger.error(f"Error finding entity node {entity_name}: {e}")
            return None
    
    async def _analyze_downstream_dependencies(self, source_node: Dict) -> List[Dict]:
        """Analyze what the source entity affects (downstream dependencies)."""
        chains = []
        
        try:
            # Find all paths from source to other nodes (max depth 3)
            query = """
            MATCH path = shortestPath((source)-[*1..3]->(target))
            WHERE elementId(source) = $source_node_id
            AND source <> target
            RETURN path, length(path) as path_length
            ORDER BY path_length, target.name
            LIMIT 20
            """
            
            result = self.driver.execute_query(query, source_node_id=source_node["node_id"])
            
            for record in result.records:
                path = record["path"]
                path_length = record["path_length"]
                
                # Extract path nodes and relationships
                path_nodes = []
                relationships = []
                
                for i, node in enumerate(path.nodes):
                    path_nodes.append({
                        "node_id": node.element_id,
                        "name": node.get("name", ""),
                        "node_type": list(node.labels)[0] if node.labels else "Unknown",
                        "file_path": node.get("file_path", ""),
                        "position": i
                    })
                
                for i, rel in enumerate(path.relationships):
                    relationships.append({
                        "type": rel.type,
                        "source": rel.start_node.element_id,
                        "target": rel.end_node.element_id,
                        "position": i
                    })
                
                # Determine chain type and severity
                chain_type = self._determine_chain_type(path_nodes, relationships)
                severity = self._calculate_chain_severity(path_nodes, relationships, path_length)
                
                chains.append({
                    "chain_id": f"downstream_{source_node['node_id']}_{len(chains)}",
                    "source_entity": source_node["name"],
                    "target_entity": path_nodes[-1]["name"] if path_nodes else "unknown",
                    "path_nodes": path_nodes,
                    "relationships": relationships,
                    "path_length": path_length,
                    "chain_type": chain_type,
                    "severity": severity,
                    "direction": "downstream"
                })
        
        except Exception as e:
            logger.error(f"Error analyzing downstream dependencies for {source_node['name']}: {e}")
        
        return chains
    
    async def _analyze_upstream_dependencies(self, target_node: Dict) -> List[Dict]:
        """Analyze what affects the target entity (upstream dependencies)."""
        chains = []
        
        try:
            # Find all paths from other nodes to target (max depth 3)
            query = """
            MATCH path = shortestPath((source)-[*1..3]->(target))
            WHERE elementId(target) = $target_node_id
            AND source <> target
            RETURN path, length(path) as path_length
            ORDER BY path_length, source.name
            LIMIT 20
            """
            
            result = self.driver.execute_query(query, target_node_id=target_node["node_id"])
            
            for record in result.records:
                path = record["path"]
                path_length = record["path_length"]
                
                # Extract path nodes and relationships
                path_nodes = []
                relationships = []
                
                for i, node in enumerate(path.nodes):
                    path_nodes.append({
                        "node_id": node.element_id,
                        "name": node.get("name", ""),
                        "node_type": list(node.labels)[0] if node.labels else "Unknown",
                        "file_path": node.get("file_path", ""),
                        "position": i
                    })
                
                for i, rel in enumerate(path.relationships):
                    relationships.append({
                        "type": rel.type,
                        "source": rel.start_node.element_id,
                        "target": rel.end_node.element_id,
                        "position": i
                    })
                
                # Determine chain type and severity
                chain_type = self._determine_chain_type(path_nodes, relationships)
                severity = self._calculate_chain_severity(path_nodes, relationships, path_length)
                
                chains.append({
                    "chain_id": f"upstream_{target_node['node_id']}_{len(chains)}",
                    "source_entity": path_nodes[0]["name"] if path_nodes else "unknown",
                    "target_entity": target_node["name"],
                    "path_nodes": path_nodes,
                    "relationships": relationships,
                    "path_length": path_length,
                    "chain_type": chain_type,
                    "severity": severity,
                    "direction": "upstream"
                })
        
        except Exception as e:
            logger.error(f"Error analyzing upstream dependencies for {target_node['name']}: {e}")
        
        return chains
    
    def _determine_chain_type(self, path_nodes: List[Dict], relationships: List[Dict]) -> str:
        """Determine the type of dependency chain based on node types and relationships."""
        if not path_nodes:
            return "unknown"
        
        # Check for function call chains
        function_calls = [rel for rel in relationships if rel["type"] == "CALLS"]
        if function_calls:
            return "function_call_chain"
        
        # Check for variable usage chains
        variable_uses = [rel for rel in relationships if rel["type"] in ["USES", "DEFINES", "MODIFIES"]]
        if variable_uses:
            return "variable_dependency_chain"
        
        # Check for script dependencies
        script_nodes = [node for node in path_nodes if node["node_type"] == "Script"]
        if len(script_nodes) > 1:
            return "script_dependency_chain"
        
        # Check for cross-file dependencies
        file_paths = set(node["file_path"] for node in path_nodes if node["file_path"])
        if len(file_paths) > 1:
            return "cross_file_dependency_chain"
        
        return "general_dependency_chain"
    
    def _calculate_chain_severity(self, path_nodes: List[Dict], relationships: List[Dict], path_length: int) -> str:
        """Calculate the severity of a dependency chain."""
        if not path_nodes:
            return "unknown"
        
        # Factors that increase severity
        severity_score = 0
        
        # Path length factor
        severity_score += path_length * 2
        
        # Cross-file dependencies
        file_paths = set(node["file_path"] for node in path_nodes if node["file_path"])
        if len(file_paths) > 1:
            severity_score += len(file_paths) * 3
        
        # Critical relationship types
        critical_rels = ["CALLS", "DEFINES", "MODIFIES"]
        for rel in relationships:
            if rel["type"] in critical_rels:
                severity_score += 2
        
        # Node type factors
        for node in path_nodes:
            if node["node_type"] == "Function":
                severity_score += 1
            elif node["node_type"] == "Script":
                severity_score += 2
        
        # Determine severity level
        if severity_score >= 15:
            return "HIGH"
        elif severity_score >= 8:
            return "MEDIUM"
        else:
            return "LOW"
    
    def _get_severity_score(self, chain: Dict) -> int:
        """Get numeric score for severity sorting."""
        severity_map = {"HIGH": 3, "MEDIUM": 2, "LOW": 1, "unknown": 0}
        return severity_map.get(chain.get("severity", "unknown"), 0)
    
    def _deduplicate_chains(self, chains: List[Dict]) -> List[Dict]:
        """Remove duplicate dependency chains."""
        seen = set()
        unique_chains = []
        
        for chain in chains:
            # Create a unique identifier for the chain
            chain_id = f"{chain['source_entity']}_{chain['target_entity']}_{chain['path_length']}_{chain['direction']}"
            
            if chain_id not in seen:
                seen.add(chain_id)
                unique_chains.append(chain)
        
        return unique_chains
    
    async def _generate_outputs(
        self, 
        comprehensive_analysis: Dict, 
        output_dir: str
    ) -> Dict[str, str]:
        """
        Generate output files.
        
        Args:
            comprehensive_analysis: Comprehensive analysis results
            output_dir: Output directory
            
        Returns:
            Dictionary of output file paths
        """
        outputs = {}
        
        # Generate analysis report
        report_path = os.path.join(output_dir, "代码变更记录影响范围分析报告.md")
        await self.report_generator.generate_analysis_report(
            comprehensive_analysis, 
            report_path
        )
        outputs['analysis_report'] = report_path
        
        # Generate Neo4j queries file
        queries_path = os.path.join(output_dir, "影响链路查询语句.cypher")
        await self.report_generator.generate_queries_file(
            comprehensive_analysis, 
            queries_path
        )
        outputs['queries_file'] = queries_path
        
        # Generate Neo4j links file
        links_path = Path(output_dir) / "带查询语句的neo4j链接.md"
        await self.report_generator.generate_neo4j_links(
            comprehensive_analysis, 
            links_path,
            "neo4j://localhost:7687"  # Use hardcoded URI instead of driver.uri
        )
        outputs['neo4j_links'] = links_path
        
        return outputs 