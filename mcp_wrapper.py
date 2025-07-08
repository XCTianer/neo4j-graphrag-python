#!/usr/bin/env python3
"""
MCP Server wrapper to handle non-JSON output redirection
"""

import os
import sys
import subprocess
import json
import re

def is_json_line(line):
    """Check if a line contains valid JSON"""
    line = line.strip()
    if not line:
        return False
    
    # Check if line starts with { or [ and looks like JSON
    if line.startswith('{') or line.startswith('['):
        try:
            json.loads(line)
            return True
        except json.JSONDecodeError:
            pass
    
    # Check if line is a JSON-RPC message
    if line.startswith('{"jsonrpc"'):
        try:
            json.loads(line)
            return True
        except json.JSONDecodeError:
            pass
    
    return False

def main():
    """Main wrapper function"""
    # Set environment variables
    os.environ['MCP_SERVER_MODE'] = 'true'
    os.environ['PYTHONUNBUFFERED'] = '1'
    
    # Redirect stderr to file to capture non-JSON output
    stderr_file = open('/tmp/mcp_server_stderr.log', 'w')
    
    # Start the MCP server process
    cmd = [sys.executable, '/home/kotei/work/neo4j-graphrag-python/mcp_plugin/server.py']
    
    process = subprocess.Popen(
        cmd,
        stdin=sys.stdin,
        stdout=subprocess.PIPE,
        stderr=stderr_file,
        text=True,
        bufsize=1,
        universal_newlines=True
    )
    
    if process.stdout is None:
        print("Error: Failed to start MCP server", file=sys.stderr)
        return
    
    try:
        while True:
            # Read from server stdout
            line = process.stdout.readline()
            if not line:
                break
            
            # Debug: log all output to stderr file
            stderr_file.write(f"DEBUG OUTPUT: {repr(line)}")
            stderr_file.flush()
            
            # Check if this is JSON output
            if is_json_line(line):
                # Output JSON to stdout
                stderr_file.write(f"JSON OUTPUT: {line}")
                stderr_file.flush()
                sys.stdout.write(line)
                sys.stdout.flush()
            else:
                # Also redirect non-JSON output to stderr file
                stderr_file.write(f"NON-JSON: {repr(line)}")
                stderr_file.flush()
        
        # Wait for process to finish
        process.wait()
        
    except KeyboardInterrupt:
        process.terminate()
        process.wait()
    finally:
        stderr_file.close()

if __name__ == "__main__":
    main() 