#!/usr/bin/env python3
"""
MCP Chain Only Server - 标准MCP协议的影响链路分析工具服务
基于chain_only.py，输出最简洁的影响链路，没有任何额外信息
"""

import asyncio
import json
import logging
import sys
import os
from datetime import datetime
from typing import Any, Dict, Optional, List
from neo4j import GraphDatabase
import uuid

# ========== 标准化MCP响应的工具函数 ==========
def build_mcp_response(result: Any = None, id_value: Any = None, method_value: Any = None, error: dict = None) -> dict:
    """
    构建符合Gemini CLI schema要求的MCP响应对象
    :param result: 业务数据（可为None）
    :param id_value: 响应ID，必须为字符串或数字，不能为None/null
    :param method_value: 方法名，必须为字符串，不能为None
    :param error: 错误对象（可为None）
    :return: dict
    """
    # id字段校验：若id_value为None，自动生成唯一字符串，防止为null
    if id_value is None:
        id_value = str(uuid.uuid4())
        logging.getLogger(__name__).warning(f"MCP响应id字段为None，已自动生成唯一id: {id_value}")
    elif not isinstance(id_value, (str, int)):
        id_value = str(id_value)
    # method字段校验
    if not isinstance(method_value, str) or not method_value:
        method_value = "default_method"
    # 构建标准响应
    resp = {
        "jsonrpc": "2.0",
        "id": id_value,
    }
    if error is not None:
        resp["error"] = error
    else:
        resp["result"] = result
    return resp

class ChainOnlyAnalyzer:
    """极简影响链路分析器 - 只输出最简洁的影响链路"""
    
    def __init__(self, neo4j_uri: str = "bolt://localhost:7687",
                 username: str = "neo4j", password: str = "password"):
        self.driver = GraphDatabase.driver(neo4j_uri, auth=(username, password))
        self.logger = logging.getLogger(__name__)
    
    def get_chain(self, changes: Dict[str, Any]) -> List[Dict[str, Any]]:
        """获取最简洁的影响链路"""
        try:
            chain = []
            
            # 函数变更影响
            if changes.get('changed_functions'):
                for func in changes['changed_functions']:
                    callers = self._get_callers(func)
                    if callers:
                        chain.append({
                            'function': func,
                            'affected': callers
                        })
            
            # 变量变更影响
            if changes.get('changed_variables'):
                for var in changes['changed_variables']:
                    users = self._get_users(var)
                    if users:
                        chain.append({
                            'variable': var,
                            'affected': users
                        })
            
            # 文件变更影响
            if changes.get('modified_files'):
                for file_path in changes['modified_files']:
                    entities = self._get_entities(file_path)
                    if entities:
                        chain.append({
                            'file': file_path,
                            'affected': entities
                        })
            
            return chain
            
        except Exception as e:
            self.logger.error(f"获取链路失败: {e}")
            return []
    
    def _get_callers(self, function_name: str) -> List[str]:
        """获取函数调用者"""
        try:
            with self.driver.session() as session:
                result = session.run("""
                    MATCH (caller:Function)-[:CALLS]->(target:Function {name: $name})
                    RETURN DISTINCT caller.name as name
                    """, name=function_name)
                return [record['name'] for record in result]
        except Exception as e:
            self.logger.error(f"获取函数调用者失败: {e}")
            return []
    
    def _get_users(self, variable_name: str) -> List[str]:
        """获取变量使用者"""
        try:
            with self.driver.session() as session:
                result = session.run("""
                    MATCH (user)-[:USES]->(var:Variable {name: $name})
                    RETURN DISTINCT user.name as name, labels(user)[0] as type
                    """, name=variable_name)
                return [f"{record['type']}:{record['name']}" for record in result]
        except Exception as e:
            self.logger.error(f"获取变量使用者失败: {e}")
            return []
    
    def _get_entities(self, file_path: str) -> List[str]:
        """获取文件实体"""
        try:
            with self.driver.session() as session:
                result = session.run("""
                    MATCH (entity)
                    WHERE entity.file_path CONTAINS $path
                    RETURN DISTINCT entity.name as name, labels(entity)[0] as type
                    """, path=file_path)
                return [f"{record['type']}:{record['name']}" for record in result]
        except Exception as e:
            self.logger.error(f"获取文件实体失败: {e}")
            return []
    
    def __del__(self):
        """清理资源"""
        if hasattr(self, 'driver'):
            self.driver.close()

