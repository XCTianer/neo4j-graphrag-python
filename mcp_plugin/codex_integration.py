#!/usr/bin/env python3
"""
Codex MCP Integration Script

This script allows Codex to use the Neo4j GraphRAG MCP tools through subprocess calls.
It provides a bridge between Codex and the MCP server.
"""

import json
import subprocess
import sys
import os
from pathlib import Path
from typing import Dict, Any, Optional
import logging
from datetime import datetime

# Configure logging
def setup_logging():
    """Setup logging configuration for MCP tool calls."""
    log_dir = Path(__file__).parent / "logs"
    log_dir.mkdir(exist_ok=True)
    
    # Create a logger
    logger = logging.getLogger('mcp_tool_calls')
    logger.setLevel(logging.INFO)
    
    # Create handlers
    file_handler = logging.FileHandler(log_dir / f"mcp_calls_{datetime.now().strftime('%Y%m%d')}.log")
    console_handler = logging.StreamHandler()
    
    # Create formatters and add it to handlers
    log_format = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    file_handler.setFormatter(log_format)
    console_handler.setFormatter(log_format)
    
    # Add handlers to the logger
    logger.addHandler(file_handler)
    logger.addHandler(console_handler)
    
    return logger

# Setup logger
logger = setup_logging()

def log_tool_call(tool_name: str, params: dict, result: dict, duration: float = None):
    """Log MCP tool call details."""
    log_entry = {
        'timestamp': datetime.now().isoformat(),
        'tool_name': tool_name,
        'parameters': params,
        'result': result,
        'duration_seconds': duration,
        'success': result.get('success', False) if isinstance(result, dict) else False
    }
    
    logger.info(f"MCP Tool Call: {json.dumps(log_entry, ensure_ascii=False)}")
    
    # Also write to a separate detailed log file
    detailed_log_file = Path(__file__).parent / "logs" / "detailed_calls.jsonl"
    with open(detailed_log_file, 'a', encoding='utf-8') as f:
        f.write(json.dumps(log_entry, ensure_ascii=False) + '\n')

def call_mcp_tool(tool_name: str, params: dict = None) -> dict:
    """Call MCP tool with logging."""
    start_time = datetime.now()
    
    try:
        # Log the incoming call
        logger.info(f"Received MCP tool call: {tool_name} with params: {params}")
        
        # Add the current directory to Python path
        current_dir = str(Path(__file__).parent)
        sys.path.append(current_dir)
        
        # Import the MCP plugin
        from plugin import CodeChangeImpactPlugin
        
        # Create plugin instance
        plugin = CodeChangeImpactPlugin()
        
        # Call the appropriate tool
        if tool_name == 'analyze_code_changes':
            result = plugin.analyze_code_changes(params or {})
        elif tool_name == 'get_file_impact':
            result = plugin.get_file_impact(params or {})
        elif tool_name == 'get_impact_chains':
            result = plugin.get_impact_chains(params or {})
        elif tool_name == 'get_commit_analysis':
            result = plugin.get_commit_analysis(params or {})
        elif tool_name == 'get_neo4j_queries':
            result = plugin.get_neo4j_queries(params or {})
        elif tool_name == 'get_analysis_config':
            result = plugin.get_analysis_config(params or {})
        elif tool_name == 'update_config':
            result = plugin.update_config(params or {})
        else:
            result = {'error': f'Unknown tool: {tool_name}', 'success': False}
        
        # Calculate duration
        duration = (datetime.now() - start_time).total_seconds()
        
        # Log the result
        log_tool_call(tool_name, params or {}, result, duration)
        
        return result
        
    except Exception as e:
        duration = (datetime.now() - start_time).total_seconds()
        error_result = {'error': str(e), 'success': False}
        log_tool_call(tool_name, params or {}, error_result, duration)
        return error_result

def main():
    """Main function for command-line usage."""
    if len(sys.argv) < 2:
        print("Usage: python codex_integration.py <tool_name> [params_json]")
        print("Available tools: analyze_code_changes, get_file_impact, get_impact_chains, get_commit_analysis, get_neo4j_queries, get_analysis_config, update_config")
        sys.exit(1)
    
    tool_name = sys.argv[1]
    params = {}
    
    if len(sys.argv) > 2:
        try:
            params = json.loads(sys.argv[2])
        except json.JSONDecodeError:
            print(f"Error: Invalid JSON parameters: {sys.argv[2]}")
            sys.exit(1)
    
    # Log the command line call
    logger.info(f"Command line call: {' '.join(sys.argv)}")
    
    result = call_mcp_tool(tool_name, params)
    print(json.dumps(result, ensure_ascii=False))

if __name__ == "__main__":
    main() 