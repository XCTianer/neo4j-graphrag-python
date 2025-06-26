// ============================================================================
// 显示分析产生的具体影响链路图形
// 这个查询会显示代码变更分析器生成的60条具体影响链路
// ============================================================================

// 找到所有与变更文件相关的实体
MATCH (entities)
WHERE entities.file_path = '+gpt2/model.m'
WITH collect(entities) as file_entities

// 找到所有影响链路（这是分析器生成的具体链路）
MATCH (start)-[:USES|DEFINES|CALLS*1..6]->(end)
WHERE (start IN file_entities OR end IN file_entities)
  AND start <> end

// 返回所有影响链路，用于图形显示
RETURN start, end

// 这个查询会显示：
// 1. 所有与变更文件相关的实体
// 2. 这些实体之间的所有影响链路
// 3. 分析器生成的60条具体影响链路
// 4. 包括内部依赖和外部影响 