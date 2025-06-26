# Code Change Impact Analysis MCP Plugin

A Model Context Protocol (MCP) plugin for analyzing code change impact using Neo4j GraphRAG.

## Features

- **Comprehensive Code Change Analysis**: Analyze code changes in repositories and their impact on the codebase
- **Impact Chain Analysis**: Identify and analyze dependency chains between code components
- **File-level Impact Analysis**: Detailed analysis of how changes affect specific files
- **Commit Analysis**: Analyze individual commits and their impact
- **Neo4j Integration**: Generate Cypher queries for Neo4j database analysis
- **Configuration Management**: Dynamic configuration updates and validation

## Installation

1. Clone the repository:
```bash
git clone https://github.com/XCTianer/neo4j-graphrag-python.git
cd neo4j-graphrag-python
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Configure the plugin (see Configuration section below)

## Configuration

The plugin uses the configuration from the main project. Create a `config.yaml` file in the project root:

```yaml
repository:
  url: "https://github.com/your-repo/your-project"
  analysis_days: 7
  branch: "main"

neo4j:
  uri: "bolt://localhost:7687"
  username: "neo4j"
  password: "your-password"
  database: "neo4j"

ollama:
  model: "llama3.2"
  base_url: "http://localhost:11434"

analysis:
  output_dir: "analysis_output"
  max_impact_chains: 100
  chain_depth_limit: 10
```

## Usage

### Running the MCP Server

```bash
python mcp_plugin/server.py
```

### Available Methods

#### 1. analyze_code_changes

Perform comprehensive analysis of code changes:

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

#### 2. get_impact_chains

Get impact chains with optional severity filtering:

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

#### 3. get_file_impact

Get impact analysis for specific files:

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

#### 4. get_commit_analysis

Get analysis for specific commits:

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

#### 5. get_neo4j_queries

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

#### 6. get_analysis_config

Get current configuration:

```json
{
  "jsonrpc": "2.0",
  "id": 6,
  "method": "get_analysis_config",
  "params": {}
}
```

#### 7. update_config

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

## Response Format

All methods return responses in the following format:

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    // Method-specific result data
  }
}
```

Or in case of errors:

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "error": {
    "code": -32603,
    "message": "Internal error: Error description"
  }
}
```

## Integration with MCP Clients

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

### Other MCP Clients

The plugin follows the MCP specification and can be integrated with any MCP-compatible client. The server communicates via stdio using JSON-RPC 2.0.

## Output Files

The plugin generates several output files in the specified output directory:

- **影响链路详细报告.md**: Detailed impact chain analysis report
- **影响链路查询语句.cypher**: Cypher queries for Neo4j analysis
- **代码变更记录影响范围分析报告.md**: Comprehensive code change analysis report
- **图形显示使用说明.md**: Instructions for visualizing the analysis in Neo4j

## Dependencies

- Python 3.9+
- Neo4j GraphRAG
- Neo4j Python Driver
- PyYAML
- GitPython
- Other dependencies as specified in pyproject.toml

## Troubleshooting

### Common Issues

1. **Import Errors**: Ensure the PYTHONPATH includes the project root directory
2. **Neo4j Connection**: Verify Neo4j is running and credentials are correct
3. **Git Repository**: Ensure the repository URL is accessible and contains the expected data
4. **Configuration**: Validate configuration using the `get_analysis_config` method

### Logging

The plugin uses Python's logging module. Set the log level to DEBUG for detailed information:

```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the Apache License, Version 2.0.

## Support

For issues and questions:
- Create an issue on GitHub
- Check the documentation in the main project
- Review the analysis output files for detailed information 