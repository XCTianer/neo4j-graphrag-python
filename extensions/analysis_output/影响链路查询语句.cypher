-- 代码变更影响链路查询语句
-- 生成时间: 2025-06-25 11:14:17

-- ========================================
-- 最完整的影响链路分析
-- ========================================

-- 最完整链路 1: getSupportFilePath.m → filePath
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240_2
-- 严重程度: HIGH
-- 链路类型: function_call_chain
-- 路径长度: 2

-- 链路组件统计:
--   - 脚本: 1 个
--   - 函数: 1 个
--   - 变量: 1 个
--   - 总计: 3 个组件

-- 链路组件详情:
--   1. Script: getSupportFilePath.m (文件: +bert/+internal/getSupportFilePath.m)
--   2. Function: legacySupportFilePath (文件: +gpt2/+internal/getSupportFilePath.m)
--   3. Variable: filePath (文件: +gpt2/+internal/getSupportFilePath.m)

-- 1. 查询完整链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
RETURN path, length(path) as path_length;

-- 2. 查询链路上的所有节点（按类型分组）
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
RETURN labels(node)[0] as node_type, node.name as node_name, node.file_path as file_path
ORDER BY node_type, node_name;

-- 3. 查询链路上的脚本组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Script' IN labels(node)
RETURN node.name as script_name, node.file_path as file_path, properties(node) as properties;

-- 4. 查询链路上的函数组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Function' IN labels(node)
RETURN node.name as function_name, node.file_path as file_path, node.line_range as line_range;

-- 5. 查询链路上的变量组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Variable' IN labels(node)
RETURN node.name as variable_name, node.file_path as file_path, node.line_range as line_range;

-- 6. 查询链路上的所有关系
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
RETURN relationships(path) as path_relationships;

-- 7. 查询链路关系详情
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
WITH relationships(path) as path_rels
UNWIND path_rels as rel
RETURN type(rel) as relationship_type, startNode(rel).name as source_name, endNode(rel).name as target_name;

-- ============================================================

-- 最完整链路 2: getSupportFilePath.m → data
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249_2
-- 严重程度: HIGH
-- 链路类型: function_call_chain
-- 路径长度: 2

-- 链路组件统计:
--   - 脚本: 1 个
--   - 函数: 1 个
--   - 变量: 1 个
--   - 总计: 3 个组件

-- 链路组件详情:
--   1. Script: getSupportFilePath.m (文件: +bert/+internal/getSupportFilePath.m)
--   2. Function: legacySupportFilePath (文件: +gpt2/+internal/getSupportFilePath.m)
--   3. Variable: data (文件: +gpt2/+internal/getSupportFilePath.m)

-- 1. 查询完整链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
RETURN path, length(path) as path_length;

-- 2. 查询链路上的所有节点（按类型分组）
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
RETURN labels(node)[0] as node_type, node.name as node_name, node.file_path as file_path
ORDER BY node_type, node_name;

-- 3. 查询链路上的脚本组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Script' IN labels(node)
RETURN node.name as script_name, node.file_path as file_path, properties(node) as properties;

-- 4. 查询链路上的函数组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Function' IN labels(node)
RETURN node.name as function_name, node.file_path as file_path, node.line_range as line_range;

-- 5. 查询链路上的变量组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Variable' IN labels(node)
RETURN node.name as variable_name, node.file_path as file_path, node.line_range as line_range;

-- 6. 查询链路上的所有关系
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
RETURN relationships(path) as path_relationships;

-- 7. 查询链路关系详情
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
WITH relationships(path) as path_rels
UNWIND path_rels as rel
RETURN type(rel) as relationship_type, startNode(rel).name as source_name, endNode(rel).name as target_name;

-- ============================================================

-- 最完整链路 3: getSupportFilePath.m → networks
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250_2
-- 严重程度: HIGH
-- 链路类型: function_call_chain
-- 路径长度: 2

-- 链路组件统计:
--   - 脚本: 1 个
--   - 函数: 1 个
--   - 变量: 1 个
--   - 总计: 3 个组件

-- 链路组件详情:
--   1. Script: getSupportFilePath.m (文件: +bert/+internal/getSupportFilePath.m)
--   2. Function: legacySupportFilePath (文件: +gpt2/+internal/getSupportFilePath.m)
--   3. Variable: networks (文件: +gpt2/+internal/getSupportFilePath.m)

-- 1. 查询完整链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250'
RETURN path, length(path) as path_length;

-- 2. 查询链路上的所有节点（按类型分组）
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
RETURN labels(node)[0] as node_type, node.name as node_name, node.file_path as file_path
ORDER BY node_type, node_name;

