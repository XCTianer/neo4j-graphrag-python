#!/usr/bin/env python3
"""
Run script for code change analysis with enhanced impact chain analysis.
"""

import asyncio
import logging
import os
import sys
import argparse
import json
from pathlib import Path
from datetime import datetime

# Add the current directory to the path
sys.path.insert(0, str(Path(__file__).parent))

from config import validate_config, print_config, get_config
from main_analyzer import main as run_analysis

def setup_logging(log_level: str = "INFO", log_file: str = "code_change_analysis.log"):
    """Setup logging configuration."""
    logging.basicConfig(
        level=getattr(logging, log_level.upper()),
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        handlers=[
            logging.FileHandler(log_file),
            logging.StreamHandler()
        ]
    )

def check_environment():
    """Check if the environment is properly configured."""
    config = get_config()
    required_env = config["environment"]["required_env"]
    
    current_env = os.environ.get('CONDA_DEFAULT_ENV')
    if current_env != required_env:
        print(f"⚠️  Warning: Current conda environment is '{current_env}', but '{required_env}' is recommended")
        print(f"   To activate the correct environment, run: conda activate {required_env}")
        response = input("   Continue anyway? (y/N): ")
        if response.lower() != 'y':
            print("Analysis cancelled.")
            sys.exit(1)
    else:
        print(f"✅ Running in correct conda environment: {current_env}")

def check_dependencies():
    """Check if required dependencies are available."""
    try:
        import neo4j
        print("✅ Neo4j driver available")
    except ImportError:
        print("❌ Neo4j driver not found. Please install: pip install neo4j")
        return False
    
    try:
        from neo4j_graphrag import __version__
        print(f"✅ Neo4j GraphRAG available (version: {__version__})")
    except ImportError:
        print("❌ Neo4j GraphRAG not found. Please install the package")
        return False
    
    return True

def print_impact_chain_summary(comprehensive_analysis):
    """Print detailed impact chain summary."""
    print("\n" + "="*80)
    print("🔗 影响链路分析结果")
    print("="*80)
    
    dependency_chains = comprehensive_analysis.get('dependency_chains', [])
    
    if not dependency_chains:
        print("❌ 未找到影响链路")
        return
    
    print(f"📊 总共发现 {len(dependency_chains)} 条影响链路")
    
    # 按严重程度分组
    high_severity = [chain for chain in dependency_chains if chain.get('severity') == 'HIGH']
    medium_severity = [chain for chain in dependency_chains if chain.get('severity') == 'MEDIUM']
    low_severity = [chain for chain in dependency_chains if chain.get('severity') == 'LOW']
    
    print(f"🔴 高风险链路: {len(high_severity)} 条")
    print(f"🟡 中风险链路: {len(medium_severity)} 条")
    print(f"🟢 低风险链路: {len(low_severity)} 条")
    
    # 显示前10条最重要的链路
    print(f"\n📋 前10条重要影响链路:")
    print("-" * 80)
    
    for i, chain in enumerate(dependency_chains[:10], 1):
        severity_icon = {"HIGH": "🔴", "MEDIUM": "🟡", "LOW": "🟢"}.get(chain.get('severity'), "⚪")
        direction_icon = {"downstream": "⬇️", "upstream": "⬆️"}.get(chain.get('direction'), "↔️")
        
        print(f"{i:2d}. {severity_icon} {direction_icon} {chain.get('source_entity', 'unknown')} → {chain.get('target_entity', 'unknown')}")
        print(f"    链路类型: {chain.get('chain_type', 'unknown')}")
        print(f"    路径长度: {chain.get('path_length', 0)}")
        print(f"    严重程度: {chain.get('severity', 'unknown')}")
        
        # 显示路径中的关键节点
        path_nodes = chain.get('path_nodes', [])
        if path_nodes:
            print(f"    路径节点: {' → '.join([node.get('name', 'unknown') for node in path_nodes[:5]])}")
            if len(path_nodes) > 5:
                print(f"              ... 还有 {len(path_nodes) - 5} 个节点")
        
        # 显示关系类型
        relationships = chain.get('relationships', [])
        if relationships:
            rel_types = [rel.get('type', 'unknown') for rel in relationships]
            print(f"    关系类型: {', '.join(set(rel_types))}")
        
        print()

