-- 代码变更影响链路查询语句
-- 生成时间: 2025-06-25 13:56:27

-- ========================================
-- 最完整的影响链路分析
-- ========================================

-- 最完整链路 1: download → destination
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054_4
-- 严重程度: HIGH
-- 链路类型: function_call_chain
-- 路径长度: 3

-- 链路组件统计:
--   - 脚本: 1 个
--   - 函数: 2 个
--   - 变量: 1 个
--   - 总计: 4 个组件

-- 链路组件详情:
--   1. Script: download (文件: tests/matlab_test/test_data/+gpt2/download.m)
--   2. Function: iDownloadFileIfItDoesNotExist (文件: tests/matlab_test/test_data/+gpt2/download.m)
--   3. Function: iDownloadFileIfItDoesNotExist (文件: tests/matlab_test/test_data/+gpt2/+internal/getSupportFilePath.m)
--   4. Variable: destination (文件: getSupportFilePath.m)

-- 1. 查询完整链路路径
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054'
RETURN path, length(path) as path_length;

-- 2. 查询链路上的所有节点（按类型分组）
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
RETURN labels(node)[0] as node_type, node.name as node_name, node.file_path as file_path
ORDER BY node_type, node_name;

-- 3. 查询链路上的脚本组件
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Script' IN labels(node)
RETURN node.name as script_name, node.file_path as file_path, properties(node) as properties;

-- 4. 查询链路上的函数组件
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Function' IN labels(node)
RETURN node.name as function_name, node.file_path as file_path, node.line_range as line_range;

-- 5. 查询链路上的变量组件
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Variable' IN labels(node)
RETURN node.name as variable_name, node.file_path as file_path, node.line_range as line_range;

-- 6. 查询链路上的所有关系
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054'
RETURN relationships(path) as path_relationships;

-- 7. 查询链路关系详情
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054'
WITH relationships(path) as path_rels
UNWIND path_rels as rel
RETURN type(rel) as relationship_type, startNode(rel).name as source_name, endNode(rel).name as target_name;

-- ============================================================

-- 最完整链路 2: download → source
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055_4
-- 严重程度: HIGH
-- 链路类型: function_call_chain
-- 路径长度: 3

-- 链路组件统计:
--   - 脚本: 1 个
--   - 函数: 2 个
--   - 变量: 1 个
--   - 总计: 4 个组件

-- 链路组件详情:
--   1. Script: download (文件: tests/matlab_test/test_data/+gpt2/download.m)
--   2. Function: iDownloadFileIfItDoesNotExist (文件: tests/matlab_test/test_data/+gpt2/download.m)
--   3. Function: iDownloadFileIfItDoesNotExist (文件: tests/matlab_test/test_data/+gpt2/+internal/getSupportFilePath.m)
--   4. Variable: source (文件: getSupportFilePath.m)

-- 1. 查询完整链路路径
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055'
RETURN path, length(path) as path_length;

-- 2. 查询链路上的所有节点（按类型分组）
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
RETURN labels(node)[0] as node_type, node.name as node_name, node.file_path as file_path
ORDER BY node_type, node_name;

-- 3. 查询链路上的脚本组件
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Script' IN labels(node)
RETURN node.name as script_name, node.file_path as file_path, properties(node) as properties;

-- 4. 查询链路上的函数组件
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Function' IN labels(node)
RETURN node.name as function_name, node.file_path as file_path, node.line_range as line_range;

-- 5. 查询链路上的变量组件
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Variable' IN labels(node)
RETURN node.name as variable_name, node.file_path as file_path, node.line_range as line_range;

-- 6. 查询链路上的所有关系
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055'
RETURN relationships(path) as path_relationships;

-- 7. 查询链路关系详情
MATCH path = shortestPath((source)-[*1..9]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3695' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055'
WITH relationships(path) as path_rels
UNWIND path_rels as rel
RETURN type(rel) as relationship_type, startNode(rel).name as source_name, endNode(rel).name as target_name;

-- ============================================================

-- 最完整链路 3: getSupportFilePath → directory
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053_4
-- 严重程度: HIGH
-- 链路类型: variable_dependency_chain
-- 路径长度: 2

-- 链路组件统计:
--   - 脚本: 1 个
--   - 函数: 1 个
--   - 变量: 1 个
--   - 总计: 3 个组件

-- 链路组件详情:
--   1. Script: getSupportFilePath (文件: tests/matlab_test/test_data/+gpt2/+internal/getSupportFilePath.m)
--   2. Function: iCreateDirectoryIfItDoesNotExist (文件: tests/matlab_test/test_data/+gpt2/+internal/getSupportFilePath.m)
--   3. Variable: directory (文件: getSupportFilePath.m)

-- 1. 查询完整链路路径
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3715' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
RETURN path, length(path) as path_length;

-- 2. 查询链路上的所有节点（按类型分组）
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3715' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
RETURN labels(node)[0] as node_type, node.name as node_name, node.file_path as file_path
ORDER BY node_type, node_name;

-- 3. 查询链路上的脚本组件
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3715' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Script' IN labels(node)
RETURN node.name as script_name, node.file_path as file_path, properties(node) as properties;

-- 4. 查询链路上的函数组件
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3715' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Function' IN labels(node)
RETURN node.name as function_name, node.file_path as file_path, node.line_range as line_range;

-- 5. 查询链路上的变量组件
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3715' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
WITH nodes(path) as path_nodes
UNWIND path_nodes as node
WHERE 'Variable' IN labels(node)
RETURN node.name as variable_name, node.file_path as file_path, node.line_range as line_range;

-- 6. 查询链路上的所有关系
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3715' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
RETURN relationships(path) as path_relationships;

-- 7. 查询链路关系详情
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3715' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
WITH relationships(path) as path_rels
UNWIND path_rels as rel
RETURN type(rel) as relationship_type, startNode(rel).name as source_name, endNode(rel).name as target_name;

-- ============================================================

-- ========================================
-- 其他影响链路查询
-- ========================================

-- 链路 1: download → directory
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053_2
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3684' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 3: iCreateDirectoryIfItDoesNotExist → directory
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053_5
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3687' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 4: getSupportFilePath → destination
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054_2
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3715' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 5: iDownloadFileIfItDoesNotExist → destination
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054_3
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3690' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 7: getSupportFilePath → source
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055_2
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3715' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 8: iDownloadFileIfItDoesNotExist → source
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055_3
-- 严重程度: HIGH

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..8]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3690' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 10: getSupportFilePath → directory
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053_0
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..7]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:625' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 11: iCreateDirectoryIfItDoesNotExist → directory
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..7]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3696' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4053'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 12: getSupportFilePath → destination
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054_0
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..7]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:625' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 13: iDownloadFileIfItDoesNotExist → destination
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..7]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3699' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4054'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 14: getSupportFilePath → source
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055_0
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..7]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:625' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055'
RETURN path, length(path) as path_length;

-- ==================================================

-- 链路 15: iDownloadFileIfItDoesNotExist → source
-- 链路ID: upstream_4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055_1
-- 严重程度: MEDIUM

-- 查询链路路径
MATCH path = shortestPath((source)-[*1..7]->(target))
WHERE elementId(source) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:3699' AND elementId(target) = '4:5d8fcd8a-64fe-4099-b6ee-02c601d1938d:4055'
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

