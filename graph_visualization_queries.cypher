// ============================================================================
// Neo4j浏览器图形显示查询集合
// 用于显示代码变更的完整影响网络
// ============================================================================

// 查询1: 显示变更文件中的所有实体和关系（核心网络）
MATCH (source)-[r:USES|DEFINES|CALLS]->(target)
WHERE source.file_path = '+gpt2/model.m' AND target.file_path = '+gpt2/model.m'
RETURN source, r, target

// 查询2: 显示presents变量的完整影响链路
MATCH (presents:Variable {name: 'presents'})
WHERE presents.file_path = '+gpt2/model.m'
OPTIONAL MATCH upstream = (up)-[:USES|DEFINES|CALLS*1..3]->(presents)
OPTIONAL MATCH downstream = (presents)-[:USES|DEFINES|CALLS*1..3]->(down)
RETURN presents, upstream, downstream

// 查询3: 显示gpt2.model函数的所有依赖关系
MATCH (func:Function {name: 'gpt2.model'})
WHERE func.file_path = '+gpt2/model.m'
OPTIONAL MATCH upstream = (up)-[:USES|DEFINES|CALLS*1..3]->(func)
OPTIONAL MATCH downstream = (func)-[:USES|DEFINES|CALLS*1..3]->(down)
RETURN func, upstream, downstream

// 查询4: 显示所有高风险影响链路（路径长度<=2）
MATCH path = (source)-[:USES|DEFINES|CALLS*1..2]->(target)
WHERE (source.file_path = '+gpt2/model.m' OR target.file_path = '+gpt2/model.m')
  AND source <> target
RETURN path

// 查询5: 显示完整的依赖网络（包含外部依赖）
MATCH (source)-[r:USES|DEFINES|CALLS]->(target)
WHERE source.file_path = '+gpt2/model.m' OR target.file_path = '+gpt2/model.m'
RETURN source, r, target

// 查询6: 显示按实体类型分组的网络
MATCH (source)-[r:USES|DEFINES|CALLS]->(target)
WHERE source.file_path = '+gpt2/model.m' OR target.file_path = '+gpt2/model.m'
WITH source, r, target,
     CASE labels(source)[0] 
       WHEN 'Function' THEN 'Function'
       WHEN 'Variable' THEN 'Variable'
       WHEN 'Script' THEN 'Script'
       ELSE 'Other'
     END as source_type,
     CASE labels(target)[0]
       WHEN 'Function' THEN 'Function'
       WHEN 'Variable' THEN 'Variable'
       WHEN 'Script' THEN 'Script'
       ELSE 'Other'
     END as target_type
RETURN source, r, target, source_type, target_type

// 查询7: 显示影响链路的层次结构
MATCH (root:Function {name: 'gpt2.model'})
WHERE root.file_path = '+gpt2/model.m'
OPTIONAL MATCH level1 = (root)-[:USES|DEFINES|CALLS]->(level1_entity)
OPTIONAL MATCH level2 = (level1_entity)-[:USES|DEFINES|CALLS]->(level2_entity)
OPTIONAL MATCH level3 = (level2_entity)-[:USES|DEFINES|CALLS]->(level3_entity)
RETURN root, level1, level2, level3

// 查询8: 显示所有变量之间的依赖关系
MATCH (var1:Variable)-[r:USES|DEFINES]->(var2:Variable)
WHERE var1.file_path = '+gpt2/model.m' AND var2.file_path = '+gpt2/model.m'
RETURN var1, r, var2

// 查询9: 显示函数调用链
MATCH (func1:Function)-[r:CALLS]->(func2:Function)
WHERE func1.file_path = '+gpt2/model.m' OR func2.file_path = '+gpt2/model.m'
RETURN func1, r, func2

// 查询10: 显示完整的变更影响网络（推荐使用）
MATCH (entities)
WHERE entities.file_path = '+gpt2/model.m'
WITH collect(entities) as file_entities
MATCH (source)-[r:USES|DEFINES|CALLS]->(target)
WHERE source IN file_entities OR target IN file_entities
RETURN source, r, target 