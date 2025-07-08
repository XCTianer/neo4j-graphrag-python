#!/usr/bin/env python3
"""
Natural Language Parser for MCP Tools
Converts natural language instructions to MCP tool calls
"""

import re
import json
import subprocess
import os
import logging
from datetime import datetime
from typing import Dict, Any, List, Optional
from pathlib import Path

class NaturalLanguageMCPParser:
    def __init__(self, mcp_plugin_dir: str = None):
        """Initialize the natural language parser."""
        if mcp_plugin_dir is None:
            self.mcp_plugin_dir = Path(__file__).parent
        else:
            self.mcp_plugin_dir = Path(mcp_plugin_dir)
        
        # Setup logging
        self.setup_logging()
        
        # Define command patterns
        self.command_patterns = {
            # 分析相关
            r'分析.*提交|analyze.*commit': {
                'tool': 'analyze_code_changes',
                'extract_params': self._extract_commit_hash,
                'description': '分析代码提交的影响'
            },
            r'分析.*文件|analyze.*file': {
                'tool': 'get_file_impact',
                'extract_params': self._extract_file_path,
                'description': '分析文件的影响'
            },
            r'获取.*影响链|get.*impact.*chain': {
                'tool': 'get_impact_chains',
                'extract_params': self._extract_file_and_depth,
                'description': '获取文件的影响链'
            },
            
            # 报告相关
            r'生成.*报告|generate.*report': {
                'tool': 'generate_report',
                'extract_params': self._extract_report_params,
                'description': '生成分析报告'
            },
            r'获取.*配置|get.*config': {
                'tool': 'get_analysis_config',
                'extract_params': lambda text: {},
                'description': '获取分析配置'
            },
            
            # 查询相关
            r'获取.*查询|get.*queries': {
                'tool': 'get_neo4j_queries',
                'extract_params': lambda text: {},
                'description': '获取Neo4j查询'
            },
            
            # 最近变更
            r'分析.*最近|analyze.*recent': {
                'tool': 'analyze_recent',
                'extract_params': self._extract_commit_count,
                'description': '分析最近的代码变更'
            },
            
            # 重构相关
            r'重构.*影响|refactor.*impact': {
                'tool': 'refactor_impact',
                'extract_params': self._extract_file_path,
                'description': '分析重构的影响'
            },
            
            # 性能相关
            r'性能.*影响|performance.*impact': {
                'tool': 'performance_impact',
                'extract_params': self._extract_file_path,
                'description': '分析性能影响'
            },
            
            # 安全相关
            r'安全.*影响|security.*impact': {
                'tool': 'security_impact',
                'extract_params': self._extract_file_path,
                'description': '分析安全影响'
            }
        }
    
    def setup_logging(self):
        """Setup logging for natural language parser."""
        log_dir = self.mcp_plugin_dir / "logs"
        log_dir.mkdir(exist_ok=True)
        
        # Create a logger
        self.logger = logging.getLogger('natural_language_parser')
        self.logger.setLevel(logging.INFO)
        
        # Create handlers
        file_handler = logging.FileHandler(log_dir / f"nl_parser_{datetime.now().strftime('%Y%m%d')}.log")
        console_handler = logging.StreamHandler()
        
        # Create formatters and add it to handlers
        log_format = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
        file_handler.setFormatter(log_format)
        console_handler.setFormatter(log_format)
        
        # Add handlers to the logger
        self.logger.addHandler(file_handler)
        self.logger.addHandler(console_handler)
    
    def parse_natural_language(self, text: str) -> Dict[str, Any]:
        """Parse natural language text and return MCP tool call."""
        # Log the incoming request
        self.logger.info(f"Processing natural language request: {text}")
        
        text_lower = text.lower()
        
        # Find matching pattern
        for pattern, config in self.command_patterns.items():
            if re.search(pattern, text_lower):
                try:
                    params = config['extract_params'](text)
                    result = {
                        'tool': config['tool'],
                        'params': params,
                        'description': config['description'],
                        'original_text': text,
                        'success': True
                    }
                    self.logger.info(f"Successfully parsed command: {config['tool']} with params: {params}")
                    return result
                except Exception as e:
                    error_result = {
                        'error': f"参数提取失败: {str(e)}",
                        'original_text': text,
                        'success': False
                    }
                    self.logger.error(f"Parameter extraction failed: {str(e)}")
                    return error_result
        
        # No pattern matched
        error_result = {
            'error': '无法识别指令，请尝试以下格式：',
            'suggestions': [
                '分析最近的提交',
                '分析文件 src/main.py 的影响',
                '获取 src/core/engine.py 的影响链',
                '生成分析报告',
                '分析重构的影响'
            ],
            'original_text': text,
            'success': False
        }
        self.logger.warning(f"No pattern matched for text: {text}")
        return error_result
    
    def _extract_commit_hash(self, text: str) -> Dict[str, Any]:
        """Extract commit hash from text."""
        params = {}
        
        # Extract repository path first
        repo_path = self._extract_repository_path(text)
        if repo_path:
            params['repository_path'] = repo_path
        
        # Look for commit hash pattern
        commit_pattern = r'[a-f0-9]{7,40}'
        commits = re.findall(commit_pattern, text)
        
        if commits:
            params['commit_hash'] = commits[0]
        else:
            # If no explicit commit, use current HEAD
            try:
                result = subprocess.run(
                    ['git', 'rev-parse', 'HEAD'],
                    capture_output=True,
                    text=True
                )
                if result.returncode == 0:
                    params['commit_hash'] = result.stdout.strip()
                else:
                    params['commit_hash'] = 'HEAD'
            except:
                params['commit_hash'] = 'HEAD'
        
        return params
    
    def _extract_file_path(self, text: str) -> Dict[str, Any]:
        """Extract file path from text."""
        params = {}
        
        # Extract repository path first
        repo_path = self._extract_repository_path(text)
        if repo_path:
            params['repository_path'] = repo_path
        
        # Look for file paths
        file_patterns = [
            r'["\']([^"\']+\.(py|js|ts|java|cpp|c|h|go|rs|php|rb))["\']',
            r'文件\s+([^\s]+\.(py|js|ts|java|cpp|c|h|go|rs|php|rb))',
            r'file\s+([^\s]+\.(py|js|ts|java|cpp|c|h|go|rs|php|rb))',
            r'([^\s]+\.(py|js|ts|java|cpp|c|h|go|rs|php|rb))'
        ]
        
        for pattern in file_patterns:
            matches = re.findall(pattern, text)
            if matches:
                file_path = matches[0] if isinstance(matches[0], tuple) else matches[0]
                params['file_path'] = file_path
                return params
        
        # Default file if none found
        params['file_path'] = 'src/main.py'
        return params
    
    def _extract_file_and_depth(self, text: str) -> Dict[str, Any]:
        """Extract file path and depth from text."""
        params = self._extract_file_path(text)
        
        # Extract repository path
        repo_path = self._extract_repository_path(text)
        if repo_path:
            params['repository_path'] = repo_path
        
        # Extract depth
        depth_patterns = [
            r'深度\s*(\d+)',
            r'depth\s*(\d+)',
            r'(\d+)\s*层',
            r'(\d+)\s*levels'
        ]
        
        for pattern in depth_patterns:
            match = re.search(pattern, text)
            if match:
                params['max_depth'] = int(match.group(1))
                break
        else:
            params['max_depth'] = 3  # Default depth
        
        return params
    
    def _extract_commit_count(self, text: str) -> Dict[str, Any]:
        """Extract number of commits to analyze."""
        count_patterns = [
            r'(\d+)\s*个提交',
            r'(\d+)\s*commits',
            r'最近\s*(\d+)',
            r'recent\s*(\d+)'
        ]
        
        for pattern in count_patterns:
            match = re.search(pattern, text)
            if match:
                return {'commit_count': int(match.group(1))}
        
        return {'commit_count': 3}  # Default count
    
    def _extract_repository_path(self, text: str) -> Optional[str]:
        """Extract repository path from text."""
        # Look for repository path patterns
        repo_patterns = [
            # 仓库路径模式 - 带引号
            r'仓库\s*["\']([^"\']+)["\']',
            r'repository\s*["\']([^"\']+)["\']',
            r'repo\s*["\']([^"\']+)["\']',
            r'路径\s*["\']([^"\']+)["\']',
            r'path\s*["\']([^"\']+)["\']',
            # 仓库路径模式 - 不带引号
            r'仓库\s+([^\s]+)',
            r'repository\s+([^\s]+)',
            r'repo\s+([^\s]+)',
            r'路径\s+([^\s]+)',
            r'path\s+([^\s]+)',
            # 绝对路径模式
            r'["\'](/[^"\']+)["\']',
            r'["\'](~/[^"\']+)["\']',
            # 绝对路径模式 - 不带引号
            r'\s(/[^\s]+)',
            r'\s(~/[^\s]+)',
            # 相对路径模式
            r'["\']([^"\']*\.git[^"\']*)["\']',
            r'["\']([^"\']*src[^"\']*)["\']',
            # 简化的路径模式
            r'在\s*([^\s]+)',
            r'in\s*([^\s]+)',
            r'从\s*([^\s]+)',
            r'from\s*([^\s]+)'
        ]
        
        for pattern in repo_patterns:
            match = re.search(pattern, text)
            if match:
                repo_path = match.group(1)
                # Expand ~ to home directory
                if repo_path.startswith('~'):
                    repo_path = os.path.expanduser(repo_path)
                # Validate path exists
                if os.path.exists(repo_path):
                    return repo_path
        
        return None
    
    def _extract_report_params(self, text: str) -> Dict[str, Any]:
        """Extract report generation parameters."""
        params = {}
        
        # Extract output file
        output_patterns = [
            r'保存到\s*["\']([^"\']+)["\']',
            r'save.*["\']([^"\']+)["\']',
            r'输出.*["\']([^"\']+)["\']'
        ]
        
        for pattern in output_patterns:
            match = re.search(pattern, text)
            if match:
                params['output_file'] = match.group(1)
                break
        
        return params
    
    def execute_mcp_tool(self, tool: str, params: Dict[str, Any]) -> Dict[str, Any]:
        """Execute MCP tool with given parameters."""
        start_time = datetime.now()
        
        try:
            # Log the tool execution
            self.logger.info(f"Executing MCP tool: {tool} with params: {params}")
            
            # Get repository path if specified
            repo_path = params.get('repository_path')
            
            # Activate conda environment and run tool
            cmd = f"""
source ~/miniconda3/etc/profile.d/conda.sh
conda activate sunny
"""
            
            # Change to repository directory if specified
            if repo_path:
                cmd += f"cd {repo_path}\n"
                self.logger.info(f"Changed to repository directory: {repo_path}")
            else:
                cmd += f"cd {self.mcp_plugin_dir}\n"
            
            cmd += f"cd {self.mcp_plugin_dir}\n"
            
            if tool == 'analyze_code_changes':
                cmd += f"python codex_integration.py analyze_code_changes '{json.dumps(params)}'"
            elif tool == 'get_file_impact':
                cmd += f"python codex_integration.py get_file_impact '{json.dumps(params)}'"
            elif tool == 'get_impact_chains':
                cmd += f"python codex_integration.py get_impact_chains '{json.dumps(params)}'"
            elif tool == 'get_analysis_config':
                cmd += "python codex_integration.py get_analysis_config '{}'"
            elif tool == 'get_neo4j_queries':
                cmd += "python codex_integration.py get_neo4j_queries '{}'"
            elif tool == 'analyze_recent':
                cmd += f"python codex_automation.py --action analyze --commits {params.get('commit_count', 3)}"
            elif tool == 'generate_report':
                output_file = params.get('output_file', 'analysis_report.md')
                cmd += f"python codex_automation.py --action report --output {output_file}"
            else:
                error_result = {'error': f'未知工具: {tool}'}
                self.logger.error(f"Unknown tool: {tool}")
                return error_result
            
            self.logger.info(f"Executing command: {cmd}")
            
            result = subprocess.run(
                ['bash', '-c', cmd],
                capture_output=True,
                text=True,
                timeout=60
            )
            
            duration = (datetime.now() - start_time).total_seconds()
            
            if result.returncode == 0:
                try:
                    parsed_result = json.loads(result.stdout.strip())
                    self.logger.info(f"Tool execution successful in {duration:.2f}s: {tool}")
                    return parsed_result
                except json.JSONDecodeError:
                    self.logger.warning(f"Could not parse JSON result for tool {tool}")
                    return {'output': result.stdout.strip(), 'success': True}
            else:
                error_result = {'error': result.stderr, 'success': False}
                self.logger.error(f"Tool execution failed in {duration:.2f}s: {tool} - {result.stderr}")
                return error_result
                
        except Exception as e:
            duration = (datetime.now() - start_time).total_seconds()
            error_result = {'error': str(e), 'success': False}
            self.logger.error(f"Tool execution exception in {duration:.2f}s: {tool} - {str(e)}")
            return error_result
    
    def process_natural_language(self, text: str) -> Dict[str, Any]:
        """Process natural language and execute MCP tool."""
        # Parse the natural language
        parsed = self.parse_natural_language(text)
        
        if not parsed['success']:
            return parsed
        
        # Execute the MCP tool
        result = self.execute_mcp_tool(parsed['tool'], parsed['params'])
        
        return {
            'tool_used': parsed['tool'],
            'params_used': parsed['params'],
            'description': parsed['description'],
            'result': result,
            'original_text': text,
            'success': True
        }

def main():
    """Main function for command-line usage."""
    import sys
    
    if len(sys.argv) < 2:
        print("Usage: python natural_language_parser.py <natural_language_command>")
        print("Examples:")
        print("  python natural_language_parser.py '分析最近的提交'")
        print("  python natural_language_parser.py '分析文件 src/main.py 的影响'")
        print("  python natural_language_parser.py '获取 src/core/engine.py 的影响链，深度5'")
        sys.exit(1)
    
    parser = NaturalLanguageMCPParser()
    text = ' '.join(sys.argv[1:])
    
    result = parser.process_natural_language(text)
    print(json.dumps(result, indent=2, ensure_ascii=False))

if __name__ == "__main__":
    main() 