-- 3. 查询链路上的脚本组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Script' IN labels(node)
RETURN node.name as script_name, node.file_path as file_path, properties(node) as properties;

-- 4. 查询链路上的函数组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Function' IN labels(node)
RETURN node.name as function_name, node.file_path as file_path, node.line_range as line_range;

-- 5. 查询链路上的变量组件
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Variable' IN labels(node)
RETURN node.name as variable_name, node.file_path as file_path, node.line_range as line_range;

-- 6. 查询链路上的所有关系
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250'
RETURN relationships(path) as path_relationships;

-- 7. 查询链路关系详情
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250'
WITH relationships(path) as path_rels
UNWIND path_rels as rel
RETURN type(rel) as relationship_type, startNode(rel).name as source_name, endNode(rel).name as target_name;

-- ============================================================

-- ========================================
-- 其他影响链路查询
-- ========================================

-- 链路 4: getSupportFilePath.m → modelType
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2252_1
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2252'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 5: getSupportFilePath.m → modelDirectory
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2253_1
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2253'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 6: getSupportFilePath.m → https
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2254_1
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2254'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 7: getSupportFilePath.m → ssd
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2255_1
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2255'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 8: getSupportFilePath.m → mathworks
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2256_1
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2256'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 9: getSupportFilePath.m → com
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2257_1
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2257'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 10: getSupportFilePath.m → supportfiles
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2258_1
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2258'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 11: getSupportFilePath.m → nnet
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2259_1
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2259'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 12: getSupportFilePath.m → legacySupportFilePath
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_0
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:549' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 13: getSupportFilePath.m → fileName
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2239_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2239'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 14: getSupportFilePath.m → sd
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2241_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2241'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 15: getSupportFilePath.m → localFileDir
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2242_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2242'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 16: getSupportFilePath.m → arguments
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2243_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2243'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 17: getSupportFilePath.m → string
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2244_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2244'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 18: getSupportFilePath.m → matlab
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2245_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2245'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 19: getSupportFilePath.m → internal
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2246_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2246'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 20: getSupportFilePath.m → examples
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2247_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2247'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 21: getSupportFilePath.m → utils
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2248_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2248'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 22: getSupportFilePath.m → directory
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2261_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2261'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 23: getSupportFilePath.m → destination
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2263_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2263'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 24: getSupportFilePath.m → arguments
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_5
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2243'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 25: getSupportFilePath.m → com
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_6
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2257'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 26: getSupportFilePath.m → data
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_7
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 27: getSupportFilePath.m → destination
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_8
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2263'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 28: getSupportFilePath.m → directory
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_9
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2261'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 29: getSupportFilePath.m → examples
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_10
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2247'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 30: getSupportFilePath.m → fileName
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_11
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2239'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 31: getSupportFilePath.m → filePath
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_12
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 32: getSupportFilePath.m → https
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_14
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2254'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 33: getSupportFilePath.m → internal
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_15
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2246'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 34: getSupportFilePath.m → localFileDir
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_16
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2242'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 35: getSupportFilePath.m → mathworks
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_17
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2256'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 36: getSupportFilePath.m → matlab
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_18
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2245'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 37: getSupportFilePath.m → modelDirectory
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_19
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2253'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 38: getSupportFilePath → arguments
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2243'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 39: getSupportFilePath → data
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 40: getSupportFilePath → examples
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_2
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2247'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 41: getSupportFilePath → fileName
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_3
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2239'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 42: getSupportFilePath → filePath
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_4
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 43: getSupportFilePath → internal
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_5
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2246'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 44: getSupportFilePath → localFileDir
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_6
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2242'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 45: getSupportFilePath → matlab
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_7
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2245'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 46: getSupportFilePath → networks
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_8
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 47: getSupportFilePath → sd
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_9
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2241'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 48: getSupportFilePath → string
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_10
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2244'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 49: getSupportFilePath → utils
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_11
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2248'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 50: getSupportFilePath → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_12
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 51: getSupportFilePath → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_13
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 52: getSupportFilePath.m → getSupportFilePath
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 53: legacySupportFilePath → com
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2257'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 54: legacySupportFilePath → data
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 55: legacySupportFilePath → filePath
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_2
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 56: legacySupportFilePath → https
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_3
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2254'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 57: legacySupportFilePath → mathworks
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_4
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2256'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 58: legacySupportFilePath → modelDirectory
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_5
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2253'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 59: legacySupportFilePath → modelType
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_6
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2252'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 60: legacySupportFilePath → networks
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_7
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 61: legacySupportFilePath → nnet
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_8
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2259'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 62: legacySupportFilePath → ssd
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_9
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2255'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 63: legacySupportFilePath → supportfiles
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_10
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2258'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 64: legacySupportFilePath → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_11
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 65: legacySupportFilePath → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251_12
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 66: iCreateDirectoryIfItDoesNotExist → directory
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2260_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2260' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2261'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 67: iCreateDirectoryIfItDoesNotExist → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2260_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2260' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 68: iCreateDirectoryIfItDoesNotExist → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2260_2
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2260' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 69: getSupportFilePath.m → iCreateDirectoryIfItDoesNotExist
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2260_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2260'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 70: iDownloadFileIfItDoesNotExist → destination
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2262_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2262' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2263'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 71: iDownloadFileIfItDoesNotExist → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2262_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2262' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 72: iDownloadFileIfItDoesNotExist → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2262_2
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2262' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 73: getSupportFilePath.m → iDownloadFileIfItDoesNotExist
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2262_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2262'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 74: fileName → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2239_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2239' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 75: fileName → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2239_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2239' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 76: getSupportFilePath → fileName
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2239_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2239'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 77: filePath → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 78: filePath → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 79: getSupportFilePath → filePath
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 80: legacySupportFilePath → filePath
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2240'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 81: sd → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2241_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2241' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 82: sd → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2241_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2241' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 83: getSupportFilePath → sd
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2241_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2241'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 84: localFileDir → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2242_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2242' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 85: localFileDir → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2242_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2242' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 86: getSupportFilePath → localFileDir
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2242_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2242'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 87: arguments → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2243_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2243' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 88: arguments → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2243_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2243' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 89: getSupportFilePath → arguments
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2243_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2243'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 90: string → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2244_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2244' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 91: string → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2244_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2244' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 92: getSupportFilePath → string
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2244_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2244'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 93: matlab → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2245_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2245' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 94: matlab → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2245_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2245' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 95: getSupportFilePath → matlab
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2245_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2245'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 96: internal → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2246_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2246' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 97: internal → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2246_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2246' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 98: getSupportFilePath → internal
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2246_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2246'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 99: examples → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2247_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2247' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 100: examples → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2247_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2247' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 101: getSupportFilePath → examples
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2247_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2247'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 102: utils → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2248_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2248' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 103: utils → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2248_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2248' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 104: getSupportFilePath → utils
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2248_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2248'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 105: data → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 106: data → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 107: getSupportFilePath → data
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 108: legacySupportFilePath → data
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2249'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 109: networks → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 110: networks → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 111: getSupportFilePath → networks
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 112: legacySupportFilePath → networks
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2250'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 113: modelType → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2252_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2252' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 114: modelType → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2252_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2252' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 115: legacySupportFilePath → modelType
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2252_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2252'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 116: modelDirectory → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2253_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2253' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 117: modelDirectory → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2253_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2253' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 118: legacySupportFilePath → modelDirectory
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2253_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2253'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 119: https → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2254_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2254' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 120: https → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2254_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2254' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 121: legacySupportFilePath → https
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2254_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2254'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 122: ssd → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2255_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2255' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 123: ssd → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2255_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2255' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 124: legacySupportFilePath → ssd
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2255_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2255'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 125: mathworks → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2256_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2256' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 126: mathworks → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2256_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2256' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 127: legacySupportFilePath → mathworks
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2256_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2256'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 128: com → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2257_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2257' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 129: com → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2257_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2257' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 130: legacySupportFilePath → com
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2257_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2257'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 131: supportfiles → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2258_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2258' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 132: supportfiles → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2258_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2258' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 133: legacySupportFilePath → supportfiles
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2258_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2258'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 134: nnet → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2259_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2259' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 135: nnet → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2259_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2259' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 136: legacySupportFilePath → nnet
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2259_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2259'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 137: directory → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2261_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2261' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 138: directory → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2261_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2261' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 139: iCreateDirectoryIfItDoesNotExist → directory
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2261_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2260' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2261'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 140: destination → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2263_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2263' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 141: destination → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2263_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2263' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 142: iDownloadFileIfItDoesNotExist → destination
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2263_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2262' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2263'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 143: getSupportFilePath.m → getSupportFilePath
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_0
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2238'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 144: getSupportFilePath.m → iCreateDirectoryIfItDoesNotExist
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_1
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2260'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 145: getSupportFilePath.m → iDownloadFileIfItDoesNotExist
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_2
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2262'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 146: getSupportFilePath.m → legacySupportFilePath
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_3
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2251'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 147: getSupportFilePath.m → 
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_4
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2236'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 148: getSupportFilePath.m → getSupportFilePath.m
-- 链路ID: downstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237_13
-- 严重程度: LOW

-- 查询链路路径
MATCH path = shortestPath((source)-[*]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2237' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:2235'
RETURN path, length(path) as path_length;

-- ==================================================

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

