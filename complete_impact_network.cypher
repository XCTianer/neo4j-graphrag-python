// 完整的代码变更影响网络图
// 显示所有与GPT2模型变更相关的影响链路

// 1. 找到变更文件中的所有实体
MATCH (entities)
WHERE entities.file_path = '+gpt2/model.m'
WITH collect(entities) as file_entities

// 2. 找到所有相关的依赖关系
MATCH (source)-[r:USES|DEFINES|CALLS]->(target)
WHERE source IN file_entities OR target IN file_entities

// 3. 找到所有上游依赖（影响这些实体的外部实体）
OPTIONAL MATCH upstream_path = (external)-[:USES|DEFINES|CALLS*1..3]->(file_entity)
WHERE file_entity IN file_entities AND external NOT IN file_entities

// 4. 找到所有下游影响（这些实体影响的外部实体）
OPTIONAL MATCH downstream_path = (file_entity)-[:USES|DEFINES|CALLS*1..3]->(external)
WHERE file_entity IN file_entities AND external NOT IN file_entities

// 5. 找到所有内部依赖链（文件内实体之间的关系）
MATCH internal_path = (source)-[:USES|DEFINES|CALLS]->(target)
WHERE source IN file_entities AND target IN file_entities

// 返回完整的网络图
RETURN DISTINCT
    file_entities as changed_file_entities,
    upstream_path as upstream_dependencies,
    downstream_path as downstream_impacts,
    internal_path as internal_dependencies

// 限制结果以避免浏览器过载
LIMIT 200 