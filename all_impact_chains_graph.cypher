// 显示所有影响链路的完整图形
// 这个查询会返回所有与presents变量相关的完整影响链路

// 1. 首先找到presents变量
MATCH (presents:Variable {name: 'presents'})
WHERE presents.file_path = '+gpt2/model.m'

// 2. 找到所有与presents相关的上游依赖（影响presents的实体）
OPTIONAL MATCH upstream_path = (upstream)-[:USES|DEFINES|CALLS*1..5]->(presents)
WHERE upstream <> presents

// 3. 找到所有与presents相关的下游影响（presents影响的实体）
OPTIONAL MATCH downstream_path = (presents)-[:USES|DEFINES|CALLS*1..5]->(downstream)
WHERE downstream <> presents

// 4. 找到presents所在函数的所有依赖关系
OPTIONAL MATCH function_path = (func:Function {name: 'gpt2.model'})-[:USES|DEFINES|CALLS*1..5]->(related)
WHERE func.file_path = '+gpt2/model.m'

// 5. 找到所有相关的变量和函数
OPTIONAL MATCH all_entities = (entity)
WHERE entity.file_path = '+gpt2/model.m' 
   OR entity.name IN ['X', 'Y', 'bias', 'dropout', 'parameters', 'model', 'gpt2.model']

// 6. 找到这些实体之间的所有关系
OPTIONAL MATCH all_relationships = (source)-[r:USES|DEFINES|CALLS]->(target)
WHERE (source.file_path = '+gpt2/model.m' OR source.name IN ['X', 'Y', 'bias', 'dropout', 'parameters', 'model', 'gpt2.model'])
  AND (target.file_path = '+gpt2/model.m' OR target.name IN ['X', 'Y', 'bias', 'dropout', 'parameters', 'model', 'gpt2.model'])

// 返回所有路径和关系，用于图形显示
RETURN DISTINCT
    presents as presents_var,
    upstream_path as upstream_impact,
    downstream_path as downstream_impact,
    function_path as function_dependencies,
    all_entities as all_related_entities,
    all_relationships as all_entity_relationships

// 限制结果数量以避免浏览器过载
LIMIT 100 