def print_file_impact_details(comprehensive_analysis):
    """Print detailed file impact information."""
    print("\n" + "="*80)
    print("📄 文件变更影响详情")
    print("="*80)
    
    commit_details = comprehensive_analysis.get('commit_details', [])
    
    for commit_idx, commit_analysis in enumerate(commit_details, 1):
        commit = commit_analysis.get('commit', {})
        file_analyses = commit_analysis.get('file_analyses', [])
        
        print(f"\n📝 提交 {commit_idx}: {commit.get('message', 'Unknown')}")
        print(f"   哈希: {commit.get('hash', '')[:8]}")
        print(f"   作者: {commit.get('author_name', 'Unknown')}")
        print(f"   时间: {commit.get('date', 'Unknown')}")
        
        for file_idx, file_analysis in enumerate(file_analyses, 1):
            file_path = file_analysis.get('file_path', 'Unknown')
            entities = file_analysis.get('entities', [])
            relationships = file_analysis.get('relationships', [])
            
            print(f"\n   📁 文件 {file_idx}: {file_path}")
            print(f"      状态: {file_analysis.get('status', 'Unknown')}")
            print(f"      实体数量: {len(entities)}")
            print(f"      关系数量: {len(relationships)}")
            
            if entities:
                print(f"      实体详情:")
                for entity in entities:
                    entity_type = entity.get('type', 'Unknown')
                    entity_name = entity.get('name', 'Unknown')
                    print(f"        - {entity_type}: {entity_name}")
            
            if relationships:
                print(f"      关系详情:")
                for rel in relationships[:5]:  # 只显示前5个关系
                    rel_type = rel.get('type', 'Unknown')
                    source = rel.get('source_name', 'Unknown')
                    target = rel.get('target_name', 'Unknown')
                    print(f"        - {source} --[{rel_type}]--> {target}")
                
                if len(relationships) > 5:
                    print(f"        ... 还有 {len(relationships) - 5} 个关系")

