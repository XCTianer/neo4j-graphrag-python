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
    
    async def handle_request(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Handle incoming MCP requests"""
        try:
            method = request.get('method')
            params = request.get('params', {})
            request_id = request.get('id')
            
            self.logger.info(f"Handling request: {method}")
            
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