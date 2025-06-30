#!/bin/bash

# Code Change Impact Analysis MCP Plugin Installation Script

set -e

echo "🚀 Installing Code Change Impact Analysis MCP Plugin..."
echo "=" * 50

# Check if Python 3.9+ is available
python_version=$(python3 --version 2>&1 | grep -oP '\d+\.\d+' | head -1)
required_version="3.9"

if [ "$(printf '%s\n' "$required_version" "$python_version" | sort -V | head -n1)" != "$required_version" ]; then
    echo "❌ Python 3.9 or higher is required. Found: $python_version"
    exit 1
fi

echo "✅ Python version: $python_version"

# Check if pip is available
if ! command -v pip3 &> /dev/null; then
    echo "❌ pip3 is not installed. Please install pip first."
    exit 1
fi

echo "✅ pip3 is available"

# Install dependencies
echo "📦 Installing dependencies..."
pip3 install -r requirements.txt

# Make scripts executable
echo "🔧 Making scripts executable..."
chmod +x run_mcp_server.py
chmod +x example_client.py
chmod +x test_plugin.py

# Create config file if it doesn't exist
if [ ! -f "config.yaml" ]; then
    echo "📝 Creating config.yaml from example..."
    cp config_example.yaml config.yaml
    echo "⚠️  Please edit config.yaml with your settings before using the plugin"
fi

# Create output directory
echo "📁 Creating output directory..."
mkdir -p analysis_output

echo "✅ Installation completed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Edit config.yaml with your Neo4j and repository settings"
echo "2. Test the plugin: python3 test_plugin.py"
echo "3. Run the server: python3 run_mcp_server.py"
echo "4. Try the example client: python3 example_client.py"
echo ""
echo "📚 For more information, see README.md" 