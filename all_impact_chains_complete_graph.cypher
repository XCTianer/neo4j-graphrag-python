// ============================================================================
// 显示分析产生的所有60条影响链路的完整图形
// 这个查询会显示代码变更分析器生成的具体影响链路
// ============================================================================

// 方法1: 显示所有影响链路的完整网络（推荐使用）
// 找到所有与变更文件相关的实体
MATCH (entities)
WHERE entities.file_path = '+gpt2/model.m'
WITH collect(entities) as file_entities

// 找到所有影响链路（包括内部和外部）
OPTIONAL MATCH internal_chains = (source)-[:USES|DEFINES|CALLS]->(target)
WHERE source IN file_entities AND target IN file_entities

OPTIONAL MATCH external_incoming = (external)-[:USES|DEFINES|CALLS]->(internal)
WHERE internal IN file_entities AND external NOT IN file_entities

OPTIONAL MATCH external_outgoing = (internal)-[:USES|DEFINES|CALLS]->(external)
WHERE internal IN file_entities AND external NOT IN file_entities

// 找到所有多跳的影响链路（这是分析器生成的具体链路）
OPTIONAL MATCH multi_hop_chains = (start)-[:USES|DEFINES|CALLS*1..6]->(end)
WHERE (start IN file_entities OR end IN file_entities)
  AND start <> end

// 返回完整的影响网络
RETURN 
    file_entities as all_changed_entities,
    internal_chains as internal_dependencies,
    external_incoming as external_dependencies,
    external_outgoing as external_impacts,
    multi_hop_chains as all_impact_chains

// ============================================================================
// 方法2: 显示具体的60条影响链路（更精确）
// ============================================================================

// 找到所有与presents变量相关的影响链路
MATCH (presents:Variable {name: 'presents'})
WHERE presents.file_path = '+gpt2/model.m'

// 找到所有上游影响（影响presents的实体）
OPTIONAL MATCH upstream_paths = (upstream)-[:USES|DEFINES|CALLS*1..6]->(presents)
WHERE upstream <> presents

// 找到所有下游影响（presents影响的实体）
OPTIONAL MATCH downstream_paths = (presents)-[:USES|DEFINES|CALLS*1..6]->(downstream)
WHERE downstream <> presents

// 找到gpt2.model函数的所有影响链路
MATCH (func:Function {name: 'gpt2.model'})
WHERE func.file_path = '+gpt2/model.m'

OPTIONAL MATCH func_upstream = (func_up)-[:USES|DEFINES|CALLS*1..6]->(func)
WHERE func_up <> func

OPTIONAL MATCH func_downstream = (func)-[:USES|DEFINES|CALLS*1..6]->(func_down)
WHERE func_down <> func

// 返回所有影响链路
RETURN 
    presents as presents_variable,
    upstream_paths as upstream_impacts,
    downstream_paths as downstream_impacts,
    func as gpt2_function,
    func_upstream as function_upstream,
    func_downstream as function_downstream

// ============================================================================
// 方法3: 显示按风险等级分组的影响链路
// ============================================================================

// 高风险链路（路径长度<=2）
MATCH high_risk_paths = (source)-[:USES|DEFINES|CALLS*1..2]->(target)
WHERE (source.file_path = '+gpt2/model.m' OR target.file_path = '+gpt2/model.m')
  AND source <> target

// 中风险链路（路径长度3-4）
MATCH medium_risk_paths = (source)-[:USES|DEFINES|CALLS*3..4]->(target)
WHERE (source.file_path = '+gpt2/model.m' OR target.file_path = '+gpt2/model.m')
  AND source <> target

// 低风险链路（路径长度>=5）
MATCH low_risk_paths = (source)-[:USES|DEFINES|CALLS*5..6]->(target)
WHERE (source.file_path = '+gpt2/model.m' OR target.file_path = '+gpt2/model.m')
  AND source <> target

// 返回按风险等级分组的影响链路
RETURN 
    high_risk_paths as high_risk_chains,
    medium_risk_paths as medium_risk_chains,
    low_risk_paths as low_risk_chains

// ============================================================================
// 方法4: 显示所有60条影响链路的完整图形（最全面）
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
LIMIT 500 