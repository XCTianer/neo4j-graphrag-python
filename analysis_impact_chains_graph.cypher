// ============================================================================
// 显示分析产生的具体影响链路图形
// 这个查询会显示代码变更分析器生成的60条具体影响链路
// ============================================================================

// 查询1: 显示所有影响链路的完整网络（推荐使用）
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

// ============================================================================
// 查询2: 显示presents变量的具体影响链路
// ============================================================================

// 找到presents变量的所有影响链路
MATCH (presents:Variable {name: 'presents'})
WHERE presents.file_path = '+gpt2/model.m'

// 找到所有上游影响（影响presents的实体）
OPTIONAL MATCH upstream = (up)-[:USES|DEFINES|CALLS*1..6]->(presents)
WHERE up <> presents

// 找到所有下游影响（presents影响的实体）
OPTIONAL MATCH downstream = (presents)-[:USES|DEFINES|CALLS*1..6]->(down)
WHERE down <> presents

// 返回presents变量的影响链路
RETURN presents, upstream, downstream

// ============================================================================
// 查询3: 显示gpt2.model函数的具体影响链路
// ============================================================================

// 找到gpt2.model函数的所有影响链路
MATCH (func:Function {name: 'gpt2.model'})
WHERE func.file_path = '+gpt2/model.m'

// 找到所有上游影响（影响gpt2.model的实体）
OPTIONAL MATCH func_upstream = (up)-[:USES|DEFINES|CALLS*1..6]->(func)
WHERE up <> func

// 找到所有下游影响（gpt2.model影响的实体）
OPTIONAL MATCH func_downstream = (func)-[:USES|DEFINES|CALLS*1..6]->(down)
WHERE down <> func

// 返回gpt2.model函数的影响链路
RETURN func, func_upstream, func_downstream

// ============================================================================
// 查询4: 显示所有60条影响链路的完整图形（最全面）
// ============================================================================

// 找到所有与变更相关的实体
MATCH (changed_entities)
WHERE changed_entities.file_path = '+gpt2/model.m'

// 找到所有影响链路（包括内部和外部）
OPTIONAL MATCH internal_chains = (source)-[:USES|DEFINES|CALLS]->(target)
WHERE source.file_path = '+gpt2/model.m' AND target.file_path = '+gpt2/model.m'

OPTIONAL MATCH external_incoming = (external)-[:USES|DEFINES|CALLS]->(internal)
WHERE internal.file_path = '+gpt2/model.m' AND external.file_path <> '+gpt2/model.m'

OPTIONAL MATCH external_outgoing = (internal)-[:USES|DEFINES|CALLS]->(external)
WHERE internal.file_path = '+gpt2/model.m' AND external.file_path <> '+gpt2/model.m'

// 找到所有多跳的影响链路
OPTIONAL MATCH multi_hop_chains = (start)-[:USES|DEFINES|CALLS*1..6]->(end)
WHERE (start.file_path = '+gpt2/model.m' OR end.file_path = '+gpt2/model.m')
  AND start <> end

// 返回完整的影响网络
RETURN 
    changed_entities as all_changed_entities,
    internal_chains as internal_dependencies,
    external_incoming as external_dependencies,
    external_outgoing as external_impacts,
    multi_hop_chains as all_impact_chains

// 限制结果数量以避免浏览器过载
LIMIT 300 