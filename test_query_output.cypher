-- 代码变更影响链路查询语句
-- 生成时间: 2025-06-25 11:12:46
-- 仓库: test-repo

-- ========================================
-- 最完整的影响链路分析
-- ========================================

-- 最完整链路 1: getSupportFilePath.m → filePath
-- 链路ID: test_chain_1
-- 严重程度: HIGH
-- 链路类型: function_call_chain
-- 路径长度: 2

-- 链路组件统计:
--   - 脚本: 1 个
--   - 函数: 1 个
--   - 变量: 1 个
--   - 总计: 3 个组件

-- 链路组件详情:
--   1. Script: getSupportFilePath.m (文件: +gpt2/+internal/getSupportFilePath.m)
--   2. Function: legacySupportFilePath (文件: +gpt2/+internal/getSupportFilePath.m)
--   3. Variable: filePath (文件: +gpt2/+internal/getSupportFilePath.m)

-- 1. 查询完整链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:1' AND elementId(target) = '4:test:3'
RETURN path, length(path) as path_length;

-- 2. 查询链路上的所有节点（按类型分组）
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:1' AND elementId(target) = '4:test:3'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
RETURN labels(node)[0] as node_type, node.name as node_name, node.file_path as file_path
ORDER BY node_type, node_name;

-- 3. 查询链路上的脚本组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:1' AND elementId(target) = '4:test:3'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Script' IN labels(node)
RETURN node.name as script_name, node.file_path as file_path, properties(node) as properties;

-- 4. 查询链路上的函数组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:1' AND elementId(target) = '4:test:3'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Function' IN labels(node)
RETURN node.name as function_name, node.file_path as file_path, node.line_range as line_range;

-- 5. 查询链路上的变量组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:1' AND elementId(target) = '4:test:3'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Variable' IN labels(node)
RETURN node.name as variable_name, node.file_path as file_path, node.line_range as line_range;

-- 6. 查询链路上的所有关系
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:1' AND elementId(target) = '4:test:3'
RETURN relationships(path) as path_relationships;

-- 7. 查询链路关系详情
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:1' AND elementId(target) = '4:test:3'
WITH relationships(path) as path_rels
UNWIND path_rels as rel
RETURN type(rel) as relationship_type, startNode(rel).name as source_name, endNode(rel).name as target_name;

-- ============================================================

-- 最完整链路 2: getSupportFilePath.m → data
-- 链路ID: test_chain_2
-- 严重程度: MEDIUM
-- 链路类型: variable_dependency_chain
-- 路径长度: 1

-- 链路组件统计:
--   - 脚本: 1 个
--   - 函数: 0 个
--   - 变量: 1 个
--   - 总计: 2 个组件

-- 链路组件详情:
--   1. Script: getSupportFilePath.m (文件: +gpt2/+internal/getSupportFilePath.m)
--   2. Variable: data (文件: +gpt2/+internal/getSupportFilePath.m)

-- 1. 查询完整链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:4' AND elementId(target) = '4:test:5'
RETURN path, length(path) as path_length;

-- 2. 查询链路上的所有节点（按类型分组）
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:4' AND elementId(target) = '4:test:5'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
RETURN labels(node)[0] as node_type, node.name as node_name, node.file_path as file_path
ORDER BY node_type, node_name;

-- 3. 查询链路上的脚本组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:4' AND elementId(target) = '4:test:5'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Script' IN labels(node)
RETURN node.name as script_name, node.file_path as file_path, properties(node) as properties;

-- 4. 查询链路上的函数组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:4' AND elementId(target) = '4:test:5'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Function' IN labels(node)
RETURN node.name as function_name, node.file_path as file_path, node.line_range as line_range;

-- 5. 查询链路上的变量组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:4' AND elementId(target) = '4:test:5'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Variable' IN labels(node)
RETURN node.name as variable_name, node.file_path as file_path, node.line_range as line_range;

-- 6. 查询链路上的所有关系
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:4' AND elementId(target) = '4:test:5'
RETURN relationships(path) as path_relationships;

-- 7. 查询链路关系详情
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:test:4' AND elementId(target) = '4:test:5'
WITH relationships(path) as path_rels
UNWIND path_rels as rel
RETURN type(rel) as relationship_type, startNode(rel).name as source_name, endNode(rel).name as target_name;

-- ============================================================

-- ========================================
-- 其他影响链路查询
-- ========================================

-- ========================================
-- 通用影响链查询语句
-- ========================================

-- 查询所有影响链
MATCH (source)-[r*1..5]->(target)
WHERE source <> target
RETURN source.name as source_name, target.name as target_name, length(r) as path_length
ORDER BY path_length DESC
LIMIT 20;

-- 查询包含脚本的影响链
MATCH path = (source)-[r*1..5]->(target)
WHERE source <> target AND ANY(node IN nodes(path) WHERE 'Script' IN labels(node))
RETURN source.name as source_name, target.name as target_name, length(r) as path_length
ORDER BY path_length DESC
LIMIT 10;

-- 查询包含函数的影响链
MATCH path = (source)-[r*1..5]->(target)
WHERE source <> target AND ANY(node IN nodes(path) WHERE 'Function' IN labels(node))
RETURN source.name as source_name, target.name as target_name, length(r) as path_length
ORDER BY path_length DESC
LIMIT 10;

-- 查询包含变量的影响链
MATCH path = (source)-[r*1..5]->(target)
WHERE source <> target AND ANY(node IN nodes(path) WHERE 'Variable' IN labels(node))
RETURN source.name as source_name, target.name as target_name, length(r) as path_length
ORDER BY path_length DESC
LIMIT 10;

