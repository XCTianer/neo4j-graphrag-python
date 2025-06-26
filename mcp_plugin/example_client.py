#!/usr/bin/env python3
"""
Example client for the Code Change Impact Analysis MCP Plugin
"""

import asyncio
import json
import subprocess
import sys
from typing import Dict, Any, Optional

class MCPClient:
    """Example MCP client for the Code Change Impact Analysis plugin"""
    
    def __init__(self, server_command: str = "python", server_args: list = None):
        self.server_command = server_command
        self.server_args = server_args or ["mcp_plugin/server.py"]
        self.process = None
    
    async def start_server(self):
        """Start the MCP server process"""
        try:
            self.process = await asyncio.create_subprocess_exec(
                self.server_command,
                *self.server_args,
                stdin=asyncio.subprocess.PIPE,
                stdout=asyncio.subprocess.PIPE,
                stderr=asyncio.subprocess.PIPE
            )
            print(f"✅ MCP server started with PID: {self.process.pid}")
        except Exception as e:
            print(f"❌ Failed to start MCP server: {e}")
            raise
    
    async def stop_server(self):
        """Stop the MCP server process"""
        if self.process:
            self.process.terminate()
            await self.process.wait()
            print("✅ MCP server stopped")
    
    async def send_request(self, method: str, params: Dict[str, Any] = None, request_id: int = 1) -> Dict[str, Any]:
        """Send a request to the MCP server"""
        if not self.process:
            raise RuntimeError("Server not started")
        
        request = {
            "jsonrpc": "2.0",
            "id": request_id,
            "method": method,
            "params": params or {}
        }
        
        # Send request
        request_line = json.dumps(request) + '\n'
        self.process.stdin.write(request_line.encode())
        await self.process.stdin.drain()
        
        # Read response
        response_line = await self.process.stdout.readline()
        if not response_line:
            raise RuntimeError("No response from server")
        
        response = json.loads(response_line.decode().strip())
        return response
    
    async def analyze_repository(self, repo_url: str, days: int = 7) -> Dict[str, Any]:
        """Analyze a repository for code changes"""
        print(f"🔍 Analyzing repository: {repo_url}")
        print(f"📅 Analysis period: {days} days")
        
        response = await self.send_request("analyze_code_changes", {
            "repo_url": repo_url,
            "days": days,
            "detailed_chains": True,
            "show_chains": True
        })
        
        if "error" in response:
            print(f"❌ Analysis failed: {response['error']}")
            return response
        
        result = response.get("result", {})
        print(f"✅ Analysis completed successfully")
        
        # Print summary
        comprehensive_analysis = result.get("comprehensive_analysis", {})
        dependency_chains = comprehensive_analysis.get("dependency_chains", [])
        
        print(f"📊 Analysis Summary:")
        print(f"   - Total impact chains: {len(dependency_chains)}")
        
        # Count by severity
        high_risk = len([c for c in dependency_chains if c.get("severity") == "HIGH"])
        medium_risk = len([c for c in dependency_chains if c.get("severity") == "MEDIUM"])
        low_risk = len([c for c in dependency_chains if c.get("severity") == "LOW"])
        
        print(f"   - High risk chains: {high_risk}")
        print(f"   - Medium risk chains: {medium_risk}")
        print(f"   - Low risk chains: {low_risk}")
        
        # Print report paths
        reports = result.get("reports", {})
        if reports:
            print(f"📄 Generated Reports:")
            for report_type, path in reports.items():
                print(f"   - {report_type}: {path}")
        
        return result
    
    async def get_impact_chains(self, repo_url: str, severity_filter: Optional[str] = None) -> Dict[str, Any]:
        """Get impact chains for a repository"""
        print(f"🔗 Getting impact chains for: {repo_url}")
        if severity_filter:
            print(f"🎯 Filtering by severity: {severity_filter}")
        
        params = {"repo_url": repo_url}
        if severity_filter:
            params["severity_filter"] = severity_filter
        
        response = await self.send_request("get_impact_chains", params)
        
        if "error" in response:
            print(f"❌ Failed to get impact chains: {response['error']}")
            return response
        
        result = response.get("result", {})
        summary = result.get("summary", {})
        
        print(f"📊 Impact Chains Summary:")
        print(f"   - Total chains: {summary.get('total', 0)}")
        print(f"   - High risk: {summary.get('high_risk', 0)}")
        print(f"   - Medium risk: {summary.get('medium_risk', 0)}")
        print(f"   - Low risk: {summary.get('low_risk', 0)}")
        
        return result
    
    async def get_file_impact(self, repo_url: str, file_path: Optional[str] = None) -> Dict[str, Any]:
        """Get file impact analysis"""
        print(f"📁 Getting file impact analysis for: {repo_url}")
        if file_path:
            print(f"🎯 Specific file: {file_path}")
        
        params = {"repo_url": repo_url}
        if file_path:
            params["file_path"] = file_path
        
        response = await self.send_request("get_file_impact", params)
        
        if "error" in response:
            print(f"❌ Failed to get file impact: {response['error']}")
            return response
        
        result = response.get("result", {})
        total_files = result.get("total_files", 0)
        
        print(f"📊 File Impact Summary:")
        print(f"   - Total files analyzed: {total_files}")
        
        return result
    
    async def get_neo4j_queries(self, repo_url: str) -> Dict[str, Any]:
        """Get Neo4j Cypher queries"""
        print(f"🔍 Getting Neo4j queries for: {repo_url}")
        
        response = await self.send_request("get_neo4j_queries", {"repo_url": repo_url})
        
        if "error" in response:
            print(f"❌ Failed to get Neo4j queries: {response['error']}")
            return response
        
        result = response.get("result", {})
        queries_file = result.get("queries_file", "")
        
        print(f"✅ Neo4j queries generated:")
        print(f"   - Queries file: {queries_file}")
        
        return result
    
    async def get_config(self) -> Dict[str, Any]:
        """Get current configuration"""
        print("⚙️ Getting current configuration...")
        
        response = await self.send_request("get_analysis_config")
        
        if "error" in response:
            print(f"❌ Failed to get configuration: {response['error']}")
            return response
        
        result = response.get("result", {})
        is_valid = result.get("is_valid", False)
        
        print(f"✅ Configuration retrieved:")
        print(f"   - Valid: {is_valid}")
        
        return result

async def main():
    """Main example function"""
    # Example repository to analyze
    repo_url = "https://github.com/XCTianer/transformer-models"
    
    client = MCPClient()
    
    try:
        # Start the server
        await client.start_server()
        
        # Wait a moment for server to initialize
        await asyncio.sleep(1)
        
        print("🚀 Starting Code Change Impact Analysis Example")
        print("=" * 60)
        
        # 1. Get current configuration
        await client.get_config()
        print()
        
        # 2. Analyze repository
        analysis_result = await client.analyze_repository(repo_url, days=7)
        print()
        
        # 3. Get impact chains (high risk only)
        chains_result = await client.get_impact_chains(repo_url, severity_filter="HIGH")
        print()
        
        # 4. Get file impact analysis
        file_impact = await client.get_file_impact(repo_url)
        print()
        
        # 5. Get Neo4j queries
        queries_result = await client.get_neo4j_queries(repo_url)
        print()
        
        print("✅ Example completed successfully!")
        
    except Exception as e:
        print(f"❌ Example failed: {e}")
        import traceback
        traceback.print_exc()
    
    finally:
        # Stop the server
        await client.stop_server()

if __name__ == "__main__":
    asyncio.run(main()) 