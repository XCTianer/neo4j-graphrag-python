// ============================================================================
// 完整影响链路图形显示查询
// 在一张图中显示所有与代码变更相关的影响链路
// ============================================================================

// 方法1: 显示所有影响链路的完整网络（推荐）
MATCH (entities)
WHERE entities.file_path = '+gpt2/model.m'
WITH collect(entities) as file_entities

// 找到所有相关的依赖关系
MATCH (source)-[r:USES|DEFINES|CALLS]->(target)
WHERE source IN file_entities OR target IN file_entities

// 返回完整的网络图
RETURN source, r, target

// ============================================================================
// 方法2: 分层显示影响链路（更清晰）
// ============================================================================

// 第1层: 核心变更实体
MATCH (core:Variable {name: 'presents'})
WHERE core.file_path = '+gpt2/model.m'

// 第2层: 直接影响（1跳关系）
OPTIONAL MATCH direct_impact = (core)-[:USES|DEFINES|CALLS]->(direct)
OPTIONAL MATCH direct_source = (direct_source)-[:USES|DEFINES|CALLS]->(core)

// 第3层: 间接影响（2跳关系）
OPTIONAL MATCH indirect_impact = (direct)-[:USES|DEFINES|CALLS]->(indirect)
OPTIONAL MATCH indirect_source = (indirect_source)-[:USES|DEFINES|CALLS]->(direct_source)

// 第4层: 深层影响（3跳关系）
OPTIONAL MATCH deep_impact = (indirect)-[:USES|DEFINES|CALLS]->(deep)
OPTIONAL MATCH deep_source = (deep_source)-[:USES|DEFINES|CALLS]->(indirect_source)

// 返回分层的影响链路
RETURN 
    core as core_entity,
    direct_impact as direct_impacts,
    direct_source as direct_sources,
    indirect_impact as indirect_impacts,
    indirect_source as indirect_sources,
    deep_impact as deep_impacts,
    deep_source as deep_sources

// ============================================================================
// 方法3: 按风险等级显示影响链路
// ============================================================================

// 高风险链路（路径长度<=2）
MATCH high_risk = (source)-[:USES|DEFINES|CALLS*1..2]->(target)
WHERE (source.file_path = '+gpt2/model.m' OR target.file_path = '+gpt2/model.m')
  AND source <> target

// 中风险链路（路径长度3-4）
MATCH medium_risk = (source)-[:USES|DEFINES|CALLS*3..4]->(target)
WHERE (source.file_path = '+gpt2/model.m' OR target.file_path = '+gpt2/model.m')
  AND source <> target

// 低风险链路（路径长度>=5）
MATCH low_risk = (source)-[:USES|DEFINES|CALLS*5..6]->(target)
WHERE (source.file_path = '+gpt2/model.m' OR target.file_path = '+gpt2/model.m')
  AND source <> target

// 返回按风险等级分组的影响链路
RETURN 
    high_risk as high_risk_chains,
    medium_risk as medium_risk_chains,
    low_risk as low_risk_chains

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
LIMIT 300 