def generate_impact_chain_report(comprehensive_analysis, output_dir):
    """Generate detailed impact chain report."""
    report_path = Path(output_dir) / "影响链路详细报告.md"
    
    with open(report_path, 'w', encoding='utf-8') as f:
        f.write("# 代码变更影响链路详细报告\n\n")
        f.write(f"生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        
        # 总体统计
        dependency_chains = comprehensive_analysis.get('dependency_chains', [])
        f.write("## 总体统计\n\n")
        f.write(f"- 总链路数: {len(dependency_chains)}\n")
        
        # 按严重程度统计
        high_severity = [chain for chain in dependency_chains if chain.get('severity') == 'HIGH']
        medium_severity = [chain for chain in dependency_chains if chain.get('severity') == 'MEDIUM']
        low_severity = [chain for chain in dependency_chains if chain.get('severity') == 'LOW']
        
        f.write(f"- 高风险链路: {len(high_severity)}\n")
        f.write(f"- 中风险链路: {len(medium_severity)}\n")
        f.write(f"- 低风险链路: {len(low_severity)}\n\n")
        
        # 详细链路信息
        f.write("## 详细影响链路\n\n")
        
        for i, chain in enumerate(dependency_chains, 1):
            f.write(f"### 链路 {i}: {chain.get('source_entity', 'unknown')} → {chain.get('target_entity', 'unknown')}\n\n")
            f.write(f"- **链路ID**: {chain.get('chain_id', 'unknown')}\n")
            f.write(f"- **严重程度**: {chain.get('severity', 'unknown')}\n")
            f.write(f"- **链路类型**: {chain.get('chain_type', 'unknown')}\n")
            f.write(f"- **方向**: {chain.get('direction', 'unknown')}\n")
            f.write(f"- **路径长度**: {chain.get('path_length', 0)}\n\n")
            
            # 路径节点
            path_nodes = chain.get('path_nodes', [])
            if path_nodes:
                f.write("#### 路径节点\n\n")
                for j, node in enumerate(path_nodes):
                    f.write(f"{j+1}. **{node.get('name', 'unknown')}** ({node.get('node_type', 'unknown')})\n")
                    if node.get('file_path'):
                        f.write(f"   文件: {node.get('file_path')}\n")
                f.write("\n")
            
            # 关系
            relationships = chain.get('relationships', [])
            if relationships:
                f.write("#### 关系\n\n")
                for j, rel in enumerate(relationships):
                    f.write(f"{j+1}. **{rel.get('type', 'unknown')}**: {rel.get('source', 'unknown')} → {rel.get('target', 'unknown')}\n")
                f.write("\n")
            
            f.write("---\n\n")
    
    print(f"📄 影响链路详细报告已生成: {report_path}")
    return str(report_path)

def generate_cypher_queries_for_chains(comprehensive_analysis, output_dir):
    """Generate Cypher queries for impact chains."""
    queries_path = Path(output_dir) / "影响链路查询语句.cypher"
    
    with open(queries_path, 'w', encoding='utf-8') as f:
        f.write("-- 代码变更影响链路查询语句\n")
        f.write(f"-- 生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        
        dependency_chains = comprehensive_analysis.get('dependency_chains', [])
        
        # 找到最完整的影响链（包含脚本、函数、变量）
        most_complete_chains = find_most_complete_chains(dependency_chains)
        
        f.write("-- ========================================\n")
        f.write("-- 最完整的影响链路分析\n")
        f.write("-- ========================================\n\n")
        
        for i, chain in enumerate(most_complete_chains, 1):
            f.write(f"-- 最完整链路 {i}: {chain.get('source_entity', 'unknown')} → {chain.get('target_entity', 'unknown')}\n")
            f.write(f"-- 链路ID: {chain.get('chain_id', 'unknown')}\n")
            f.write(f"-- 严重程度: {chain.get('severity', 'unknown')}\n")
            f.write(f"-- 链路类型: {chain.get('chain_type', 'unknown')}\n")
            f.write(f"-- 路径长度: {chain.get('path_length', 0)}\n\n")
            
            # 分析链路上的组件类型
            path_nodes = chain.get('path_nodes', [])
            scripts = [node for node in path_nodes if node.get('node_type') == 'Script']
            functions = [node for node in path_nodes if node.get('node_type') == 'Function']
            variables = [node for node in path_nodes if node.get('node_type') == 'Variable']
            
            f.write(f"-- 链路组件统计:\n")
            f.write(f"--   - 脚本: {len(scripts)} 个\n")
            f.write(f"--   - 函数: {len(functions)} 个\n")
            f.write(f"--   - 变量: {len(variables)} 个\n")
            f.write(f"--   - 总计: {len(path_nodes)} 个组件\n\n")
            
            # 显示链路上的所有组件
            f.write(f"-- 链路组件详情:\n")
            for j, node in enumerate(path_nodes, 1):
                node_type = node.get('node_type', 'Unknown')
                node_name = node.get('name', 'unknown')
                file_path = node.get('file_path', '')
                
                f.write(f"--   {j}. {node_type}: {node_name}")
                if file_path:
                    f.write(f" (文件: {file_path})")
                f.write("\n")
            f.write("\n")
            
            # 生成查询特定链路的Cypher语句
            if len(path_nodes) >= 2:
                source_node_id = path_nodes[0].get('node_id')
                target_node_id = path_nodes[-1].get('node_id')
                
                f.write(f"-- 1. 查询完整链路路径\n")
                f.write(f"MATCH path = shortestPath((source)-[*]->(target))\n")
                f.write(f"WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'\n")
                f.write(f"RETURN path, length(path) as path_length;\n\n")
                
                f.write(f"-- 2. 查询链路上的所有节点（按类型分组）\n")
                f.write(f"MATCH path = shortestPath((source)-[*]->(target))\n")
                f.write(f"WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'\n")
                f.write(f"WITH nodes(path) as path_nodes\n")
                f.write(f"UNWIND path_nodes as node\n")
                f.write(f"RETURN labels(node)[0] as node_type, node.name as node_name, node.file_path as file_path\n")
                f.write(f"ORDER BY node_type, node_name;\n\n")
                
                f.write(f"-- 3. 查询链路上的脚本组件\n")
                f.write(f"MATCH path = shortestPath((source)-[*]->(target))\n")
                f.write(f"WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'\n")
                f.write(f"WITH nodes(path) as path_nodes\n")
                f.write(f"UNWIND path_nodes as node\n")
                f.write(f"WHERE 'Script' IN labels(node)\n")
                f.write(f"RETURN node.name as script_name, node.file_path as file_path, properties(node) as properties;\n\n")
                
                f.write(f"-- 4. 查询链路上的函数组件\n")
                f.write(f"MATCH path = shortestPath((source)-[*]->(target))\n")
                f.write(f"WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'\n")
                f.write(f"WITH nodes(path) as path_nodes\n")
                f.write(f"UNWIND path_nodes as node\n")
                f.write(f"WHERE 'Function' IN labels(node)\n")
                f.write(f"RETURN node.name as function_name, node.file_path as file_path, node.line_range as line_range;\n\n")
                
                f.write(f"-- 5. 查询链路上的变量组件\n")
                f.write(f"MATCH path = shortestPath((source)-[*]->(target))\n")
                f.write(f"WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'\n")
                f.write(f"WITH nodes(path) as path_nodes\n")
                f.write(f"UNWIND path_nodes as node\n")
                f.write(f"WHERE 'Variable' IN labels(node)\n")
                f.write(f"RETURN node.name as variable_name, node.file_path as file_path, node.line_range as line_range;\n\n")
                
                f.write(f"-- 6. 查询链路上的所有关系\n")
                f.write(f"MATCH path = shortestPath((source)-[*]->(target))\n")
                f.write(f"WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'\n")
                f.write(f"RETURN relationships(path) as path_relationships;\n\n")
                
                f.write(f"-- 7. 查询链路关系详情\n")
                f.write(f"MATCH path = shortestPath((source)-[*]->(target))\n")
                f.write(f"WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'\n")
                f.write(f"WITH relationships(path) as path_rels\n")
                f.write(f"UNWIND path_rels as rel\n")
                f.write(f"RETURN type(rel) as relationship_type, startNode(rel).name as source_name, endNode(rel).name as target_name;\n\n")
            
            f.write("-- " + "="*60 + "\n\n")
        
        # 生成其他链路的查询语句
        f.write("-- ========================================\n")
        f.write("-- 其他影响链路查询\n")
        f.write("-- ========================================\n\n")
        
        for i, chain in enumerate(dependency_chains, 1):
            if chain not in most_complete_chains:  # 跳过已经处理的最完整链路
                f.write(f"-- 链路 {i}: {chain.get('source_entity', 'unknown')} → {chain.get('target_entity', 'unknown')}\n")
                f.write(f"-- 链路ID: {chain.get('chain_id', 'unknown')}\n")
                f.write(f"-- 严重程度: {chain.get('severity', 'unknown')}\n\n")
                
                # 生成查询特定链路的Cypher语句
                path_nodes = chain.get('path_nodes', [])
                if len(path_nodes) >= 2:
                    source_node_id = path_nodes[0].get('node_id')
                    target_node_id = path_nodes[-1].get('node_id')
                    
                    f.write(f"-- 查询链路路径\n")
                    f.write(f"MATCH path = shortestPath((source)-[*]->(target))\n")
                    f.write(f"WHERE elementId(source) = '{source_node_id}' AND elementId(target) = '{target_node_id}'\n")
                    f.write(f"RETURN path, length(path) as path_length;\n\n")
                
                f.write("-- " + "="*50 + "\n\n")
        
        # 添加通用的影响链查询语句
        f.write("-- ========================================\n")
        f.write("-- 通用影响链查询语句\n")
        f.write("-- ========================================\n\n")
        
        f.write("-- 查询所有影响链\n")
        f.write("MATCH (source)-[r*1..5]->(target)\n")
        f.write("WHERE source <> target\n")
        f.write("RETURN source.name as source_name, target.name as target_name, length(r) as path_length\n")
        f.write("ORDER BY path_length DESC\n")
        f.write("LIMIT 20;\n\n")
        
        f.write("-- 查询包含脚本的影响链\n")
        f.write("MATCH path = (source)-[r*1..5]->(target)\n")
        f.write("WHERE source <> target AND ANY(node IN nodes(path) WHERE 'Script' IN labels(node))\n")
        f.write("RETURN source.name as source_name, target.name as target_name, length(r) as path_length\n")
        f.write("ORDER BY path_length DESC\n")
        f.write("LIMIT 10;\n\n")
        
        f.write("-- 查询包含函数的影响链\n")
        f.write("MATCH path = (source)-[r*1..5]->(target)\n")
        f.write("WHERE source <> target AND ANY(node IN nodes(path) WHERE 'Function' IN labels(node))\n")
        f.write("RETURN source.name as source_name, target.name as target_name, length(r) as path_length\n")
        f.write("ORDER BY path_length DESC\n")
        f.write("LIMIT 10;\n\n")
        
        f.write("-- 查询包含变量的影响链\n")
        f.write("MATCH path = (source)-[r*1..5]->(target)\n")
        f.write("WHERE source <> target AND ANY(node IN nodes(path) WHERE 'Variable' IN labels(node))\n")
        f.write("RETURN source.name as source_name, target.name as target_name, length(r) as path_length\n")
        f.write("ORDER BY path_length DESC\n")
        f.write("LIMIT 10;\n\n")
    
    print(f"🔍 影响链路查询语句已生成: {queries_path}")
    return str(queries_path)

def find_most_complete_chains(dependency_chains):
    """Find the most complete impact chains that contain scripts, functions, and variables."""
    if not dependency_chains:
        return []
    
    # 计算每个链路的完整性分数
    chain_scores = []
    for chain in dependency_chains:
        path_nodes = chain.get('path_nodes', [])
        if not path_nodes:
            continue
        
        # 统计不同类型的组件
        scripts = [node for node in path_nodes if node.get('node_type') == 'Script']
        functions = [node for node in path_nodes if node.get('node_type') == 'Function']
        variables = [node for node in path_nodes if node.get('node_type') == 'Variable']
        
        # 计算完整性分数
        # 基础分数：路径长度
        base_score = len(path_nodes)
        
        # 多样性分数：包含不同类型的组件
        diversity_score = 0
        if scripts:
            diversity_score += 3  # 脚本权重最高
        if functions:
            diversity_score += 2  # 函数权重中等
        if variables:
            diversity_score += 1  # 变量权重最低
        
        # 严重程度分数
        severity_score = {"HIGH": 3, "MEDIUM": 2, "LOW": 1}.get(chain.get('severity'), 0)
        
        # 总分数
        total_score = base_score + diversity_score + severity_score
        
        chain_scores.append({
            'chain': chain,
            'score': total_score,
            'scripts': len(scripts),
            'functions': len(functions),
            'variables': len(variables),
            'total_components': len(path_nodes)
        })
    
    # 按分数排序，选择最完整的链路
    chain_scores.sort(key=lambda x: x['score'], reverse=True)
    
    # 返回前3个最完整的链路，或者所有链路（如果少于3个）
    most_complete = []
    for item in chain_scores[:3]:
        most_complete.append(item['chain'])
    
    return most_complete

def main():
    """Main function."""
    parser = argparse.ArgumentParser(description="Code Change Impact Analysis with Enhanced Chain Analysis")
    parser.add_argument(
        "--config", 
        action="store_true", 
        help="Show current configuration"
    )
    parser.add_argument(
        "--validate", 
        action="store_true", 
        help="Validate configuration"
    )
    parser.add_argument(
        "--days", 
        type=int, 
        default=7, 
        help="Number of days to analyze (default: 7)"
    )
    parser.add_argument(
        "--output-dir", 
        type=str, 
        default="analysis_output", 
        help="Output directory (default: analysis_output)"
    )
    parser.add_argument(
        "--log-level", 
        choices=["DEBUG", "INFO", "WARNING", "ERROR"], 
        default="INFO", 
        help="Log level (default: INFO)"
    )
    parser.add_argument(
        "--repo-url", 
        type=str, 
        help="Override repository URL"
    )
    parser.add_argument(
        "--detailed-chains",
        action="store_true",
        help="Generate detailed impact chain analysis"
    )
    parser.add_argument(
        "--show-chains",
        action="store_true",
        help="Show impact chains in console output"
    )
    
    args = parser.parse_args()
    
    # Show configuration if requested
    if args.config:
        print_config()
        return
    
    # Validate configuration if requested
    if args.validate:
        if validate_config():
            print("✅ Configuration is valid")
        else:
            print("❌ Configuration validation failed")
            sys.exit(1)
        return
    
    # Check environment
    check_environment()
    
    # Check dependencies
    if not check_dependencies():
        sys.exit(1)
    
    # Validate configuration
    if not validate_config():
        print("❌ Configuration validation failed")
        sys.exit(1)
    
    # Setup logging
    setup_logging(args.log_level)
    
    # Override configuration if provided
    config = get_config()
    if args.days != 7:
        config["repository"]["analysis_days"] = args.days
    if args.output_dir != "analysis_output":
        config["analysis"]["output_dir"] = args.output_dir
    if args.repo_url:
        config["repository"]["url"] = args.repo_url
    
    print("🚀 Starting enhanced code change impact analysis...")
    print(f"📊 Repository: {config['repository']['url']}")
    print(f"📅 Analysis period: {config['repository']['analysis_days']} days")
    print(f"📁 Output directory: {config['analysis']['output_dir']}")
    print(f"🔗 Neo4j: {config['neo4j']['uri']}")
    print(f"🤖 Ollama model: {config['ollama']['model']}")
    if args.detailed_chains:
        print(f"🔍 Detailed chain analysis: Enabled")
    if args.show_chains:
        print(f"📋 Chain display: Enabled")
    print("-" * 50)
    
    try:
        # Run the analysis
        results = asyncio.run(run_analysis())
        
        if 'error' in results:
            print(f"\n❌ Analysis failed: {results['error']}")
            sys.exit(1)
        
        comprehensive_analysis = results.get('comprehensive_analysis', {})
        
        # Enhanced impact chain analysis
        if args.show_chains or args.detailed_chains:
            print_impact_chain_summary(comprehensive_analysis)
            print_file_impact_details(comprehensive_analysis)
        
        # Generate detailed reports
        if args.detailed_chains:
            output_dir = config["analysis"]["output_dir"]
            Path(output_dir).mkdir(parents=True, exist_ok=True)
            
            # Generate impact chain report
            chain_report_path = generate_impact_chain_report(comprehensive_analysis, output_dir)
            
            # Generate Cypher queries for chains
            queries_path = generate_cypher_queries_for_chains(comprehensive_analysis, output_dir)
            
            print(f"\n📊 影响链路分析完成!")
            print(f"📄 详细报告: {chain_report_path}")
            print(f"🔍 查询语句: {queries_path}")
        
        print("\n✅ Enhanced analysis completed successfully!")
        
    except KeyboardInterrupt:
        print("\n⚠️  Analysis interrupted by user")
        sys.exit(1)
    except Exception as e:
        print(f"\n❌ Analysis failed: {e}")
        logging.error(f"Analysis failed: {e}", exc_info=True)
        sys.exit(1)

if __name__ == "__main__":
    main() 