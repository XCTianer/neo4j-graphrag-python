#!/usr/bin/env python3
"""
Tests for the Code Change Impact Analysis MCP Plugin
"""

import asyncio
import json
import pytest
import tempfile
import os
from unittest.mock import Mock, patch, AsyncMock
from pathlib import Path

# Add the parent directory to the path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent))

from mcp_plugin.plugin import CodeChangeImpactPlugin
from mcp_plugin.server import MCPServer

class TestCodeChangeImpactPlugin:
    """Test cases for the CodeChangeImpactPlugin class"""
    
    @pytest.fixture
    def plugin(self):
        """Create a plugin instance for testing"""
        return CodeChangeImpactPlugin()
    
    @pytest.fixture
    def mock_config(self):
        """Mock configuration for testing"""
        return {
            "repository": {
                "url": "https://github.com/test/repo",
                "analysis_days": 7,
                "branch": "main"
            },
            "neo4j": {
                "uri": "bolt://localhost:7687",
                "username": "neo4j",
                "password": "test",
                "database": "neo4j"
            },
            "ollama": {
                "model": "llama3.2",
                "base_url": "http://localhost:11434"
            },
            "analysis": {
                "output_dir": "test_output",
                "max_impact_chains": 100,
                "chain_depth_limit": 10
            }
        }
    
    @pytest.mark.asyncio
    async def test_plugin_initialization(self, plugin):
        """Test plugin initialization"""
        assert plugin is not None
        assert plugin.config is not None
        assert plugin.logger is not None
    
    @pytest.mark.asyncio
    async def test_analyze_code_changes_success(self, plugin, mock_config):
        """Test successful code change analysis"""
        with patch('mcp_plugin.plugin.validate_config', return_value=True), \
             patch('mcp_plugin.plugin.run_analysis') as mock_run_analysis:
            
            # Mock successful analysis result
            mock_run_analysis.return_value = {
                'comprehensive_analysis': {
                    'dependency_chains': [
                        {
                            'chain_id': 'test_chain_1',
                            'severity': 'HIGH',
                            'source_entity': 'test_source',
                            'target_entity': 'test_target'
                        }
                    ]
                }
            }
            
            result = await plugin.analyze_code_changes(
                repo_url="https://github.com/test/repo",
                days=7
            )
            
            assert 'error' not in result
            assert 'comprehensive_analysis' in result
            assert len(result['comprehensive_analysis']['dependency_chains']) == 1
    
    @pytest.mark.asyncio
    async def test_analyze_code_changes_config_validation_failure(self, plugin):
        """Test code change analysis with config validation failure"""
        with patch('mcp_plugin.plugin.validate_config', return_value=False):
            result = await plugin.analyze_code_changes()
            
            assert 'error' in result
            assert result['error'] == "Configuration validation failed"
    
    @pytest.mark.asyncio
    async def test_get_impact_chains(self, plugin):
        """Test getting impact chains"""
        with patch.object(plugin, 'analyze_code_changes') as mock_analyze:
            mock_analyze.return_value = {
                'comprehensive_analysis': {
                    'dependency_chains': [
                        {'severity': 'HIGH', 'chain_id': 'chain1'},
                        {'severity': 'MEDIUM', 'chain_id': 'chain2'},
                        {'severity': 'LOW', 'chain_id': 'chain3'}
                    ]
                }
            }
            
            result = await plugin.get_impact_chains(
                repo_url="https://github.com/test/repo",
                severity_filter="HIGH"
            )
            
            assert 'error' not in result
            assert result['total_chains'] == 1
            assert result['summary']['high_risk'] == 1
    
    @pytest.mark.asyncio
    async def test_get_file_impact(self, plugin):
        """Test getting file impact analysis"""
        with patch.object(plugin, 'analyze_code_changes') as mock_analyze:
            mock_analyze.return_value = {
                'comprehensive_analysis': {
                    'commit_details': [
                        {
                            'file_analyses': [
                                {
                                    'file_path': 'test/file.py',
                                    'status': 'modified',
                                    'entities': [],
                                    'relationships': []
                                }
                            ]
                        }
                    ]
                }
            }
            
            result = await plugin.get_file_impact(
                repo_url="https://github.com/test/repo",
                file_path="test/file.py"
            )
            
            assert 'error' not in result
            assert result['total_files'] == 1
            assert result['files'][0]['file_path'] == 'test/file.py'
    
    @pytest.mark.asyncio
    async def test_get_commit_analysis(self, plugin):
        """Test getting commit analysis"""
        with patch.object(plugin, 'analyze_code_changes') as mock_analyze:
            mock_analyze.return_value = {
                'comprehensive_analysis': {
                    'commit_details': [
                        {
                            'commit': {
                                'hash': 'a1b2c3d4',
                                'message': 'Test commit'
                            }
                        }
                    ]
                }
            }
            
            result = await plugin.get_commit_analysis(
                repo_url="https://github.com/test/repo",
                commit_hash="a1b2"
            )
            
            assert 'error' not in result
            assert result['total_commits'] == 1
            assert result['commits'][0]['commit']['hash'] == 'a1b2c3d4'
    
    @pytest.mark.asyncio
    async def test_get_analysis_config(self, plugin):
        """Test getting analysis configuration"""
        with patch('mcp_plugin.plugin.validate_config', return_value=True):
            result = await plugin.get_analysis_config()
            
            assert 'config' in result
            assert 'is_valid' in result
            assert result['is_valid'] is True
    
    @pytest.mark.asyncio
    async def test_update_config(self, plugin):
        """Test updating configuration"""
        config_updates = {
            'repository': {'analysis_days': 14},
            'analysis': {'max_impact_chains': 200}
        }
        
        with patch('mcp_plugin.plugin.validate_config', return_value=True):
            result = await plugin.update_config(config_updates)
            
            assert 'config' in result
            assert 'is_valid' in result
            assert result['is_valid'] is True
            assert result['config']['repository']['analysis_days'] == 14
            assert result['config']['analysis']['max_impact_chains'] == 200

