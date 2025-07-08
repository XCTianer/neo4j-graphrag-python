#!/usr/bin/env python3
"""
Codex MCP Server

A proper MCP server implementation for Codex integration.
"""

import asyncio
import json
import logging
import sys
from pathlib import Path
from typing import Dict, Any, Optional
from datetime import datetime

# Add current directory to Python path
current_dir = str(Path(__file__).parent)
sys.path.append(current_dir)

# Import MCP plugin
from plugin import CodeChangeImpactPlugin

# Configure logging
def setup_logging():
    """Setup logging configuration."""
    log_dir = Path(__file__).parent / "logs"
    log_dir.mkdir(exist_ok=True)
    
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        handlers=[
            logging.FileHandler(log_dir / f"mcp_server_{datetime.now().strftime('%Y%m%d')}.log"),
            logging.StreamHandler()
        ]
    )
    return logging.getLogger(__name__)

logger = setup_logging()

class CodexMcpServer:
    """MCP Server for Codex integration."""
    
    def __init__(self):
        self.plugin = CodeChangeImpactPlugin()
        self.initialized = False
        
    async def initialize(self, params: Dict[str, Any]) -> Dict[str, Any]:
        """Initialize the MCP server."""
        try:
            logger.info("Initializing MCP server...")
            self.initialized = True
            return {
                "protocolVersion": "2024-11-05",
                "capabilities": {
                    "tools": {}
                },
                "serverInfo": {
                    "name": "code-change-impact-mcp",
                    "version": "1.0.0"
                }
            }
        except Exception as e:
            logger.error(f"Initialization failed: {e}")
            return {"error": str(e)}
    
    async def list_tools(self) -> Dict[str, Any]:
        """List available tools."""
        tools = [
            {
                "name": "analyze_code_changes",
                "description": "Analyze code changes and their impact",
                "inputSchema": {
                    "type": "object",
                    "properties": {
                        "repo_url": {"type": "string", "description": "Repository URL to analyze"},
                        "days": {"type": "integer", "description": "Number of days to analyze", "default": 7},
                        "output_dir": {"type": "string", "description": "Output directory for reports", "default": "analysis_output"},
                        "detailed_chains": {"type": "boolean", "description": "Whether to generate detailed chain analysis", "default": True},
                        "show_chains": {"type": "boolean", "description": "Whether to show chains in output", "default": True}
                    }
                }
            },
            {
                "name": "get_impact_chains",
                "description": "Get impact chains for a repository",
                "inputSchema": {
                    "type": "object",
                    "properties": {
                        "repo_url": {"type": "string", "description": "Repository URL"},
                        "days": {"type": "integer", "description": "Number of days to analyze", "default": 7},
                        "severity_filter": {"type": "string", "description": "Filter by severity (HIGH, MEDIUM, LOW)"}
                    }
                }
            },
            {
                "name": "get_file_impact",
                "description": "Get impact analysis for specific files",
                "inputSchema": {
                    "type": "object",
                    "properties": {
                        "repo_url": {"type": "string", "description": "Repository URL"},
                        "days": {"type": "integer", "description": "Number of days to analyze", "default": 7},
                        "file_path": {"type": "string", "description": "Specific file path to analyze"}
                    }
                }
            },
            {
                "name": "get_commit_analysis",
                "description": "Get analysis for specific commits",
                "inputSchema": {
                    "type": "object",
                    "properties": {
                        "repo_url": {"type": "string", "description": "Repository URL"},
                        "days": {"type": "integer", "description": "Number of days to analyze", "default": 7},
                        "commit_hash": {"type": "string", "description": "Specific commit hash to analyze"}
                    }
                }
            },
            {
                "name": "get_neo4j_queries",
                "description": "Get Neo4j Cypher queries for analysis",
                "inputSchema": {
                    "type": "object",
                    "properties": {
                        "repo_url": {"type": "string", "description": "Repository URL"},
                        "days": {"type": "integer", "description": "Number of days to analyze", "default": 7}
                    }
                }
            },
            {
                "name": "get_analysis_config",
                "description": "Get current analysis configuration",
                "inputSchema": {
                    "type": "object",
                    "properties": {}
                }
            },
            {
                "name": "update_config",
                "description": "Update analysis configuration",
                "inputSchema": {
                    "type": "object",
                    "properties": {
                        "config_updates": {"type": "object", "description": "Configuration updates"}
                    }
                }
            }
        ]
        
        return {"tools": tools}
    
    async def call_tool(self, name: str, arguments: Optional[Dict[str, Any]] = None) -> Dict[str, Any]:
        """Call a tool by name."""
        try:
            logger.info(f"Calling tool: {name} with arguments: {arguments}")
            
            if not self.initialized:
                return {"error": "Server not initialized"}
            
            # Call the appropriate tool method
            if name == "analyze_code_changes":
                result = await self.plugin.analyze_code_changes(**(arguments or {}))
            elif name == "get_impact_chains":
                result = await self.plugin.get_impact_chains(**(arguments or {}))
            elif name == "get_file_impact":
                result = await self.plugin.get_file_impact(**(arguments or {}))
            elif name == "get_commit_analysis":
                result = await self.plugin.get_commit_analysis(**(arguments or {}))
            elif name == "get_neo4j_queries":
                result = await self.plugin.get_neo4j_queries(**(arguments or {}))
            elif name == "get_analysis_config":
                result = await self.plugin.get_analysis_config(**(arguments or {}))
            elif name == "update_config":
                result = await self.plugin.update_config(**(arguments or {}))
            else:
                return {"error": f"Unknown tool: {name}"}
            
            logger.info(f"Tool {name} completed successfully")
            return {"content": [{"type": "text", "text": json.dumps(result, ensure_ascii=False, indent=2)}]}
            
        except Exception as e:
            logger.error(f"Tool {name} failed: {e}")
            return {"error": str(e)}

async def main():
    """Main function for MCP server."""
    server = CodexMcpServer()
    
    # Simple MCP protocol implementation
    while True:
        try:
            line = await asyncio.get_event_loop().run_in_executor(None, sys.stdin.readline)
            if not line:
                break
                
            request = json.loads(line.strip())
            method = request.get("method")
            params = request.get("params", {})
            request_id = request.get("id")
            
            logger.info(f"Received request: {method}")
            
            if method == "initialize":
                result = await server.initialize(params)
                response = {"jsonrpc": "2.0", "id": request_id, "result": result}
            elif method == "tools/list":
                result = await server.list_tools()
                response = {"jsonrpc": "2.0", "id": request_id, "result": result}
            elif method == "tools/call":
                tool_name = params.get("name")
                arguments = params.get("arguments")
                result = await server.call_tool(tool_name, arguments)
                response = {"jsonrpc": "2.0", "id": request_id, "result": result}
            else:
                response = {"jsonrpc": "2.0", "id": request_id, "error": {"code": -32601, "message": f"Method not found: {method}"}}
            
            print(json.dumps(response))
            sys.stdout.flush()
            
        except Exception as e:
            logger.error(f"Error processing request: {e}")
            error_response = {"jsonrpc": "2.0", "id": request_id, "error": {"code": -32603, "message": str(e)}}
            print(json.dumps(error_response))
            sys.stdout.flush()

if __name__ == "__main__":
    asyncio.run(main())
