"""
MCP Server for Code Change Impact Analysis Plugin
"""

import asyncio
import json
import logging
import sys
from typing import Any, Dict, List, Optional
from pathlib import Path

# Add the parent directory to the path
sys.path.insert(0, str(Path(__file__).parent.parent))

from plugin import plugin

class MCPServer:
    """MCP Server implementation for Code Change Impact Analysis"""
    
    def __init__(self):
        self.plugin = plugin
        self.logger = logging.getLogger(__name__)
        self.initialized = False
    
    async def handle_initialize(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Handle initialize request"""
        self.logger.info("Handling initialize request")
        
        # Send initialize response
        response = {
            "jsonrpc": "2.0",
            "id": request.get('id'),
            "result": {
                "protocolVersion": "2024-11-05",
                "capabilities": {
                    "tools": {},
                    "experimental": {}
                },
                "serverInfo": {
                    "name": "code-change-impact-mcp",
                    "version": "1.0.0"
                }
            }
        }
        
        self.initialized = True
        return response
    
    async def handle_initialized(self, request: Dict[str, Any]) -> None:
        """Handle initialized notification"""
        self.logger.info("Handling initialized notification")
        # 不返回响应，initialized是通知，不是请求
        return None
    
    async def handle_request(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Handle incoming MCP requests"""
        try:
            method = request.get('method')
            params = request.get('params', {})
            request_id = request.get('id')
            
            # 添加调试日志
            print(f"DEBUG: 收到请求 - method: {method}, id: {request_id}, params: {params}", file=sys.stderr)
            self.logger.info(f"Handling request: {method}")
            
            # Handle initialization
            if method == 'initialize':
                return await self.handle_initialize(request)
            
            # Check if server is initialized
            if not self.initialized and method != 'initialize':
                return {
                    "jsonrpc": "2.0",
                    "id": request_id,
                    "error": {
                        "code": -32002,
                        "message": "Server not initialized"
                    }
                }
            
            # Handle initialized notification
            if method == 'initialized':
                await self.handle_initialized(request)
                return None  # 不返回响应，initialized是通知
            
            # Route to appropriate handler
            if method == 'analyze_code_changes':
                result = await self.plugin.analyze_code_changes(**params)
            elif method == 'get_impact_chains':
                result = await self.plugin.get_impact_chains(**params)
            elif method == 'get_file_impact':
                result = await self.plugin.get_file_impact(**params)
            elif method == 'get_commit_analysis':
                result = await self.plugin.get_commit_analysis(**params)
            elif method == 'get_neo4j_queries':
                result = await self.plugin.get_neo4j_queries(**params)
            elif method == 'get_analysis_config':
                result = await self.plugin.get_analysis_config()
            elif method == 'update_config':
                result = await self.plugin.update_config(**params)
            elif method == 'tools/list':
                result = {
                    "tools": [
                        {
                            "name": "analyze_code_changes",
                            "description": "Analyze code changes and their impacts",
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
                            "description": "Get impact chains for code changes",
                            "inputSchema": {
                                "type": "object",
                                "properties": {
                                    "repo_url": {"type": "string", "description": "Repository URL"},
                                    "days": {"type": "integer", "description": "Number of days to analyze", "default": 7},
                                    "severity_filter": {"type": "string", "description": "Filter by severity (HIGH, MEDIUM, LOW)", "enum": ["HIGH", "MEDIUM", "LOW"]}
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
                                "type": "object"
                            }
                        },
                        {
                            "name": "update_config",
                            "description": "Update analysis configuration",
                            "inputSchema": {
                                "type": "object",
                                "properties": {
                                    "config_updates": {"type": "object", "description": "Configuration updates to apply"}
                                },
                                "required": ["config_updates"]
                            }
                        }
                    ]
                }
            elif method == 'tools/call':
                # Handle tools/call method
                tool_name = params.get('name')
                arguments = params.get('arguments', {})
                
                if tool_name == 'analyze_code_changes':
                    result = await self.plugin.analyze_code_changes(**arguments)
                elif tool_name == 'get_impact_chains':
                    result = await self.plugin.get_impact_chains(**arguments)
                elif tool_name == 'get_file_impact':
                    result = await self.plugin.get_file_impact(**arguments)
                elif tool_name == 'get_commit_analysis':
                    result = await self.plugin.get_commit_analysis(**arguments)
                elif tool_name == 'get_neo4j_queries':
                    result = await self.plugin.get_neo4j_queries(**arguments)
                elif tool_name == 'get_analysis_config':
                    result = await self.plugin.get_analysis_config()
                elif tool_name == 'update_config':
                    result = await self.plugin.update_config(**arguments)
                else:
                    result = {"error": f"Unknown tool: {tool_name}"}
            else:
                result = {"error": f"Unknown method: {method}"}
            
            return {
                "jsonrpc": "2.0",
                "id": request_id,
                "result": result
            }
            
        except Exception as e:
            self.logger.error(f"Error handling request: {e}", exc_info=True)
            return {
                "jsonrpc": "2.0",
                "id": request.get('id'),
                "error": {
                    "code": -32603,
                    "message": f"Internal error: {str(e)}"
                }
            }
    
    async def handle_batch_request(self, requests: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """Handle batch requests"""
        results = []
        for request in requests:
            result = await self.handle_request(request)
            results.append(result)
        return results
    
    async def run_server(self, input_stream=None, output_stream=None):
        """Run the MCP server"""
        if input_stream is None:
            input_stream = sys.stdin
        if output_stream is None:
            output_stream = sys.stdout
        
        self.logger.info("Starting MCP server...")
        
        try:
            while True:
                # Read request from stdin
                line = await asyncio.get_event_loop().run_in_executor(
                    None, input_stream.readline
                )
                
                if not line:
                    break
                
                try:
                    request = json.loads(line.strip())
                    
                    # Handle batch requests
                    if isinstance(request, list):
                        response = await self.handle_batch_request(request)
                    else:
                        response = await self.handle_request(request)
                    
                    # Write response to stdout
                    if response is not None:
                        if isinstance(response, list):
                            for resp in response:
                                response_line = json.dumps(resp) + '\n'
                                await asyncio.get_event_loop().run_in_executor(
                                    None, output_stream.write, response_line
                                )
                        else:
                            response_line = json.dumps(response) + '\n'
                            await asyncio.get_event_loop().run_in_executor(
                                None, output_stream.write, response_line
                            )
                        
                        await asyncio.get_event_loop().run_in_executor(
                            None, output_stream.flush
                        )
                    
                except json.JSONDecodeError as e:
                    self.logger.error(f"Invalid JSON: {e}")
                    error_response = {
                        "jsonrpc": "2.0",
                        "id": None,
                        "error": {
                            "code": -32700,
                            "message": f"Parse error: {str(e)}"
                        }
                    }
                    error_line = json.dumps(error_response) + '\n'
                    await asyncio.get_event_loop().run_in_executor(
                        None, output_stream.write, error_line
                    )
                    await asyncio.get_event_loop().run_in_executor(
                        None, output_stream.flush
                    )
                    
        except KeyboardInterrupt:
            self.logger.info("Server stopped by user")
        except Exception as e:
            self.logger.error(f"Server error: {e}", exc_info=True)

async def main():
    """Main entry point"""
    server = MCPServer()
    await server.run_server()

if __name__ == "__main__":
    asyncio.run(main()) 