class TestMCPServer:
    """Test cases for the MCPServer class"""
    
    @pytest.fixture
    def server(self):
        """Create a server instance for testing"""
        return MCPServer()
    
    @pytest.mark.asyncio
    async def test_server_initialization(self, server):
        """Test server initialization"""
        assert server is not None
        assert server.plugin is not None
        assert server.logger is not None
    
    @pytest.mark.asyncio
    async def test_handle_request_analyze_code_changes(self, server):
        """Test handling analyze_code_changes request"""
        request = {
            "jsonrpc": "2.0",
            "id": 1,
            "method": "analyze_code_changes",
            "params": {
                "repo_url": "https://github.com/test/repo",
                "days": 7
            }
        }
        
        with patch.object(server.plugin, 'analyze_code_changes') as mock_analyze:
            mock_analyze.return_value = {'comprehensive_analysis': {}}
            
            response = await server.handle_request(request)
            
            assert response['jsonrpc'] == '2.0'
            assert response['id'] == 1
            assert 'result' in response
            assert 'error' not in response
    
    @pytest.mark.asyncio
    async def test_handle_request_unknown_method(self, server):
        """Test handling unknown method request"""
        request = {
            "jsonrpc": "2.0",
            "id": 1,
            "method": "unknown_method",
            "params": {}
        }
        
        response = await server.handle_request(request)
        
        assert response['jsonrpc'] == '2.0'
        assert response['id'] == 1
        assert 'error' in response
        assert 'Unknown method: unknown_method' in response['error']['message']
    
    @pytest.mark.asyncio
    async def test_handle_request_exception(self, server):
        """Test handling request with exception"""
        request = {
            "jsonrpc": "2.0",
            "id": 1,
            "method": "analyze_code_changes",
            "params": {}
        }
        
        with patch.object(server.plugin, 'analyze_code_changes', side_effect=Exception("Test error")):
            response = await server.handle_request(request)
            
            assert response['jsonrpc'] == '2.0'
            assert response['id'] == 1
            assert 'error' in response
            assert response['error']['code'] == -32603
            assert 'Test error' in response['error']['message']
    
    @pytest.mark.asyncio
    async def test_handle_batch_request(self, server):
        """Test handling batch request"""
        requests = [
            {
                "jsonrpc": "2.0",
                "id": 1,
                "method": "get_analysis_config",
                "params": {}
            },
            {
                "jsonrpc": "2.0",
                "id": 2,
                "method": "get_analysis_config",
                "params": {}
            }
        ]
        
        with patch.object(server.plugin, 'get_analysis_config') as mock_config:
            mock_config.return_value = {'config': {}, 'is_valid': True}
            
            responses = await server.handle_batch_request(requests)
            
            assert len(responses) == 2
            assert responses[0]['id'] == 1
            assert responses[1]['id'] == 2
            assert 'result' in responses[0]
            assert 'result' in responses[1]

@pytest.mark.asyncio
async def test_plugin_integration():
    """Integration test for the plugin"""
    plugin = CodeChangeImpactPlugin()
    
    # Test that the plugin can be created and basic methods work
    assert plugin is not None
    
    # Test configuration retrieval
    config_result = await plugin.get_analysis_config()
    assert 'config' in config_result
    assert 'is_valid' in config_result

if __name__ == "__main__":
    # Run tests
    pytest.main([__file__, "-v"]) 