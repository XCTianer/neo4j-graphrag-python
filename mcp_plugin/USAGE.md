# Code Change Impact Analysis MCP Plugin - Usage Guide

## Quick Start

### 1. Installation

```bash
# Clone the repository
git clone https://github.com/XCTianer/neo4j-graphrag-python.git
cd neo4j-graphrag-python/mcp_plugin

# Run installation script
chmod +x install.sh
./install.sh
```

### 2. Configuration

Edit `config.yaml` with your settings:

```yaml
repository:
  url: "https://github.com/your-repo/your-project"
  analysis_days: 7

neo4j:
  uri: "bolt://localhost:7687"
  username: "neo4j"
  password: "your-password"

ollama:
  model: "llama3.2"
  base_url: "http://localhost:11434"
```

### 3. Testing

```bash
# Run tests
python3 test_plugin.py

# Run example client
python3 example_client.py
```

## MCP Server Usage

### Starting the Server

```bash
# Method 1: Direct execution
python3 mcp_plugin/server.py

# Method 2: Using the run script
python3 run_mcp_server.py

# Method 3: Using the entry point (if installed)
code-change-impact-mcp
```

### Server Communication

The server communicates via stdio using JSON-RPC 2.0. Send requests to stdin and receive responses from stdout.

## Available Methods

### 1. analyze_code_changes

Perform comprehensive code change analysis:

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "analyze_code_changes",
  "params": {
    "repo_url": "https://github.com/your-repo/your-project",
    "days": 7,
    "output_dir": "analysis_output",
    "detailed_chains": true,
    "show_chains": true
  }
}
```

**Response:**
```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "comprehensive_analysis": {
      "dependency_chains": [...],
      "commit_details": [...]
    },
    "reports": {
      "chain_report": "analysis_output/影响链路详细报告.md",
      "cypher_queries": "analysis_output/影响链路查询语句.cypher"
    }
  }
}
```

### 2. get_impact_chains

Get impact chains with optional filtering:

```json
{
  "jsonrpc": "2.0",
  "id": 2,
  "method": "get_impact_chains",
  "params": {
    "repo_url": "https://github.com/your-repo/your-project",
    "days": 7,
    "severity_filter": "HIGH"
  }
}
```

### 3. get_file_impact

Get file-level impact analysis:

```json
{
  "jsonrpc": "2.0",
  "id": 3,
  "method": "get_file_impact",
  "params": {
    "repo_url": "https://github.com/your-repo/your-project",
    "days": 7,
    "file_path": "src/main.py"
  }
}
```

### 4. get_commit_analysis

Get commit-specific analysis:

```json
{
  "jsonrpc": "2.0",
  "id": 4,
  "method": "get_commit_analysis",
  "params": {
    "repo_url": "https://github.com/your-repo/your-project",
    "days": 7,
    "commit_hash": "a1b2c3d4"
  }
}
```

### 5. get_neo4j_queries

Get generated Cypher queries:

```json
{
  "jsonrpc": "2.0",
  "id": 5,
  "method": "get_neo4j_queries",
  "params": {
    "repo_url": "https://github.com/your-repo/your-project",
    "days": 7
  }
}
```

### 6. get_analysis_config

Get current configuration:

```json
{
  "jsonrpc": "2.0",
  "id": 6,
  "method": "get_analysis_config",
  "params": {}
}
```

### 7. update_config

Update configuration:

```json
{
  "jsonrpc": "2.0",
  "id": 7,
  "method": "update_config",
  "params": {
    "config_updates": {
      "repository": {
        "analysis_days": 14
      },
      "analysis": {
        "max_impact_chains": 200
      }
    }
  }
}
```

## Integration Examples

### Claude Desktop

Add to your MCP configuration:

```json
{
  "mcpServers": {
    "code-change-impact": {
      "command": "python",
      "args": ["/path/to/neo4j-graphrag-python/mcp_plugin/server.py"],
      "env": {
        "PYTHONPATH": "/path/to/neo4j-graphrag-python"
      }
    }
  }
}
```

### Custom Client

```python
import asyncio
import json
from mcp_plugin.example_client import MCPClient

async def main():
    client = MCPClient()
    await client.start_server()
    
    # Analyze a repository
    result = await client.analyze_repository(
        "https://github.com/your-repo/your-project",
        days=7
    )
    
    print(f"Found {result['comprehensive_analysis']['dependency_chains']} impact chains")
    
    await client.stop_server()

asyncio.run(main())
```

## Output Files

The plugin generates several output files:

- **影响链路详细报告.md**: Detailed impact chain analysis
- **影响链路查询语句.cypher**: Cypher queries for Neo4j
- **代码变更记录影响范围分析报告.md**: Comprehensive analysis report
- **图形显示使用说明.md**: Visualization instructions

## Troubleshooting

### Common Issues

1. **Import Errors**
   - Ensure PYTHONPATH includes the project root
   - Install all dependencies: `pip install -r requirements.txt`

2. **Neo4j Connection**
   - Verify Neo4j is running
   - Check credentials in config.yaml
   - Test connection manually

3. **Repository Access**
   - Ensure repository URL is accessible
   - Check if repository has recent commits

4. **Ollama Issues**
   - Verify Ollama is running
   - Check model availability: `ollama list`
   - Test model: `ollama run llama3.2 "test"`

### Debug Mode

Enable debug logging in config.yaml:

```yaml
logging:
  level: "DEBUG"
  console: true
```

### Error Codes

- `-32700`: Parse error (invalid JSON)
- `-32600`: Invalid request
- `-32601`: Method not found
- `-32602`: Invalid params
- `-32603`: Internal error

## Performance Tips

1. **Limit Analysis Scope**
   - Reduce `analysis_days` for faster analysis
   - Use `max_impact_chains` to limit output

2. **Optimize Neo4j**
   - Use appropriate indexes
   - Monitor query performance

3. **Resource Management**
   - Close connections properly
   - Monitor memory usage for large repositories

## Support

- Check the main README.md for detailed documentation
- Review generated reports for analysis details
- Use the test suite to verify functionality
- Check logs for error details 