class MCPChainOnlyServer:
    """标准MCP协议的影响链路分析工具服务器"""
    
    def __init__(self):
        self.logger = logging.getLogger(__name__)
        self.initialized = False
        self.analyzer = ChainOnlyAnalyzer()
        
        # 工具注册
        self.tools = {
            "chain_only_analyze": {
                "name": "chain_only_analyze",
                "description": "极简代码变更影响链路分析工具。输入为变更的文件、变量、函数等信息，工具会在Neo4j代码知识图谱中检索所有直接受影响的代码实体，返回最简洁的影响链路，不包含任何汇总、统计或其他额外信息。适用于需要快速获取变更影响链路的场景。",
                "inputSchema": {
                    "type": "object",
                    "properties": {
                        "modified_files": {
                            "type": "array", 
                            "items": {"type": "string"},
                            "description": "修改的文件路径列表"
                        },
                        "changed_variables": {
                            "type": "array", 
                            "items": {"type": "string"},
                            "description": "变更的变量名称列表"
                        },
                        "changed_functions": {
                            "type": "array", 
                            "items": {"type": "string"},
                            "description": "变更的函数名称列表"
                        }
                    },
                    "required": []
                }
            }
        }

    async def handle_initialize(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """处理初始化请求"""
        self.logger.info("处理初始化请求")
        request_id = request.get('id')
        response = {
            "protocolVersion": "2024-11-05",
            "capabilities": {"tools": {}, "experimental": {}},
            "serverInfo": {
                "name": "mcp-chain-only-server",
                "version": "1.0.0",
                "description": "极简影响链路分析MCP工具"
            }
        }
        self.initialized = True
        return build_mcp_response(result=response, id_value=request_id, method_value="initialize")

    async def handle_tools_list(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """处理工具列表请求"""
        request_id = request.get('id')
        tools_list = []
        for tool_name, tool_def in self.tools.items():
            tools_list.append({
                "name": tool_def["name"],
                "description": tool_def["description"],
                "inputSchema": tool_def["inputSchema"]
            })
        result = {"tools": tools_list}
        return build_mcp_response(result=result, id_value=request_id, method_value="tools/list")

    async def execute_chain_only_analyze(self, **kwargs) -> str:
        """执行极简影响链路分析工具"""
        try:
            # 调用分析器获取最简洁的影响链路
            chain_result = self.analyzer.get_chain(kwargs)
            
            # 构建返回结果
            result = {
                "chain": chain_result,
                "analysis_time": datetime.now().isoformat(),
                "input_parameters": kwargs
            }
            
            result_json = json.dumps(result, ensure_ascii=False, indent=2)
            
            # 保存结果到文件（可选）
            try:
                timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
                filename = f"chain_only_analysis_{timestamp}.json"
                filepath = os.path.join("/home/kotei/work/neo4j-graphrag-python", filename)
                
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(result_json)
                
                self.logger.info(f"分析结果已保存到: {filepath}")
                
                # 在返回结果中添加文件保存信息
                result_with_file_info = {
                    "chain": chain_result,
                    "analysis_time": datetime.now().isoformat(),
                    "input_parameters": kwargs,
                    "file_saved": {
                        "path": filepath,
                        "filename": filename,
                        "timestamp": timestamp
                    }
                }
                
                return json.dumps(result_with_file_info, ensure_ascii=False, indent=2)
                
            except Exception as e:
                self.logger.error(f"保存分析结果到文件时出错: {e}")
                # 即使保存失败，也返回原始结果
                return result_json
                
        except Exception as e:
            self.logger.error(f"执行影响链路分析失败: {e}")
            error_result = {
                "error": str(e),
                "analysis_time": datetime.now().isoformat(),
                "input_parameters": kwargs
            }
            return json.dumps(error_result, ensure_ascii=False, indent=2)

    async def handle_tools_call(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """处理工具调用请求"""
        request_id = request.get('id')
        params = request.get('params', {})
        tool_name = params.get('name')
        arguments = params.get('arguments', {})
        
        try:
            if tool_name == 'chain_only_analyze':
                result_text = await self.execute_chain_only_analyze(**arguments)
            else:
                result_text = f"错误: 未知工具 '{tool_name}'"
            
            result = {
                "content": [{"type": "text", "text": result_text}],
                "isError": False
            }
            return build_mcp_response(result=result, id_value=request_id, method_value="tools/call")
            
        except Exception as e:
            error = {"code": -32001, "message": f"工具执行错误: {str(e)}"}
            return build_mcp_response(id_value=request_id, method_value="tools/call", error=error)

    async def handle_initialized(self, request: Dict[str, Any]) -> None:
        """处理初始化完成通知"""
        self.logger.info("处理初始化完成通知 (notifications/initialized)")
        # 通知不返回响应

    async def handle_request(self, request: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """处理MCP请求"""
        method = request.get('method', '')
        request_id = request.get('id')
        if request_id is None:
            request_id = 1
        
        self.logger.info(f"处理请求: {method}")
        
        try:
            # 初始化请求
            if method == 'initialize':
                return await self.handle_initialize({**request, 'id': request_id})
            
            # 检查是否已初始化
            if not self.initialized and method != 'initialize':
                error = {"code": -32002, "message": "Server not initialized"}
                return build_mcp_response(id_value=request_id, method_value=method, error=error)
            
            # 处理初始化完成通知
            if method == 'notifications/initialized':
                await self.handle_initialized(request)
                return None  # 通知不返回响应
            
            # 工具列表
            if method == 'tools/list':
                return await self.handle_tools_list({**request, 'id': request_id})
            
            # 工具调用
            elif method == 'tools/call':
                return await self.handle_tools_call({**request, 'id': request_id})
            
            # 未知方法
            else:
                error = {"code": -32601, "message": f"Method not found: {method}"}
                return build_mcp_response(id_value=request_id, method_value=method, error=error)
                
        except Exception as e:
            self.logger.error(f"处理请求时出错: {e}")
            error = {"code": -32603, "message": f"Internal error: {str(e)}"}
            return build_mcp_response(id_value=request_id, method_value=method, error=error)

    async def run_server(self, input_stream=None, output_stream=None):
        """运行MCP服务器"""
        if input_stream is None:
            input_stream = sys.stdin
        if output_stream is None:
            output_stream = sys.stdout
        
        self.logger.info("启动MCP Chain Only工具服务器")
        
        while True:
            try:
                line = await asyncio.get_event_loop().run_in_executor(None, input_stream.readline)
                if not line:
                    break
                
                request = json.loads(line.strip())
                response = await self.handle_request(request)
                
                if response is not None:
                    response_line = json.dumps(response) + '\n'
                    await asyncio.get_event_loop().run_in_executor(None, output_stream.write, response_line)
                    await asyncio.get_event_loop().run_in_executor(None, output_stream.flush)
                    
            except json.JSONDecodeError as e:
                self.logger.error(f"JSON解析错误: {e}")
                error_response = build_mcp_response(id_value=None, method_value="", error={"code": -32700, "message": "Parse error"})
                error_line = json.dumps(error_response) + '\n'
                await asyncio.get_event_loop().run_in_executor(None, output_stream.write, error_line)
                await asyncio.get_event_loop().run_in_executor(None, output_stream.flush)
                
            except Exception as e:
                self.logger.error(f"服务器错误: {e}")
                break

async def main():
    """主入口点"""
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        stream=sys.stderr
    )
    
    server = MCPChainOnlyServer()
    await server.run_server()

if __name__ == "__main__":
    asyncio.run(main()) 