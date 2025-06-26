#!/usr/bin/env python3
"""
Simple script to run the MCP server for Code Change Impact Analysis
"""

import asyncio
import sys
import os
from pathlib import Path

# Add the parent directory to the path
sys.path.insert(0, str(Path(__file__).parent.parent))

from mcp_plugin.server import MCPServer

def main():
    """Main entry point for running the MCP server"""
    print("🚀 Starting Code Change Impact Analysis MCP Server...")
    print("📡 Server will communicate via stdio")
    print("⏹️  Press Ctrl+C to stop the server")
    print("-" * 50)
    
    try:
        server = MCPServer()
        asyncio.run(server.run_server())
    except KeyboardInterrupt:
        print("\n✅ Server stopped by user")
    except Exception as e:
        print(f"\n❌ Server error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main() 