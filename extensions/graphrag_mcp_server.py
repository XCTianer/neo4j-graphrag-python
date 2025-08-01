#!/usr/bin/env python3
"""
GraphRAG MCP Server - 使用neo4j-graphrag库的智能影响链路分析MCP服务
提供基于GraphRAG的智能代码变更影响分析功能
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

# 导入GraphRAG分析器
from graphrag_chain_analyzer import GraphRAGChainAnalyzer

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

class GraphRAGMCPServer:
    """使用neo4j-graphrag库的智能影响链路分析MCP服务器"""
    
    def __init__(self):
        self.logger = logging.getLogger(__name__)
        self.initialized = False
        self.analyzer = GraphRAGChainAnalyzer()
        
        # 工具注册
        self.tools = {
            "graphrag_comprehensive_analysis": {
                "name": "graphrag_comprehensive_analysis",
                "description": "使用GraphRAG进行综合分析。输入为变更的文件、变量、函数等信息，工具会使用neo4j-graphrag库的Text2Cypher和Hybrid检索器进行智能分析，返回详细的影响链路分析结果，包括调用链、变量使用情况、文件依赖关系等。适用于需要深度分析代码变更影响的场景。",
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
            },
            "graphrag_smart_analysis": {
                "name": "graphrag_smart_analysis",
                "description": "使用GraphRAG进行智能问答分析。输入为自然语言问题，工具会使用GraphRAG的智能检索和生成功能，提供基于代码知识图谱的智能回答。适用于需要理解代码变更影响、依赖关系等复杂问题的场景。",
                "inputSchema": {
                    "type": "object",
                    "properties": {
                        "question": {
                            "type": "string",
                            "description": "关于代码变更影响的问题，例如：'如果修改了process_data函数，会对整个系统产生什么影响？'"
                        }
                    },
                    "required": ["question"]
                }
            },
            "graphrag_function_impact": {
                "name": "graphrag_function_impact",
                "description": "使用GraphRAG分析特定函数的变更影响。工具会使用Text2Cypher检索器找出所有调用该函数的代码，并分析影响链路。",
                "inputSchema": {
                    "type": "object",
                    "properties": {
                        "function_name": {
                            "type": "string",
                            "description": "要分析影响的函数名称"
                        }
                    },
                    "required": ["function_name"]
                }
            },
            "graphrag_variable_impact": {
                "name": "graphrag_variable_impact",
                "description": "使用GraphRAG分析特定变量的变更影响。工具会使用Hybrid检索器找出所有使用该变量的代码。",
                "inputSchema": {
                    "type": "object",
                    "properties": {
                        "variable_name": {
                            "type": "string",
                            "description": "要分析影响的变量名称"
                        }
                    },
                    "required": ["variable_name"]
                }
            },
            "graphrag_file_impact": {
                "name": "graphrag_file_impact",
                "description": "使用GraphRAG分析特定文件的变更影响。工具会分析文件中定义的所有实体及其被其他文件使用的情况。",
                "inputSchema": {
                    "type": "object",
                    "properties": {
                        "file_path": {
                            "type": "string",
                            "description": "要分析影响的文件路径"
                        }
                    },
                    "required": ["file_path"]
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
                "name": "graphrag-mcp-server",
                "version": "1.0.0",
                "description": "基于GraphRAG的智能影响链路分析MCP工具"
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

    async def execute_graphrag_comprehensive_analysis(self, **kwargs) -> str:
        """执行GraphRAG综合分析"""
        try:
            # 调用分析器获取综合分析结果
            chain_result = self.analyzer.get_comprehensive_chain(kwargs)
            
            # 构建返回结果
            result = {
                "analysis_type": "graphrag_comprehensive",
                "chain": chain_result,
                "analysis_time": datetime.now().isoformat(),
                "input_parameters": kwargs,
                "summary": {
                    "total_impacts": len(chain_result),
                    "function_impacts": len([r for r in chain_result if 'function' in r]),
                    "variable_impacts": len([r for r in chain_result if 'variable' in r]),
                    "file_impacts": len([r for r in chain_result if 'file' in r])
                }
            }
            
            result_json = json.dumps(result, ensure_ascii=False, indent=2)
            
            # 保存结果到文件
            try:
                timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
                filename = f"graphrag_comprehensive_analysis_{timestamp}.json"
                filepath = os.path.join("/home/kotei/work/neo4j-graphrag-python", filename)
                
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(result_json)
                
                self.logger.info(f"综合分析结果已保存到: {filepath}")
                
                # 在返回结果中添加文件保存信息
                result["file_saved"] = {
                    "path": filepath,
                    "filename": filename,
                    "timestamp": timestamp
                }
                
                return json.dumps(result, ensure_ascii=False, indent=2)
                
            except Exception as e:
                self.logger.error(f"保存分析结果到文件时出错: {e}")
                return result_json
                
        except Exception as e:
            self.logger.error(f"执行GraphRAG综合分析失败: {e}")
            error_result = {
                "error": str(e),
                "analysis_time": datetime.now().isoformat(),
                "input_parameters": kwargs
            }
            return json.dumps(error_result, ensure_ascii=False, indent=2)

    async def execute_graphrag_smart_analysis(self, **kwargs) -> str:
        """执行GraphRAG智能分析"""
        try:
            question = kwargs.get('question', '')
            if not question:
                return json.dumps({"error": "问题不能为空"}, ensure_ascii=False, indent=2)
            
            # 调用分析器进行智能分析
            smart_result = self.analyzer.get_smart_analysis(question)
            
            # 构建返回结果
            result = {
                "analysis_type": "graphrag_smart_analysis",
                "question": question,
                "answer": smart_result.get('answer', ''),
                "context": smart_result.get('context', []),
                "metadata": smart_result.get('metadata', {}),
                "analysis_time": datetime.now().isoformat()
            }
            
            result_json = json.dumps(result, ensure_ascii=False, indent=2)
            
            # 保存结果到文件
            try:
                timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
                filename = f"graphrag_smart_analysis_{timestamp}.json"
                filepath = os.path.join("/home/kotei/work/neo4j-graphrag-python", filename)
                
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(result_json)
                
                self.logger.info(f"智能分析结果已保存到: {filepath}")
                
                result["file_saved"] = {
                    "path": filepath,
                    "filename": filename,
                    "timestamp": timestamp
                }
                
                return json.dumps(result, ensure_ascii=False, indent=2)
                
            except Exception as e:
                self.logger.error(f"保存分析结果到文件时出错: {e}")
                return result_json
                
        except Exception as e:
            self.logger.error(f"执行GraphRAG智能分析失败: {e}")
            error_result = {
                "error": str(e),
                "analysis_time": datetime.now().isoformat(),
                "input_parameters": kwargs
            }
            return json.dumps(error_result, ensure_ascii=False, indent=2)

    async def execute_graphrag_function_impact(self, **kwargs) -> str:
        """执行函数影响分析"""
        try:
            function_name = kwargs.get('function_name', '')
            if not function_name:
                return json.dumps({"error": "函数名称不能为空"}, ensure_ascii=False, indent=2)
            
            # 调用分析器分析函数影响
            impact_result = self.analyzer.analyze_function_impact(function_name)
            
            result = {
                "analysis_type": "graphrag_function_impact",
                "function_name": function_name,
                "impact_result": impact_result,
                "analysis_time": datetime.now().isoformat()
            }
            
            result_json = json.dumps(result, ensure_ascii=False, indent=2)
            
            # 保存结果到文件
            try:
                timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
                filename = f"graphrag_function_impact_{function_name}_{timestamp}.json"
                filepath = os.path.join("/home/kotei/work/neo4j-graphrag-python", filename)
                
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(result_json)
                
                self.logger.info(f"函数影响分析结果已保存到: {filepath}")
                
                result["file_saved"] = {
                    "path": filepath,
                    "filename": filename,
                    "timestamp": timestamp
                }
                
                return json.dumps(result, ensure_ascii=False, indent=2)
                
            except Exception as e:
                self.logger.error(f"保存分析结果到文件时出错: {e}")
                return result_json
                
        except Exception as e:
            self.logger.error(f"执行函数影响分析失败: {e}")
            error_result = {
                "error": str(e),
                "analysis_time": datetime.now().isoformat(),
                "input_parameters": kwargs
            }
            return json.dumps(error_result, ensure_ascii=False, indent=2)

    async def execute_graphrag_variable_impact(self, **kwargs) -> str:
        """执行变量影响分析"""
        try:
            variable_name = kwargs.get('variable_name', '')
            if not variable_name:
                return json.dumps({"error": "变量名称不能为空"}, ensure_ascii=False, indent=2)
            
            # 调用分析器分析变量影响
            impact_result = self.analyzer.analyze_variable_impact(variable_name)
            
            result = {
                "analysis_type": "graphrag_variable_impact",
                "variable_name": variable_name,
                "impact_result": impact_result,
                "analysis_time": datetime.now().isoformat()
            }
            
            result_json = json.dumps(result, ensure_ascii=False, indent=2)
            
            # 保存结果到文件
            try:
                timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
                filename = f"graphrag_variable_impact_{variable_name}_{timestamp}.json"
                filepath = os.path.join("/home/kotei/work/neo4j-graphrag-python", filename)
                
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(result_json)
                
                self.logger.info(f"变量影响分析结果已保存到: {filepath}")
                
                result["file_saved"] = {
                    "path": filepath,
                    "filename": filename,
                    "timestamp": timestamp
                }
                
                return json.dumps(result, ensure_ascii=False, indent=2)
                
            except Exception as e:
                self.logger.error(f"保存分析结果到文件时出错: {e}")
                return result_json
                
        except Exception as e:
            self.logger.error(f"执行变量影响分析失败: {e}")
            error_result = {
                "error": str(e),
                "analysis_time": datetime.now().isoformat(),
                "input_parameters": kwargs
            }
            return json.dumps(error_result, ensure_ascii=False, indent=2)

    async def execute_graphrag_file_impact(self, **kwargs) -> str:
        """执行文件影响分析"""
        try:
            file_path = kwargs.get('file_path', '')
            if not file_path:
                return json.dumps({"error": "文件路径不能为空"}, ensure_ascii=False, indent=2)
            
            # 调用分析器分析文件影响
            impact_result = self.analyzer.analyze_file_impact(file_path)
            
            result = {
                "analysis_type": "graphrag_file_impact",
                "file_path": file_path,
                "impact_result": impact_result,
                "analysis_time": datetime.now().isoformat()
            }
            
            result_json = json.dumps(result, ensure_ascii=False, indent=2)
            
            # 保存结果到文件
            try:
                timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
                safe_filename = file_path.replace('/', '_').replace('\\', '_')
                filename = f"graphrag_file_impact_{safe_filename}_{timestamp}.json"
                filepath = os.path.join("/home/kotei/work/neo4j-graphrag-python", filename)
                
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(result_json)
                
                self.logger.info(f"文件影响分析结果已保存到: {filepath}")
                
                result["file_saved"] = {
                    "path": filepath,
                    "filename": filename,
                    "timestamp": timestamp
                }
                
                return json.dumps(result, ensure_ascii=False, indent=2)
                
            except Exception as e:
                self.logger.error(f"保存分析结果到文件时出错: {e}")
                return result_json
                
        except Exception as e:
            self.logger.error(f"执行文件影响分析失败: {e}")
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
            if tool_name == 'graphrag_comprehensive_analysis':
                result_text = await self.execute_graphrag_comprehensive_analysis(**arguments)
            elif tool_name == 'graphrag_smart_analysis':
                result_text = await self.execute_graphrag_smart_analysis(**arguments)
            elif tool_name == 'graphrag_function_impact':
                result_text = await self.execute_graphrag_function_impact(**arguments)
            elif tool_name == 'graphrag_variable_impact':
                result_text = await self.execute_graphrag_variable_impact(**arguments)
            elif tool_name == 'graphrag_file_impact':
                result_text = await self.execute_graphrag_file_impact(**arguments)
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
        
        self.logger.info("启动GraphRAG MCP工具服务器")
        
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
    
    server = GraphRAGMCPServer()
    await server.run_server()

if __name__ == "__main__":
    asyncio.run(main()) 