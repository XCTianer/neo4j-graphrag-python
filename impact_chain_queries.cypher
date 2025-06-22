-- Git变更影响链路查询
-- 生成时间: 2025-06-22 14:30:12
-- 使用方法: 在Neo4j Browser中复制粘贴以下查询

-- ==========================================
-- 提交 1: f2bc4089 - 导出当前Neo4j数据库数据，包含节点、关系、统计信息和重建Cypher脚本
-- ==========================================

-- 完整影响链路查询（推荐优先使用）
-- 显示变更的完整影响范围，包括所有相关节点和关系

-- 完整链路查询 1
// 变量 out 的完整影响链路分析
MATCH (v:Variable {name: 'out'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 2
// 变量 mdl 的完整影响链路分析
MATCH (v:Variable {name: 'mdl'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 3
// 变量 summary 的完整影响链路分析
MATCH (v:Variable {name: 'summary'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 4
// 变量 X 的完整影响链路分析
MATCH (v:Variable {name: 'X'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 5
// 变量 Y 的完整影响链路分析
MATCH (v:Variable {name: 'Y'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 6
// 变量 predictions 的完整影响链路分析
MATCH (v:Variable {name: 'predictions'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 7
// 变量 z 的完整影响链路分析
MATCH (v:Variable {name: 'z'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 8
// 变量 varargout 的完整影响链路分析
MATCH (v:Variable {name: 'varargout'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 9
// 变量 Z 的完整影响链路分析
MATCH (v:Variable {name: 'Z'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 10
// 变量 params 的完整影响链路分析
MATCH (v:Variable {name: 'params'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 11
// 变量 parameters 的完整影响链路分析
MATCH (v:Variable {name: 'parameters'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 12
// 变量 dirpath 的完整影响链路分析
MATCH (v:Variable {name: 'dirpath'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 13
// 变量 supportfileName 的完整影响链路分析
MATCH (v:Variable {name: 'supportfileName'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 14
// 变量 names 的完整影响链路分析
MATCH (v:Variable {name: 'names'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 15
// 变量 weightsStruct 的完整影响链路分析
MATCH (v:Variable {name: 'weightsStruct'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 16
// 变量 name 的完整影响链路分析
MATCH (v:Variable {name: 'name'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 17
// 变量 types 的完整影响链路分析
MATCH (v:Variable {name: 'types'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 18
// 变量 xsz 的完整影响链路分析
MATCH (v:Variable {name: 'xsz'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 19
// 变量 filePath 的完整影响链路分析
MATCH (v:Variable {name: 'filePath'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 20
// 变量 this 的完整影响链路分析
MATCH (v:Variable {name: 'this'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 21
// 变量 tokens 的完整影响链路分析
MATCH (v:Variable {name: 'tokens'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 22
// 变量 x 的完整影响链路分析
MATCH (v:Variable {name: 'x'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 23
// 变量 text 的完整影响链路分析
MATCH (v:Variable {name: 'text'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 24
// 变量 tok 的完整影响链路分析
MATCH (v:Variable {name: 'tok'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 25
// 变量 u 的完整影响链路分析
MATCH (v:Variable {name: 'u'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 26
// 变量 tf 的完整影响链路分析
MATCH (v:Variable {name: 'tf'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 27
// 变量 vocab 的完整影响链路分析
MATCH (v:Variable {name: 'vocab'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 28
// 变量 toks 的完整影响链路分析
MATCH (v:Variable {name: 'toks'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 29
// 变量 idx 的完整影响链路分析
MATCH (v:Variable {name: 'idx'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 30
// 变量 y 的完整影响链路分析
MATCH (v:Variable {name: 'y'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 31
// 变量 A 的完整影响链路分析
MATCH (v:Variable {name: 'A'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 32
// 变量 W 的完整影响链路分析
MATCH (v:Variable {name: 'W'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 33
// 变量 SharedTestFixtures 的完整影响链路分析
MATCH (v:Variable {name: 'SharedTestFixtures'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 34
// 变量 validText 的完整影响链路分析
MATCH (v:Variable {name: 'validText'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 35
// 变量 constraint 的完整影响链路分析
MATCH (v:Variable {name: 'constraint'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 36
// 变量 tol 的完整影响链路分析
MATCH (v:Variable {name: 'tol'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 37
// 变量 s 的完整影响链路分析
MATCH (v:Variable {name: 's'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 38
// 变量 w 的完整影响链路分析
MATCH (v:Variable {name: 'w'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 39
// 变量 a 的完整影响链路分析
MATCH (v:Variable {name: 'a'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 40
// 变量 ids 的完整影响链路分析
MATCH (v:Variable {name: 'ids'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 41
// 变量 vocabFiles 的完整影响链路分析
MATCH (v:Variable {name: 'vocabFiles'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 42
// 变量 modelNames 的完整影响链路分析
MATCH (v:Variable {name: 'modelNames'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 43
// 变量 japaneseBERTTokenizer 的完整影响链路分析
MATCH (v:Variable {name: 'japaneseBERTTokenizer'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 44
// 变量 inferTypeID 的完整影响链路分析
MATCH (v:Variable {name: 'inferTypeID'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 45
// 变量 path 的完整影响链路分析
MATCH (v:Variable {name: 'path'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 46
// 变量 modelDirs 的完整影响链路分析
MATCH (v:Variable {name: 'modelDirs'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 47
// 变量 pasts 的完整影响链路分析
MATCH (v:Variable {name: 'pasts'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 48
// 变量 weights 的完整影响链路分析
MATCH (v:Variable {name: 'weights'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 49
// 变量 modelName 的完整影响链路分析
MATCH (v:Variable {name: 'modelName'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 50
// 变量 modelPath 的完整影响链路分析
MATCH (v:Variable {name: 'modelPath'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 51
// 变量 parameter 的完整影响链路分析
MATCH (v:Variable {name: 'parameter'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 52
// 变量 c 的完整影响链路分析
MATCH (v:Variable {name: 'c'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 53
// 变量 newParameters 的完整影响链路分析
MATCH (v:Variable {name: 'newParameters'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 54
// 变量 numericTokens 的完整影响链路分析
MATCH (v:Variable {name: 'numericTokens'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 55
// 变量 word 的完整影响链路分析
MATCH (v:Variable {name: 'word'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 56
// 变量 cs 的完整影响链路分析
MATCH (v:Variable {name: 'cs'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 57
// 变量 pairs 的完整影响链路分析
MATCH (v:Variable {name: 'pairs'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 58
// 变量 sample 的完整影响链路分析
MATCH (v:Variable {name: 'sample'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 59
// 变量 logits 的完整影响链路分析
MATCH (v:Variable {name: 'logits'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 60
// 函数 out 的完整影响链路分析
MATCH (f:Function {name: 'out'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 61
// 函数 mdl 的完整影响链路分析
MATCH (f:Function {name: 'mdl'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 62
// 函数 summary 的完整影响链路分析
MATCH (f:Function {name: 'summary'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 63
// 函数 iIsScalarString 的完整影响链路分析
MATCH (f:Function {name: 'iIsScalarString'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 64
// 函数 X 的完整影响链路分析
MATCH (f:Function {name: 'X'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 65
// 函数 Y 的完整影响链路分析
MATCH (f:Function {name: 'Y'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 66
// 函数 predictions 的完整影响链路分析
MATCH (f:Function {name: 'predictions'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 67
// 函数 z 的完整影响链路分析
MATCH (f:Function {name: 'z'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 68
// 函数 varargout 的完整影响链路分析
MATCH (f:Function {name: 'varargout'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 69
// 函数 mustBeLessThanOrEqualNumLayers 的完整影响链路分析
MATCH (f:Function {name: 'mustBeLessThanOrEqualNumLayers'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 70
// 函数 mustBeALogicalOrDlarrayLogical 的完整影响链路分析
MATCH (f:Function {name: 'mustBeALogicalOrDlarrayLogical'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 71
// 函数 mustBeNumericDlarray 的完整影响链路分析
MATCH (f:Function {name: 'mustBeNumericDlarray'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 72
// 函数 params 的完整影响链路分析
MATCH (f:Function {name: 'params'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 73
// 函数 dirpath 的完整影响链路分析
MATCH (f:Function {name: 'dirpath'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 74
// 函数 supportfileName 的完整影响链路分析
MATCH (f:Function {name: 'supportfileName'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 75
// 函数 names 的完整影响链路分析
MATCH (f:Function {name: 'names'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 76
// 函数 weightsStruct 的完整影响链路分析
MATCH (f:Function {name: 'weightsStruct'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 77
// 函数 name 的完整影响链路分析
MATCH (f:Function {name: 'name'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 78
// 函数 types 的完整影响链路分析
MATCH (f:Function {name: 'types'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 79
// 函数 filePath 的完整影响链路分析
MATCH (f:Function {name: 'filePath'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 80
// 函数 is 的完整影响链路分析
MATCH (f:Function {name: 'is'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 81
// 函数 this 的完整影响链路分析
MATCH (f:Function {name: 'this'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 82
// 函数 tokens 的完整影响链路分析
MATCH (f:Function {name: 'tokens'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 83
// 函数 x 的完整影响链路分析
MATCH (f:Function {name: 'x'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 84
// 函数 text 的完整影响链路分析
MATCH (f:Function {name: 'text'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 85
// 函数 tok 的完整影响链路分析
MATCH (f:Function {name: 'tok'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 86
// 函数 u 的完整影响链路分析
MATCH (f:Function {name: 'u'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 87
// 函数 tf 的完整影响链路分析
MATCH (f:Function {name: 'tf'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 88
// 函数 vocab 的完整影响链路分析
MATCH (f:Function {name: 'vocab'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 89
// 函数 mustBeFileOrEncoding 的完整影响链路分析
MATCH (f:Function {name: 'mustBeFileOrEncoding'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 90
// 函数 toks 的完整影响链路分析
MATCH (f:Function {name: 'toks'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 91
// 函数 idx 的完整影响链路分析
MATCH (f:Function {name: 'idx'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 92
// 函数 y 的完整影响链路分析
MATCH (f:Function {name: 'y'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 93
// 函数 Z 的完整影响链路分析
MATCH (f:Function {name: 'Z'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 94
// 函数 A 的完整影响链路分析
MATCH (f:Function {name: 'A'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 95
// 函数 W 的完整影响链路分析
MATCH (f:Function {name: 'W'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 96
// 函数 canConstructModelWithDefault 的完整影响链路分析
MATCH (f:Function {name: 'canConstructModelWithDefault'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 97
// 函数 canConstructModelWithNVP 的完整影响链路分析
MATCH (f:Function {name: 'canConstructModelWithNVP'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 98
// 函数 canConstructLanguageModel 的完整影响链路分析
MATCH (f:Function {name: 'canConstructLanguageModel'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 99
// 函数 verifyOutputDimSizes 的完整影响链路分析
MATCH (f:Function {name: 'verifyOutputDimSizes'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 100
// 函数 maskTokenIsRemoved 的完整影响链路分析
MATCH (f:Function {name: 'maskTokenIsRemoved'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 101
// 函数 inputWithoutMASKRemainsTheSame 的完整影响链路分析
MATCH (f:Function {name: 'inputWithoutMASKRemainsTheSame'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 102
// 函数 validText 的完整影响链路分析
MATCH (f:Function {name: 'validText'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 103
// 函数 canConstructAllModels 的完整影响链路分析
MATCH (f:Function {name: 'canConstructAllModels'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 104
// 函数 canConstructModelWithNVPAndVerifyDefault 的完整影响链路分析
MATCH (f:Function {name: 'canConstructModelWithNVPAndVerifyDefault'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 105
// 函数 checkBertIgnoreCase 的完整影响链路分析
MATCH (f:Function {name: 'checkBertIgnoreCase'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 106
// 函数 multicasedVersionIsCaseSensitive 的完整影响链路分析
MATCH (f:Function {name: 'multicasedVersionIsCaseSensitive'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 107
// 函数 canDoNSP 的完整影响链路分析
MATCH (f:Function {name: 'canDoNSP'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 108
// 函数 constraint 的完整影响链路分析
MATCH (f:Function {name: 'constraint'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 109
// 函数 matchesExpectedValue 的完整影响链路分析
MATCH (f:Function {name: 'matchesExpectedValue'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 110
// 函数 supportsMultipleTypes 的完整影响链路分析
MATCH (f:Function {name: 'supportsMultipleTypes'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 111
// 函数 tol 的完整影响链路分析
MATCH (f:Function {name: 'tol'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 112
// 函数 hasExpectedValue 的完整影响链路分析
MATCH (f:Function {name: 'hasExpectedValue'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 113
// 函数 s 的完整影响链路分析
MATCH (f:Function {name: 's'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 114
// 函数 resetGlobalSeed 的完整影响链路分析
MATCH (f:Function {name: 'resetGlobalSeed'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 115
// 函数 doesDropout 的完整影响链路分析
MATCH (f:Function {name: 'doesDropout'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 116
// 函数 isRandom 的完整影响链路分析
MATCH (f:Function {name: 'isRandom'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 117
// 函数 supportsDlarrayAndAutodiff 的完整影响链路分析
MATCH (f:Function {name: 'supportsDlarrayAndAutodiff'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 118
// 函数 returnsValueWhenOneKey 的完整影响链路分析
MATCH (f:Function {name: 'returnsValueWhenOneKey'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 119
// 函数 isScaledDotProduct 的完整影响链路分析
MATCH (f:Function {name: 'isScaledDotProduct'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 120
// 函数 isExpectedValue 的完整影响链路分析
MATCH (f:Function {name: 'isExpectedValue'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 121
// 函数 multipleQueries 的完整影响链路分析
MATCH (f:Function {name: 'multipleQueries'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 122
// 函数 multipleHeads 的完整影响链路分析
MATCH (f:Function {name: 'multipleHeads'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 123
// 函数 defaultIsMasked 的完整影响链路分析
MATCH (f:Function {name: 'defaultIsMasked'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 124
// 函数 canTurnOffMask 的完整影响链路分析
MATCH (f:Function {name: 'canTurnOffMask'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 125
// 函数 canDropout 的完整影响链路分析
MATCH (f:Function {name: 'canDropout'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 126
// 函数 defaultIsNoDropout 的完整影响链路分析
MATCH (f:Function {name: 'defaultIsNoDropout'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 127
// 函数 multipleObservations 的完整影响链路分析
MATCH (f:Function {name: 'multipleObservations'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 128
// 函数 w 的完整影响链路分析
MATCH (f:Function {name: 'w'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 129
// 函数 a 的完整影响链路分析
MATCH (f:Function {name: 'a'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 130
// 函数 verifyDlarrayEqual 的完整影响链路分析
MATCH (f:Function {name: 'verifyDlarrayEqual'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 131
// 函数 computesExpectedValue 的完整影响链路分析
MATCH (f:Function {name: 'computesExpectedValue'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 132
// 函数 checkSingleHeadNoFullyConnected 的完整影响链路分析
MATCH (f:Function {name: 'checkSingleHeadNoFullyConnected'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 133
// 函数 checkMultiHeadNoFullyConnected 的完整影响链路分析
MATCH (f:Function {name: 'checkMultiHeadNoFullyConnected'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 134
// 函数 checkPastPresentCaching 的完整影响链路分析
MATCH (f:Function {name: 'checkPastPresentCaching'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 135
// 函数 checkInputOutputFC 的完整影响链路分析
MATCH (f:Function {name: 'checkInputOutputFC'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 136
// 函数 defaultIsMaksed 的完整影响链路分析
MATCH (f:Function {name: 'defaultIsMaksed'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 137
// 函数 canBatch 的完整影响链路分析
MATCH (f:Function {name: 'canBatch'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 138
// 函数 canEncodeSentencePairs 的完整影响链路分析
MATCH (f:Function {name: 'canEncodeSentencePairs'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 139
// 函数 checkDuplicateSentence 的完整影响链路分析
MATCH (f:Function {name: 'checkDuplicateSentence'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 140
// 函数 defaultOutputsIsLastLayer 的完整影响链路分析
MATCH (f:Function {name: 'defaultOutputsIsLastLayer'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 141
// 函数 outputsCanBeUsed 的完整影响链路分析
MATCH (f:Function {name: 'outputsCanBeUsed'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 142
// 函数 outputsCanDuplicateAndBeOutOfOrder 的完整影响链路分析
MATCH (f:Function {name: 'outputsCanDuplicateAndBeOutOfOrder'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 143
// 函数 negativeTestOutputs 的完整影响链路分析
MATCH (f:Function {name: 'negativeTestOutputs'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 144
// 函数 negativeTestSeparatorCode 的完整影响链路分析
MATCH (f:Function {name: 'negativeTestSeparatorCode'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 145
// 函数 negativeTestPaddingCode 的完整影响链路分析
MATCH (f:Function {name: 'negativeTestPaddingCode'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 146
// 函数 negativeTestDropoutProb 的完整影响链路分析
MATCH (f:Function {name: 'negativeTestDropoutProb'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 147
// 函数 negativeTestAttentionDropoutProb 的完整影响链路分析
MATCH (f:Function {name: 'negativeTestAttentionDropoutProb'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 148
// 函数 negativeInputMask 的完整影响链路分析
MATCH (f:Function {name: 'negativeInputMask'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 149
// 函数 negativeInputX 的完整影响链路分析
MATCH (f:Function {name: 'negativeInputX'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 150
// 函数 negativeModelParameters 的完整影响链路分析
MATCH (f:Function {name: 'negativeModelParameters'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 151
// 函数 errorsForIncorrectModelName 的完整影响链路分析
MATCH (f:Function {name: 'errorsForIncorrectModelName'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 152
// 函数 canUseInputMask 的完整影响链路分析
MATCH (f:Function {name: 'canUseInputMask'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 153
// 函数 ids 的完整影响链路分析
MATCH (f:Function {name: 'ids'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 154
// 函数 canPredictMaskedTokens 的完整影响链路分析
MATCH (f:Function {name: 'canPredictMaskedTokens'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 155
// 函数 checkProbDistrOverChannelDimBatches 的完整影响链路分析
MATCH (f:Function {name: 'checkProbDistrOverChannelDimBatches'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 156
// 函数 canConstruct 的完整影响链路分析
MATCH (f:Function {name: 'canConstruct'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 157
// 函数 canConstructWithNonDefaultModel 的完整影响链路分析
MATCH (f:Function {name: 'canConstructWithNonDefaultModel'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 158
// 函数 hasExpectedProperties 的完整影响链路分析
MATCH (f:Function {name: 'hasExpectedProperties'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 159
// 函数 canEncodeOneSentence 的完整影响链路分析
MATCH (f:Function {name: 'canEncodeOneSentence'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 160
// 函数 canEncodeMultipleSentences 的完整影响链路分析
MATCH (f:Function {name: 'canEncodeMultipleSentences'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 161
// 函数 canEncodeSentencePair 的完整影响链路分析
MATCH (f:Function {name: 'canEncodeSentencePair'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 162
// 函数 canEncodeMultipleSentencePairs 的完整影响链路分析
MATCH (f:Function {name: 'canEncodeMultipleSentencePairs'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 163
// 函数 errorsForDifferentNumberOfSentencePairObservations 的完整影响链路分析
MATCH (f:Function {name: 'errorsForDifferentNumberOfSentencePairObservations'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 164
// 函数 canDecode 的完整影响链路分析
MATCH (f:Function {name: 'canDecode'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 165
// 函数 canDecodeMultipleObservations 的完整影响链路分析
MATCH (f:Function {name: 'canDecodeMultipleObservations'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 166
// 函数 canDecodePaddedBatch 的完整影响链路分析
MATCH (f:Function {name: 'canDecodePaddedBatch'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 167
// 函数 canIgnoreCase 的完整影响链路分析
MATCH (f:Function {name: 'canIgnoreCase'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 168
// 函数 checkCaseSensitivity 的完整影响链路分析
MATCH (f:Function {name: 'checkCaseSensitivity'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 169
// 函数 vocabFiles 的完整影响链路分析
MATCH (f:Function {name: 'vocabFiles'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 170
// 函数 matchesExpectedEncoding 的完整影响链路分析
MATCH (f:Function {name: 'matchesExpectedEncoding'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 171
// 函数 modelNames 的完整影响链路分析
MATCH (f:Function {name: 'modelNames'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 172
// 函数 japaneseBERTTokenizer 的完整影响链路分析
MATCH (f:Function {name: 'japaneseBERTTokenizer'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 173
// 函数 canTokenize 的完整影响链路分析
MATCH (f:Function {name: 'canTokenize'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 174
// 函数 canTokenizeBatch 的完整影响链路分析
MATCH (f:Function {name: 'canTokenizeBatch'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 175
// 函数 removesControlCharactersAndWhitespace 的完整影响链路分析
MATCH (f:Function {name: 'removesControlCharactersAndWhitespace'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 176
// 函数 splitsOnNewlines 的完整影响链路分析
MATCH (f:Function {name: 'splitsOnNewlines'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 177
// 函数 tokenizesCJK 的完整影响链路分析
MATCH (f:Function {name: 'tokenizesCJK'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 178
// 函数 splitsOnPunctuation 的完整影响链路分析
MATCH (f:Function {name: 'splitsOnPunctuation'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 179
// 函数 stripsAccents 的完整影响链路分析
MATCH (f:Function {name: 'stripsAccents'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 180
// 函数 canBeCaseSensitive 的完整影响链路分析
MATCH (f:Function {name: 'canBeCaseSensitive'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 181
// 函数 matchesExpectedTokenization 的完整影响链路分析
MATCH (f:Function {name: 'matchesExpectedTokenization'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 182
// 函数 errorsIfBasicTokenizerIsNotTokenizer 的完整影响链路分析
MATCH (f:Function {name: 'errorsIfBasicTokenizerIsNotTokenizer'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 183
// 函数 canSetBasicTokenizer 的完整影响链路分析
MATCH (f:Function {name: 'canSetBasicTokenizer'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 184
// 函数 canConstructWithFile 的完整影响链路分析
MATCH (f:Function {name: 'canConstructWithFile'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 185
// 函数 canSetUnknownToken 的完整影响链路分析
MATCH (f:Function {name: 'canSetUnknownToken'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 186
// 函数 canSetMaxTokenLength 的完整影响链路分析
MATCH (f:Function {name: 'canSetMaxTokenLength'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 187
// 函数 hasExpectedVocabSize 的完整影响链路分析
MATCH (f:Function {name: 'hasExpectedVocabSize'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 188
// 函数 tokenizationMatchesTokenizedDocument 的完整影响链路分析
MATCH (f:Function {name: 'tokenizationMatchesTokenizedDocument'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 189
// 函数 canSetOptions 的完整影响链路分析
MATCH (f:Function {name: 'canSetOptions'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 190
// 函数 oneObsOneSeparator 的完整影响链路分析
MATCH (f:Function {name: 'oneObsOneSeparator'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 191
// 函数 oneObsOneSeparatorWithPadding 的完整影响链路分析
MATCH (f:Function {name: 'oneObsOneSeparatorWithPadding'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 192
// 函数 oneObsTwoSeparators 的完整影响链路分析
MATCH (f:Function {name: 'oneObsTwoSeparators'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 193
// 函数 oneObsTwoSeparatorsEdgeCase 的完整影响链路分析
MATCH (f:Function {name: 'oneObsTwoSeparatorsEdgeCase'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 194
// 函数 oneObsTwoSeparatorsPadded 的完整影响链路分析
MATCH (f:Function {name: 'oneObsTwoSeparatorsPadded'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 195
// 函数 batchedCase 的完整影响链路分析
MATCH (f:Function {name: 'batchedCase'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 196
// 函数 canUseSentimentAnalysisModel 的完整影响链路分析
MATCH (f:Function {name: 'canUseSentimentAnalysisModel'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 197
// 函数 languageModelErrorsWithSAParams 的完整影响链路分析
MATCH (f:Function {name: 'languageModelErrorsWithSAParams'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 198
// 函数 canSampleDeterministic 的完整影响链路分析
MATCH (f:Function {name: 'canSampleDeterministic'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 199
// 函数 canSampleUniform 的完整影响链路分析
MATCH (f:Function {name: 'canSampleUniform'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 200
// 函数 testForKIsOne 的完整影响链路分析
MATCH (f:Function {name: 'testForKIsOne'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 201
// 函数 testForLargeK 的完整影响链路分析
MATCH (f:Function {name: 'testForLargeK'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 202
// 函数 dlarrayIsSupported 的完整影响链路分析
MATCH (f:Function {name: 'dlarrayIsSupported'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 203
// 函数 setup 的完整影响链路分析
MATCH (f:Function {name: 'setup'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 204
// 函数 teardown 的完整影响链路分析
MATCH (f:Function {name: 'teardown'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 205
// 函数 path 的完整影响链路分析
MATCH (f:Function {name: 'path'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 206
// 函数 modelDirs 的完整影响链路分析
MATCH (f:Function {name: 'modelDirs'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 207
// 函数 loadParameters 的完整影响链路分析
MATCH (f:Function {name: 'loadParameters'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 208
// 函数 verifyLoadStructFields 的完整影响链路分析
MATCH (f:Function {name: 'verifyLoadStructFields'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 209
// 函数 verifyHyperparameters 的完整影响链路分析
MATCH (f:Function {name: 'verifyHyperparameters'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 210
// 函数 verifyWeights 的完整影响链路分析
MATCH (f:Function {name: 'verifyWeights'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 211
// 函数 canUseModel 的完整影响链路分析
MATCH (f:Function {name: 'canUseModel'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 212
// 函数 canAcceptBatches 的完整影响链路分析
MATCH (f:Function {name: 'canAcceptBatches'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 213
// 函数 pasts 的完整影响链路分析
MATCH (f:Function {name: 'pasts'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 214
// 函数 parameters 的完整影响链路分析
MATCH (f:Function {name: 'parameters'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 215
// 函数 verifyFilesExist 的完整影响链路分析
MATCH (f:Function {name: 'verifyFilesExist'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 216
// 函数 outputHasInputSize 的完整影响链路分析
MATCH (f:Function {name: 'outputHasInputSize'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 217
// 函数 outputHasInputSizeWithPasts 的完整影响链路分析
MATCH (f:Function {name: 'outputHasInputSizeWithPasts'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 218
// 函数 weights 的完整影响链路分析
MATCH (f:Function {name: 'weights'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 219
// 函数 encodeGivesCorrectResults 的完整影响链路分析
MATCH (f:Function {name: 'encodeGivesCorrectResults'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 220
// 函数 decodeGivesCorrectResults 的完整影响链路分析
MATCH (f:Function {name: 'decodeGivesCorrectResults'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 221
// 函数 testTokenization 的完整影响链路分析
MATCH (f:Function {name: 'testTokenization'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 222
// 函数 byteEncoderSize 的完整影响链路分析
MATCH (f:Function {name: 'byteEncoderSize'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 223
// 函数 independenceOfInputClass 的完整影响链路分析
MATCH (f:Function {name: 'independenceOfInputClass'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 224
// 函数 commentNotInBPE 的完整影响链路分析
MATCH (f:Function {name: 'commentNotInBPE'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 225
// 函数 decodeInvertsEncode 的完整影响链路分析
MATCH (f:Function {name: 'decodeInvertsEncode'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 226
// 函数 setupEncoder 的完整影响链路分析
MATCH (f:Function {name: 'setupEncoder'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 227
// 函数 modelName 的完整影响链路分析
MATCH (f:Function {name: 'modelName'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 228
// 函数 modelPath 的完整影响链路分析
MATCH (f:Function {name: 'modelPath'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 229
// 函数 parameter 的完整影响链路分析
MATCH (f:Function {name: 'parameter'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 230
// 函数 c 的完整影响链路分析
MATCH (f:Function {name: 'c'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 231
// 函数 newParameters 的完整影响链路分析
MATCH (f:Function {name: 'newParameters'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 232
// 函数 download 的完整影响链路分析
MATCH (f:Function {name: 'download'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 233
// 函数 iCreateDirectoryIfItDoesNotExist 的完整影响链路分析
MATCH (f:Function {name: 'iCreateDirectoryIfItDoesNotExist'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 234
// 函数 iDownloadFileIfItDoesNotExist 的完整影响链路分析
MATCH (f:Function {name: 'iDownloadFileIfItDoesNotExist'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 235
// 函数 numericTokens 的完整影响链路分析
MATCH (f:Function {name: 'numericTokens'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 236
// 函数 word 的完整影响链路分析
MATCH (f:Function {name: 'word'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 237
// 函数 cs 的完整影响链路分析
MATCH (f:Function {name: 'cs'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 238
// 函数 pairs 的完整影响链路分析
MATCH (f:Function {name: 'pairs'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 239
// 函数 sample 的完整影响链路分析
MATCH (f:Function {name: 'sample'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 完整链路查询 240
// 函数 logits 的完整影响链路分析
MATCH (f:Function {name: 'logits'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 变量影响范围查询

-- 变量影响查询 1
// 查看变量 out 的影响范围
MATCH (v:Variable {name: 'out'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 2
// 查看变量 mdl 的影响范围
MATCH (v:Variable {name: 'mdl'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 3
// 查看变量 summary 的影响范围
MATCH (v:Variable {name: 'summary'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 4
// 查看变量 X 的影响范围
MATCH (v:Variable {name: 'X'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 5
// 查看变量 Y 的影响范围
MATCH (v:Variable {name: 'Y'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 6
// 查看变量 predictions 的影响范围
MATCH (v:Variable {name: 'predictions'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 7
// 查看变量 z 的影响范围
MATCH (v:Variable {name: 'z'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 8
// 查看变量 varargout 的影响范围
MATCH (v:Variable {name: 'varargout'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 9
// 查看变量 Z 的影响范围
MATCH (v:Variable {name: 'Z'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 10
// 查看变量 params 的影响范围
MATCH (v:Variable {name: 'params'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 11
// 查看变量 parameters 的影响范围
MATCH (v:Variable {name: 'parameters'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 12
// 查看变量 dirpath 的影响范围
MATCH (v:Variable {name: 'dirpath'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 13
// 查看变量 supportfileName 的影响范围
MATCH (v:Variable {name: 'supportfileName'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 14
// 查看变量 names 的影响范围
MATCH (v:Variable {name: 'names'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 15
// 查看变量 weightsStruct 的影响范围
MATCH (v:Variable {name: 'weightsStruct'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 16
// 查看变量 name 的影响范围
MATCH (v:Variable {name: 'name'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 17
// 查看变量 types 的影响范围
MATCH (v:Variable {name: 'types'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 18
// 查看变量 xsz 的影响范围
MATCH (v:Variable {name: 'xsz'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 19
// 查看变量 filePath 的影响范围
MATCH (v:Variable {name: 'filePath'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 20
// 查看变量 this 的影响范围
MATCH (v:Variable {name: 'this'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 21
// 查看变量 tokens 的影响范围
MATCH (v:Variable {name: 'tokens'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 22
// 查看变量 x 的影响范围
MATCH (v:Variable {name: 'x'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 23
// 查看变量 text 的影响范围
MATCH (v:Variable {name: 'text'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 24
// 查看变量 tok 的影响范围
MATCH (v:Variable {name: 'tok'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 25
// 查看变量 u 的影响范围
MATCH (v:Variable {name: 'u'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 26
// 查看变量 tf 的影响范围
MATCH (v:Variable {name: 'tf'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 27
// 查看变量 vocab 的影响范围
MATCH (v:Variable {name: 'vocab'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 28
// 查看变量 toks 的影响范围
MATCH (v:Variable {name: 'toks'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 29
// 查看变量 idx 的影响范围
MATCH (v:Variable {name: 'idx'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 30
// 查看变量 y 的影响范围
MATCH (v:Variable {name: 'y'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 31
// 查看变量 A 的影响范围
MATCH (v:Variable {name: 'A'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 32
// 查看变量 W 的影响范围
MATCH (v:Variable {name: 'W'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 33
// 查看变量 SharedTestFixtures 的影响范围
MATCH (v:Variable {name: 'SharedTestFixtures'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 34
// 查看变量 validText 的影响范围
MATCH (v:Variable {name: 'validText'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 35
// 查看变量 constraint 的影响范围
MATCH (v:Variable {name: 'constraint'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 36
// 查看变量 tol 的影响范围
MATCH (v:Variable {name: 'tol'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 37
// 查看变量 s 的影响范围
MATCH (v:Variable {name: 's'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 38
// 查看变量 w 的影响范围
MATCH (v:Variable {name: 'w'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 39
// 查看变量 a 的影响范围
MATCH (v:Variable {name: 'a'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 40
// 查看变量 ids 的影响范围
MATCH (v:Variable {name: 'ids'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 41
// 查看变量 vocabFiles 的影响范围
MATCH (v:Variable {name: 'vocabFiles'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 42
// 查看变量 modelNames 的影响范围
MATCH (v:Variable {name: 'modelNames'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 43
// 查看变量 japaneseBERTTokenizer 的影响范围
MATCH (v:Variable {name: 'japaneseBERTTokenizer'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 44
// 查看变量 inferTypeID 的影响范围
MATCH (v:Variable {name: 'inferTypeID'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 45
// 查看变量 path 的影响范围
MATCH (v:Variable {name: 'path'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 46
// 查看变量 modelDirs 的影响范围
MATCH (v:Variable {name: 'modelDirs'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 47
// 查看变量 pasts 的影响范围
MATCH (v:Variable {name: 'pasts'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 48
// 查看变量 weights 的影响范围
MATCH (v:Variable {name: 'weights'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 49
// 查看变量 modelName 的影响范围
MATCH (v:Variable {name: 'modelName'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 50
// 查看变量 modelPath 的影响范围
MATCH (v:Variable {name: 'modelPath'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 51
// 查看变量 parameter 的影响范围
MATCH (v:Variable {name: 'parameter'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 52
// 查看变量 c 的影响范围
MATCH (v:Variable {name: 'c'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 53
// 查看变量 newParameters 的影响范围
MATCH (v:Variable {name: 'newParameters'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 54
// 查看变量 numericTokens 的影响范围
MATCH (v:Variable {name: 'numericTokens'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 55
// 查看变量 word 的影响范围
MATCH (v:Variable {name: 'word'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 56
// 查看变量 cs 的影响范围
MATCH (v:Variable {name: 'cs'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 57
// 查看变量 pairs 的影响范围
MATCH (v:Variable {name: 'pairs'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 58
// 查看变量 sample 的影响范围
MATCH (v:Variable {name: 'sample'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 59
// 查看变量 logits 的影响范围
MATCH (v:Variable {name: 'logits'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 函数影响范围查询

-- 函数影响查询 1
// 查看函数 out 的影响范围
MATCH (f:Function {name: 'out'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 2
// 查看函数 mdl 的影响范围
MATCH (f:Function {name: 'mdl'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 3
// 查看函数 summary 的影响范围
MATCH (f:Function {name: 'summary'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 4
// 查看函数 iIsScalarString 的影响范围
MATCH (f:Function {name: 'iIsScalarString'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 5
// 查看函数 X 的影响范围
MATCH (f:Function {name: 'X'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 6
// 查看函数 Y 的影响范围
MATCH (f:Function {name: 'Y'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 7
// 查看函数 predictions 的影响范围
MATCH (f:Function {name: 'predictions'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 8
// 查看函数 z 的影响范围
MATCH (f:Function {name: 'z'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 9
// 查看函数 varargout 的影响范围
MATCH (f:Function {name: 'varargout'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 10
// 查看函数 mustBeLessThanOrEqualNumLayers 的影响范围
MATCH (f:Function {name: 'mustBeLessThanOrEqualNumLayers'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 11
// 查看函数 mustBeALogicalOrDlarrayLogical 的影响范围
MATCH (f:Function {name: 'mustBeALogicalOrDlarrayLogical'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 12
// 查看函数 mustBeNumericDlarray 的影响范围
MATCH (f:Function {name: 'mustBeNumericDlarray'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 13
// 查看函数 params 的影响范围
MATCH (f:Function {name: 'params'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 14
// 查看函数 dirpath 的影响范围
MATCH (f:Function {name: 'dirpath'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 15
// 查看函数 supportfileName 的影响范围
MATCH (f:Function {name: 'supportfileName'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 16
// 查看函数 names 的影响范围
MATCH (f:Function {name: 'names'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 17
// 查看函数 weightsStruct 的影响范围
MATCH (f:Function {name: 'weightsStruct'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 18
// 查看函数 name 的影响范围
MATCH (f:Function {name: 'name'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 19
// 查看函数 types 的影响范围
MATCH (f:Function {name: 'types'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 20
// 查看函数 filePath 的影响范围
MATCH (f:Function {name: 'filePath'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 21
// 查看函数 is 的影响范围
MATCH (f:Function {name: 'is'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 22
// 查看函数 this 的影响范围
MATCH (f:Function {name: 'this'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 23
// 查看函数 tokens 的影响范围
MATCH (f:Function {name: 'tokens'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 24
// 查看函数 x 的影响范围
MATCH (f:Function {name: 'x'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 25
// 查看函数 text 的影响范围
MATCH (f:Function {name: 'text'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 26
// 查看函数 tok 的影响范围
MATCH (f:Function {name: 'tok'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 27
// 查看函数 u 的影响范围
MATCH (f:Function {name: 'u'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 28
// 查看函数 tf 的影响范围
MATCH (f:Function {name: 'tf'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 29
// 查看函数 vocab 的影响范围
MATCH (f:Function {name: 'vocab'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 30
// 查看函数 mustBeFileOrEncoding 的影响范围
MATCH (f:Function {name: 'mustBeFileOrEncoding'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 31
// 查看函数 toks 的影响范围
MATCH (f:Function {name: 'toks'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 32
// 查看函数 idx 的影响范围
MATCH (f:Function {name: 'idx'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 33
// 查看函数 y 的影响范围
MATCH (f:Function {name: 'y'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 34
// 查看函数 Z 的影响范围
MATCH (f:Function {name: 'Z'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 35
// 查看函数 A 的影响范围
MATCH (f:Function {name: 'A'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 36
// 查看函数 W 的影响范围
MATCH (f:Function {name: 'W'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 37
// 查看函数 canConstructModelWithDefault 的影响范围
MATCH (f:Function {name: 'canConstructModelWithDefault'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 38
// 查看函数 canConstructModelWithNVP 的影响范围
MATCH (f:Function {name: 'canConstructModelWithNVP'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 39
// 查看函数 canConstructLanguageModel 的影响范围
MATCH (f:Function {name: 'canConstructLanguageModel'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 40
// 查看函数 verifyOutputDimSizes 的影响范围
MATCH (f:Function {name: 'verifyOutputDimSizes'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 41
// 查看函数 maskTokenIsRemoved 的影响范围
MATCH (f:Function {name: 'maskTokenIsRemoved'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 42
// 查看函数 inputWithoutMASKRemainsTheSame 的影响范围
MATCH (f:Function {name: 'inputWithoutMASKRemainsTheSame'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 43
// 查看函数 validText 的影响范围
MATCH (f:Function {name: 'validText'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 44
// 查看函数 canConstructAllModels 的影响范围
MATCH (f:Function {name: 'canConstructAllModels'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 45
// 查看函数 canConstructModelWithNVPAndVerifyDefault 的影响范围
MATCH (f:Function {name: 'canConstructModelWithNVPAndVerifyDefault'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 46
// 查看函数 checkBertIgnoreCase 的影响范围
MATCH (f:Function {name: 'checkBertIgnoreCase'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 47
// 查看函数 multicasedVersionIsCaseSensitive 的影响范围
MATCH (f:Function {name: 'multicasedVersionIsCaseSensitive'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 48
// 查看函数 canDoNSP 的影响范围
MATCH (f:Function {name: 'canDoNSP'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 49
// 查看函数 constraint 的影响范围
MATCH (f:Function {name: 'constraint'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 50
// 查看函数 matchesExpectedValue 的影响范围
MATCH (f:Function {name: 'matchesExpectedValue'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 51
// 查看函数 supportsMultipleTypes 的影响范围
MATCH (f:Function {name: 'supportsMultipleTypes'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 52
// 查看函数 tol 的影响范围
MATCH (f:Function {name: 'tol'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 53
// 查看函数 hasExpectedValue 的影响范围
MATCH (f:Function {name: 'hasExpectedValue'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 54
// 查看函数 s 的影响范围
MATCH (f:Function {name: 's'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 55
// 查看函数 resetGlobalSeed 的影响范围
MATCH (f:Function {name: 'resetGlobalSeed'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 56
// 查看函数 doesDropout 的影响范围
MATCH (f:Function {name: 'doesDropout'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 57
// 查看函数 isRandom 的影响范围
MATCH (f:Function {name: 'isRandom'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 58
// 查看函数 supportsDlarrayAndAutodiff 的影响范围
MATCH (f:Function {name: 'supportsDlarrayAndAutodiff'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 59
// 查看函数 returnsValueWhenOneKey 的影响范围
MATCH (f:Function {name: 'returnsValueWhenOneKey'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 60
// 查看函数 isScaledDotProduct 的影响范围
MATCH (f:Function {name: 'isScaledDotProduct'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 61
// 查看函数 isExpectedValue 的影响范围
MATCH (f:Function {name: 'isExpectedValue'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 62
// 查看函数 multipleQueries 的影响范围
MATCH (f:Function {name: 'multipleQueries'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 63
// 查看函数 multipleHeads 的影响范围
MATCH (f:Function {name: 'multipleHeads'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 64
// 查看函数 defaultIsMasked 的影响范围
MATCH (f:Function {name: 'defaultIsMasked'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 65
// 查看函数 canTurnOffMask 的影响范围
MATCH (f:Function {name: 'canTurnOffMask'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 66
// 查看函数 canDropout 的影响范围
MATCH (f:Function {name: 'canDropout'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 67
// 查看函数 defaultIsNoDropout 的影响范围
MATCH (f:Function {name: 'defaultIsNoDropout'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 68
// 查看函数 multipleObservations 的影响范围
MATCH (f:Function {name: 'multipleObservations'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 69
// 查看函数 w 的影响范围
MATCH (f:Function {name: 'w'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 70
// 查看函数 a 的影响范围
MATCH (f:Function {name: 'a'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 71
// 查看函数 verifyDlarrayEqual 的影响范围
MATCH (f:Function {name: 'verifyDlarrayEqual'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 72
// 查看函数 computesExpectedValue 的影响范围
MATCH (f:Function {name: 'computesExpectedValue'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 73
// 查看函数 checkSingleHeadNoFullyConnected 的影响范围
MATCH (f:Function {name: 'checkSingleHeadNoFullyConnected'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 74
// 查看函数 checkMultiHeadNoFullyConnected 的影响范围
MATCH (f:Function {name: 'checkMultiHeadNoFullyConnected'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 75
// 查看函数 checkPastPresentCaching 的影响范围
MATCH (f:Function {name: 'checkPastPresentCaching'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 76
// 查看函数 checkInputOutputFC 的影响范围
MATCH (f:Function {name: 'checkInputOutputFC'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 77
// 查看函数 defaultIsMaksed 的影响范围
MATCH (f:Function {name: 'defaultIsMaksed'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 78
// 查看函数 canBatch 的影响范围
MATCH (f:Function {name: 'canBatch'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 79
// 查看函数 canEncodeSentencePairs 的影响范围
MATCH (f:Function {name: 'canEncodeSentencePairs'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 80
// 查看函数 checkDuplicateSentence 的影响范围
MATCH (f:Function {name: 'checkDuplicateSentence'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 81
// 查看函数 defaultOutputsIsLastLayer 的影响范围
MATCH (f:Function {name: 'defaultOutputsIsLastLayer'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 82
// 查看函数 outputsCanBeUsed 的影响范围
MATCH (f:Function {name: 'outputsCanBeUsed'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 83
// 查看函数 outputsCanDuplicateAndBeOutOfOrder 的影响范围
MATCH (f:Function {name: 'outputsCanDuplicateAndBeOutOfOrder'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 84
// 查看函数 negativeTestOutputs 的影响范围
MATCH (f:Function {name: 'negativeTestOutputs'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 85
// 查看函数 negativeTestSeparatorCode 的影响范围
MATCH (f:Function {name: 'negativeTestSeparatorCode'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 86
// 查看函数 negativeTestPaddingCode 的影响范围
MATCH (f:Function {name: 'negativeTestPaddingCode'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 87
// 查看函数 negativeTestDropoutProb 的影响范围
MATCH (f:Function {name: 'negativeTestDropoutProb'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 88
// 查看函数 negativeTestAttentionDropoutProb 的影响范围
MATCH (f:Function {name: 'negativeTestAttentionDropoutProb'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 89
// 查看函数 negativeInputMask 的影响范围
MATCH (f:Function {name: 'negativeInputMask'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 90
// 查看函数 negativeInputX 的影响范围
MATCH (f:Function {name: 'negativeInputX'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 91
// 查看函数 negativeModelParameters 的影响范围
MATCH (f:Function {name: 'negativeModelParameters'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 92
// 查看函数 errorsForIncorrectModelName 的影响范围
MATCH (f:Function {name: 'errorsForIncorrectModelName'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 93
// 查看函数 canUseInputMask 的影响范围
MATCH (f:Function {name: 'canUseInputMask'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 94
// 查看函数 ids 的影响范围
MATCH (f:Function {name: 'ids'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 95
// 查看函数 canPredictMaskedTokens 的影响范围
MATCH (f:Function {name: 'canPredictMaskedTokens'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 96
// 查看函数 checkProbDistrOverChannelDimBatches 的影响范围
MATCH (f:Function {name: 'checkProbDistrOverChannelDimBatches'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 97
// 查看函数 canConstruct 的影响范围
MATCH (f:Function {name: 'canConstruct'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 98
// 查看函数 canConstructWithNonDefaultModel 的影响范围
MATCH (f:Function {name: 'canConstructWithNonDefaultModel'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 99
// 查看函数 hasExpectedProperties 的影响范围
MATCH (f:Function {name: 'hasExpectedProperties'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 100
// 查看函数 canEncodeOneSentence 的影响范围
MATCH (f:Function {name: 'canEncodeOneSentence'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 101
// 查看函数 canEncodeMultipleSentences 的影响范围
MATCH (f:Function {name: 'canEncodeMultipleSentences'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 102
// 查看函数 canEncodeSentencePair 的影响范围
MATCH (f:Function {name: 'canEncodeSentencePair'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 103
// 查看函数 canEncodeMultipleSentencePairs 的影响范围
MATCH (f:Function {name: 'canEncodeMultipleSentencePairs'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 104
// 查看函数 errorsForDifferentNumberOfSentencePairObservations 的影响范围
MATCH (f:Function {name: 'errorsForDifferentNumberOfSentencePairObservations'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 105
// 查看函数 canDecode 的影响范围
MATCH (f:Function {name: 'canDecode'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 106
// 查看函数 canDecodeMultipleObservations 的影响范围
MATCH (f:Function {name: 'canDecodeMultipleObservations'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 107
// 查看函数 canDecodePaddedBatch 的影响范围
MATCH (f:Function {name: 'canDecodePaddedBatch'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 108
// 查看函数 canIgnoreCase 的影响范围
MATCH (f:Function {name: 'canIgnoreCase'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 109
// 查看函数 checkCaseSensitivity 的影响范围
MATCH (f:Function {name: 'checkCaseSensitivity'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 110
// 查看函数 vocabFiles 的影响范围
MATCH (f:Function {name: 'vocabFiles'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 111
// 查看函数 matchesExpectedEncoding 的影响范围
MATCH (f:Function {name: 'matchesExpectedEncoding'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 112
// 查看函数 modelNames 的影响范围
MATCH (f:Function {name: 'modelNames'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 113
// 查看函数 japaneseBERTTokenizer 的影响范围
MATCH (f:Function {name: 'japaneseBERTTokenizer'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 114
// 查看函数 canTokenize 的影响范围
MATCH (f:Function {name: 'canTokenize'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 115
// 查看函数 canTokenizeBatch 的影响范围
MATCH (f:Function {name: 'canTokenizeBatch'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 116
// 查看函数 removesControlCharactersAndWhitespace 的影响范围
MATCH (f:Function {name: 'removesControlCharactersAndWhitespace'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 117
// 查看函数 splitsOnNewlines 的影响范围
MATCH (f:Function {name: 'splitsOnNewlines'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 118
// 查看函数 tokenizesCJK 的影响范围
MATCH (f:Function {name: 'tokenizesCJK'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 119
// 查看函数 splitsOnPunctuation 的影响范围
MATCH (f:Function {name: 'splitsOnPunctuation'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 120
// 查看函数 stripsAccents 的影响范围
MATCH (f:Function {name: 'stripsAccents'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 121
// 查看函数 canBeCaseSensitive 的影响范围
MATCH (f:Function {name: 'canBeCaseSensitive'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 122
// 查看函数 matchesExpectedTokenization 的影响范围
MATCH (f:Function {name: 'matchesExpectedTokenization'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 123
// 查看函数 errorsIfBasicTokenizerIsNotTokenizer 的影响范围
MATCH (f:Function {name: 'errorsIfBasicTokenizerIsNotTokenizer'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 124
// 查看函数 canSetBasicTokenizer 的影响范围
MATCH (f:Function {name: 'canSetBasicTokenizer'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 125
// 查看函数 canConstructWithFile 的影响范围
MATCH (f:Function {name: 'canConstructWithFile'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 126
// 查看函数 canSetUnknownToken 的影响范围
MATCH (f:Function {name: 'canSetUnknownToken'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 127
// 查看函数 canSetMaxTokenLength 的影响范围
MATCH (f:Function {name: 'canSetMaxTokenLength'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 128
// 查看函数 hasExpectedVocabSize 的影响范围
MATCH (f:Function {name: 'hasExpectedVocabSize'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 129
// 查看函数 tokenizationMatchesTokenizedDocument 的影响范围
MATCH (f:Function {name: 'tokenizationMatchesTokenizedDocument'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 130
// 查看函数 canSetOptions 的影响范围
MATCH (f:Function {name: 'canSetOptions'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 131
// 查看函数 oneObsOneSeparator 的影响范围
MATCH (f:Function {name: 'oneObsOneSeparator'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 132
// 查看函数 oneObsOneSeparatorWithPadding 的影响范围
MATCH (f:Function {name: 'oneObsOneSeparatorWithPadding'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 133
// 查看函数 oneObsTwoSeparators 的影响范围
MATCH (f:Function {name: 'oneObsTwoSeparators'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 134
// 查看函数 oneObsTwoSeparatorsEdgeCase 的影响范围
MATCH (f:Function {name: 'oneObsTwoSeparatorsEdgeCase'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 135
// 查看函数 oneObsTwoSeparatorsPadded 的影响范围
MATCH (f:Function {name: 'oneObsTwoSeparatorsPadded'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 136
// 查看函数 batchedCase 的影响范围
MATCH (f:Function {name: 'batchedCase'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 137
// 查看函数 canUseSentimentAnalysisModel 的影响范围
MATCH (f:Function {name: 'canUseSentimentAnalysisModel'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 138
// 查看函数 languageModelErrorsWithSAParams 的影响范围
MATCH (f:Function {name: 'languageModelErrorsWithSAParams'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 139
// 查看函数 canSampleDeterministic 的影响范围
MATCH (f:Function {name: 'canSampleDeterministic'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 140
// 查看函数 canSampleUniform 的影响范围
MATCH (f:Function {name: 'canSampleUniform'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 141
// 查看函数 testForKIsOne 的影响范围
MATCH (f:Function {name: 'testForKIsOne'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 142
// 查看函数 testForLargeK 的影响范围
MATCH (f:Function {name: 'testForLargeK'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 143
// 查看函数 dlarrayIsSupported 的影响范围
MATCH (f:Function {name: 'dlarrayIsSupported'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 144
// 查看函数 setup 的影响范围
MATCH (f:Function {name: 'setup'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 145
// 查看函数 teardown 的影响范围
MATCH (f:Function {name: 'teardown'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 146
// 查看函数 path 的影响范围
MATCH (f:Function {name: 'path'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 147
// 查看函数 modelDirs 的影响范围
MATCH (f:Function {name: 'modelDirs'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 148
// 查看函数 loadParameters 的影响范围
MATCH (f:Function {name: 'loadParameters'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 149
// 查看函数 verifyLoadStructFields 的影响范围
MATCH (f:Function {name: 'verifyLoadStructFields'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 150
// 查看函数 verifyHyperparameters 的影响范围
MATCH (f:Function {name: 'verifyHyperparameters'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 151
// 查看函数 verifyWeights 的影响范围
MATCH (f:Function {name: 'verifyWeights'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 152
// 查看函数 canUseModel 的影响范围
MATCH (f:Function {name: 'canUseModel'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 153
// 查看函数 canAcceptBatches 的影响范围
MATCH (f:Function {name: 'canAcceptBatches'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 154
// 查看函数 pasts 的影响范围
MATCH (f:Function {name: 'pasts'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 155
// 查看函数 parameters 的影响范围
MATCH (f:Function {name: 'parameters'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 156
// 查看函数 verifyFilesExist 的影响范围
MATCH (f:Function {name: 'verifyFilesExist'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 157
// 查看函数 outputHasInputSize 的影响范围
MATCH (f:Function {name: 'outputHasInputSize'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 158
// 查看函数 outputHasInputSizeWithPasts 的影响范围
MATCH (f:Function {name: 'outputHasInputSizeWithPasts'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 159
// 查看函数 weights 的影响范围
MATCH (f:Function {name: 'weights'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 160
// 查看函数 encodeGivesCorrectResults 的影响范围
MATCH (f:Function {name: 'encodeGivesCorrectResults'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 161
// 查看函数 decodeGivesCorrectResults 的影响范围
MATCH (f:Function {name: 'decodeGivesCorrectResults'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 162
// 查看函数 testTokenization 的影响范围
MATCH (f:Function {name: 'testTokenization'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 163
// 查看函数 byteEncoderSize 的影响范围
MATCH (f:Function {name: 'byteEncoderSize'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 164
// 查看函数 independenceOfInputClass 的影响范围
MATCH (f:Function {name: 'independenceOfInputClass'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 165
// 查看函数 commentNotInBPE 的影响范围
MATCH (f:Function {name: 'commentNotInBPE'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 166
// 查看函数 decodeInvertsEncode 的影响范围
MATCH (f:Function {name: 'decodeInvertsEncode'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 167
// 查看函数 setupEncoder 的影响范围
MATCH (f:Function {name: 'setupEncoder'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 168
// 查看函数 modelName 的影响范围
MATCH (f:Function {name: 'modelName'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 169
// 查看函数 modelPath 的影响范围
MATCH (f:Function {name: 'modelPath'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 170
// 查看函数 parameter 的影响范围
MATCH (f:Function {name: 'parameter'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 171
// 查看函数 c 的影响范围
MATCH (f:Function {name: 'c'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 172
// 查看函数 newParameters 的影响范围
MATCH (f:Function {name: 'newParameters'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 173
// 查看函数 download 的影响范围
MATCH (f:Function {name: 'download'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 174
// 查看函数 iCreateDirectoryIfItDoesNotExist 的影响范围
MATCH (f:Function {name: 'iCreateDirectoryIfItDoesNotExist'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 175
// 查看函数 iDownloadFileIfItDoesNotExist 的影响范围
MATCH (f:Function {name: 'iDownloadFileIfItDoesNotExist'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 176
// 查看函数 numericTokens 的影响范围
MATCH (f:Function {name: 'numericTokens'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 177
// 查看函数 word 的影响范围
MATCH (f:Function {name: 'word'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 178
// 查看函数 cs 的影响范围
MATCH (f:Function {name: 'cs'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 179
// 查看函数 pairs 的影响范围
MATCH (f:Function {name: 'pairs'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 180
// 查看函数 sample 的影响范围
MATCH (f:Function {name: 'sample'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 函数影响查询 181
// 查看函数 logits 的影响范围
MATCH (f:Function {name: 'logits'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 综合影响范围查询

-- 综合影响查询 1
// 所有变更的综合影响分析
MATCH (n)
WHERE (n:Variable AND n.name IN ['out', 'mdl', 'summary', 'X', 'Y', 'predictions', 'z', 'varargout', 'Z', 'params', 'parameters', 'dirpath', 'supportfileName', 'names', 'weightsStruct', 'name', 'types', 'xsz', 'filePath', 'this', 'tokens', 'x', 'text', 'tok', 'u', 'tf', 'vocab', 'toks', 'idx', 'y', 'A', 'W', 'SharedTestFixtures', 'validText', 'constraint', 'tol', 's', 'w', 'a', 'ids', 'vocabFiles', 'modelNames', 'japaneseBERTTokenizer', 'inferTypeID', 'path', 'modelDirs', 'pasts', 'weights', 'modelName', 'modelPath', 'parameter', 'c', 'newParameters', 'numericTokens', 'word', 'cs', 'pairs', 'sample', 'logits'])
   OR (n:Function AND n.name IN ['out', 'mdl', 'summary', 'iIsScalarString', 'X', 'Y', 'predictions', 'z', 'varargout', 'mustBeLessThanOrEqualNumLayers', 'mustBeALogicalOrDlarrayLogical', 'mustBeNumericDlarray', 'params', 'dirpath', 'supportfileName', 'names', 'weightsStruct', 'name', 'types', 'filePath', 'is', 'this', 'tokens', 'x', 'text', 'tok', 'u', 'tf', 'vocab', 'mustBeFileOrEncoding', 'toks', 'idx', 'y', 'Z', 'A', 'W', 'canConstructModelWithDefault', 'canConstructModelWithNVP', 'canConstructLanguageModel', 'verifyOutputDimSizes', 'maskTokenIsRemoved', 'inputWithoutMASKRemainsTheSame', 'validText', 'canConstructAllModels', 'canConstructModelWithNVPAndVerifyDefault', 'checkBertIgnoreCase', 'multicasedVersionIsCaseSensitive', 'canDoNSP', 'constraint', 'matchesExpectedValue', 'supportsMultipleTypes', 'tol', 'hasExpectedValue', 's', 'resetGlobalSeed', 'doesDropout', 'isRandom', 'supportsDlarrayAndAutodiff', 'returnsValueWhenOneKey', 'isScaledDotProduct', 'isExpectedValue', 'multipleQueries', 'multipleHeads', 'defaultIsMasked', 'canTurnOffMask', 'canDropout', 'defaultIsNoDropout', 'multipleObservations', 'w', 'a', 'verifyDlarrayEqual', 'computesExpectedValue', 'checkSingleHeadNoFullyConnected', 'checkMultiHeadNoFullyConnected', 'checkPastPresentCaching', 'checkInputOutputFC', 'defaultIsMaksed', 'canBatch', 'canEncodeSentencePairs', 'checkDuplicateSentence', 'defaultOutputsIsLastLayer', 'outputsCanBeUsed', 'outputsCanDuplicateAndBeOutOfOrder', 'negativeTestOutputs', 'negativeTestSeparatorCode', 'negativeTestPaddingCode', 'negativeTestDropoutProb', 'negativeTestAttentionDropoutProb', 'negativeInputMask', 'negativeInputX', 'negativeModelParameters', 'errorsForIncorrectModelName', 'canUseInputMask', 'ids', 'canPredictMaskedTokens', 'checkProbDistrOverChannelDimBatches', 'canConstruct', 'canConstructWithNonDefaultModel', 'hasExpectedProperties', 'canEncodeOneSentence', 'canEncodeMultipleSentences', 'canEncodeSentencePair', 'canEncodeMultipleSentencePairs', 'errorsForDifferentNumberOfSentencePairObservations', 'canDecode', 'canDecodeMultipleObservations', 'canDecodePaddedBatch', 'canIgnoreCase', 'checkCaseSensitivity', 'vocabFiles', 'matchesExpectedEncoding', 'modelNames', 'japaneseBERTTokenizer', 'canTokenize', 'canTokenizeBatch', 'removesControlCharactersAndWhitespace', 'splitsOnNewlines', 'tokenizesCJK', 'splitsOnPunctuation', 'stripsAccents', 'canBeCaseSensitive', 'matchesExpectedTokenization', 'errorsIfBasicTokenizerIsNotTokenizer', 'canSetBasicTokenizer', 'canConstructWithFile', 'canSetUnknownToken', 'canSetMaxTokenLength', 'hasExpectedVocabSize', 'tokenizationMatchesTokenizedDocument', 'canSetOptions', 'oneObsOneSeparator', 'oneObsOneSeparatorWithPadding', 'oneObsTwoSeparators', 'oneObsTwoSeparatorsEdgeCase', 'oneObsTwoSeparatorsPadded', 'batchedCase', 'canUseSentimentAnalysisModel', 'languageModelErrorsWithSAParams', 'canSampleDeterministic', 'canSampleUniform', 'testForKIsOne', 'testForLargeK', 'dlarrayIsSupported', 'setup', 'teardown', 'path', 'modelDirs', 'loadParameters', 'verifyLoadStructFields', 'verifyHyperparameters', 'verifyWeights', 'canUseModel', 'canAcceptBatches', 'pasts', 'parameters', 'verifyFilesExist', 'outputHasInputSize', 'outputHasInputSizeWithPasts', 'weights', 'encodeGivesCorrectResults', 'decodeGivesCorrectResults', 'testTokenization', 'byteEncoderSize', 'independenceOfInputClass', 'commentNotInBPE', 'decodeInvertsEncode', 'setupEncoder', 'modelName', 'modelPath', 'parameter', 'c', 'newParameters', 'download', 'iCreateDirectoryIfItDoesNotExist', 'iDownloadFileIfItDoesNotExist', 'numericTokens', 'word', 'cs', 'pairs', 'sample', 'logits'])
   OR (n:Script AND n.name IN [])
OPTIONAL MATCH (n)-[r1:RELATES_TO]->(related1)
OPTIONAL MATCH (n)-[r2:IMPLEMENTED_IN]->(related2)
OPTIONAL MATCH (related1)-[r3:RELATES_TO]->(related3)
OPTIONAL MATCH (related1)-[r4:IMPLEMENTED_IN]->(related4)
OPTIONAL MATCH (related2)-[r5:RELATES_TO]->(related5)
OPTIONAL MATCH (related2)-[r6:IMPLEMENTED_IN]->(related6)
RETURN n, related1, related2, related3, related4, related5, related6,
       r1, r2, r3, r4, r5, r6
ORDER BY labels(n), n.name


-- ==========================================
-- 提交 2: 26753813 - feat: 添加GraphRAG版本的MATLAB代码影响分析系统
-- ==========================================

-- 完整影响链路查询（推荐优先使用）
-- 显示变更的完整影响范围，包括所有相关节点和关系

-- 完整链路查询 1
// 变量 query 的完整影响链路分析
MATCH (v:Variable {name: 'query'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 2
// 变量 result 的完整影响链路分析
MATCH (v:Variable {name: 'result'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 3
// 变量 records 的完整影响链路分析
MATCH (v:Variable {name: 'records'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 4
// 变量 query_text 的完整影响链路分析
MATCH (v:Variable {name: 'query_text'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 5
// 变量 return_context 的完整影响链路分析
MATCH (v:Variable {name: 'return_context'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 6
// 变量 chinese_report 的完整影响链路分析
MATCH (v:Variable {name: 'chinese_report'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 7
// 变量 comprehensive_result 的完整影响链路分析
MATCH (v:Variable {name: 'comprehensive_result'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 8
// 变量 driver 的完整影响链路分析
MATCH (v:Variable {name: 'driver'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 9
// 变量 llm 的完整影响链路分析
MATCH (v:Variable {name: 'llm'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 10
// 变量 matlab_query_templates 的完整影响链路分析
MATCH (v:Variable {name: 'matlab_query_templates'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 11
// 变量 schema 的完整影响链路分析
MATCH (v:Variable {name: 'schema'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 12
// 变量 retriever 的完整影响链路分析
MATCH (v:Variable {name: 'retriever'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 13
// 变量 graphrag 的完整影响链路分析
MATCH (v:Variable {name: 'graphrag'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 14
// 变量 query_templates 的完整影响链路分析
MATCH (v:Variable {name: 'query_templates'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 15
// 变量 analyzer 的完整影响链路分析
MATCH (v:Variable {name: 'analyzer'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 16
// 变量 git_diff 的完整影响链路分析
MATCH (v:Variable {name: 'git_diff'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 17
// 变量 analysis_result 的完整影响链路分析
MATCH (v:Variable {name: 'analysis_result'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 18
// 变量 recent_analysis 的完整影响链路分析
MATCH (v:Variable {name: 'recent_analysis'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 19
// 变量 staged_analysis 的完整影响链路分析
MATCH (v:Variable {name: 'staged_analysis'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 20
// 变量 working_analysis 的完整影响链路分析
MATCH (v:Variable {name: 'working_analysis'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 21
// 变量 analysis 的完整影响链路分析
MATCH (v:Variable {name: 'analysis'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 22
// 变量 python 的完整影响链路分析
MATCH (v:Variable {name: 'python'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 23
// 变量 model_name 的完整影响链路分析
MATCH (v:Variable {name: 'model_name'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 24
// 变量 model_params 的完整影响链路分析
MATCH (v:Variable {name: 'model_params'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 25
// 变量 auth 的完整影响链路分析
MATCH (v:Variable {name: 'auth'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 26
// 变量 str 的完整影响链路分析
MATCH (v:Variable {name: 'str'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 27
// 变量 repo_path 的完整影响链路分析
MATCH (v:Variable {name: 'repo_path'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 28
// 变量 cmd 的完整影响链路分析
MATCH (v:Variable {name: 'cmd'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 29
// 变量 int 的完整影响链路分析
MATCH (v:Variable {name: 'int'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 30
// 变量 pretty 的完整影响链路分析
MATCH (v:Variable {name: 'pretty'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 31
// 变量 commits 的完整影响链路分析
MATCH (v:Variable {name: 'commits'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 32
// 变量 parts 的完整影响链路分析
MATCH (v:Variable {name: 'parts'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 33
// 变量 history 的完整影响链路分析
MATCH (v:Variable {name: 'history'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 34
// 变量 current_branch 的完整影响链路分析
MATCH (v:Variable {name: 'current_branch'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 35
// 变量 remote_branches 的完整影响链路分析
MATCH (v:Variable {name: 'remote_branches'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 36
// 变量 git 的完整影响链路分析
MATCH (v:Variable {name: 'git'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 37
// 变量 neo4j_schema 的完整影响链路分析
MATCH (v:Variable {name: 'neo4j_schema'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 38
// 变量 neo4j_database 的完整影响链路分析
MATCH (v:Variable {name: 'neo4j_database'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 39
// 变量 impact_analysis_template 的完整影响链路分析
MATCH (v:Variable {name: 'impact_analysis_template'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 40
// 变量 system_instructions 的完整影响链路分析
MATCH (v:Variable {name: 'system_instructions'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 41
// 变量 template 的完整影响链路分析
MATCH (v:Variable {name: 'template'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 42
// 变量 prompt_template 的完整影响链路分析
MATCH (v:Variable {name: 'prompt_template'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 43
// 变量 labels 的完整影响链路分析
MATCH (v:Variable {name: 'labels'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 44
// 变量 types 的完整影响链路分析
MATCH (v:Variable {name: 'types'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 45
// 变量 schema_info 的完整影响链路分析
MATCH (v:Variable {name: 'schema_info'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 46
// 变量 record 的完整影响链路分析
MATCH (v:Variable {name: 'record'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 47
// 变量 changes 的完整影响链路分析
MATCH (v:Variable {name: 'changes'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 48
// 变量 lines 的完整影响链路分析
MATCH (v:Variable {name: 'lines'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 49
// 变量 current_file 的完整影响链路分析
MATCH (v:Variable {name: 'current_file'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 50
// 变量 var_match 的完整影响链路分析
MATCH (v:Variable {name: 'var_match'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 51
// 变量 var_name 的完整影响链路分析
MATCH (v:Variable {name: 'var_name'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 52
// 变量 func_match 的完整影响链路分析
MATCH (v:Variable {name: 'func_match'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 53
// 变量 func_name 的完整影响链路分析
MATCH (v:Variable {name: 'func_name'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 54
// 变量 queries 的完整影响链路分析
MATCH (v:Variable {name: 'queries'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 55
// 变量 bool 的完整影响链路分析
MATCH (v:Variable {name: 'bool'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 56
// 变量 使用GraphRAG分析Git变更影响范围 的完整影响链路分析
MATCH (v:Variable {name: '使用GraphRAG分析Git变更影响范围'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 57
// 变量 analysis_results 的完整影响链路分析
MATCH (v:Variable {name: 'analysis_results'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 58
// 变量 comprehensive_query 的完整影响链路分析
MATCH (v:Variable {name: 'comprehensive_query'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 59
// 变量 all_analyses 的完整影响链路分析
MATCH (v:Variable {name: 'all_analyses'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 60
// 变量 diff 的完整影响链路分析
MATCH (v:Variable {name: 'diff'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 61
// 变量 encoding 的完整影响链路分析
MATCH (v:Variable {name: 'encoding'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 62
// 变量 comp_analysis 的完整影响链路分析
MATCH (v:Variable {name: 'comp_analysis'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 63
// 变量 影响范围分析系统 的完整影响链路分析
MATCH (v:Variable {name: '影响范围分析系统'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 64
// 变量 branch_info 的完整影响链路分析
MATCH (v:Variable {name: 'branch_info'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 65
// 变量 all_changes 的完整影响链路分析
MATCH (v:Variable {name: 'all_changes'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 66
// 变量 combined_diff 的完整影响链路分析
MATCH (v:Variable {name: 'combined_diff'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 67
// 变量 __name__ 的完整影响链路分析
MATCH (v:Variable {name: '__name__'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 68
// 变量 测试GraphRAG核心组件 的完整影响链路分析
MATCH (v:Variable {name: '测试GraphRAG核心组件'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 69
// 变量 test_query 的完整影响链路分析
MATCH (v:Variable {name: 'test_query'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 70
// 变量 n 的完整影响链路分析
MATCH (v:Variable {name: 'n'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 71
// 变量 staged_diff 的完整影响链路分析
MATCH (v:Variable {name: 'staged_diff'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 72
// 变量 working_diff 的完整影响链路分析
MATCH (v:Variable {name: 'working_diff'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 73
// 变量 test_git_diff 的完整影响链路分析
MATCH (v:Variable {name: 'test_git_diff'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 74
// 变量 multiplier 的完整影响链路分析
MATCH (v:Variable {name: 'multiplier'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 75
// 变量 test_results 的完整影响链路分析
MATCH (v:Variable {name: 'test_results'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 76
// 变量 status 的完整影响链路分析
MATCH (v:Variable {name: 'status'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 77
// 变量 passed_tests 的完整影响链路分析
MATCH (v:Variable {name: 'passed_tests'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 78
// 变量 total_tests 的完整影响链路分析
MATCH (v:Variable {name: 'total_tests'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 79
// 函数 result 的完整影响链路分析
MATCH (f:Function {name: 'result'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 变量影响范围查询

-- 变量影响查询 1
// 查看变量 query 的影响范围
MATCH (v:Variable {name: 'query'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 2
// 查看变量 result 的影响范围
MATCH (v:Variable {name: 'result'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 3
// 查看变量 records 的影响范围
MATCH (v:Variable {name: 'records'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 4
// 查看变量 query_text 的影响范围
MATCH (v:Variable {name: 'query_text'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 5
// 查看变量 return_context 的影响范围
MATCH (v:Variable {name: 'return_context'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 6
// 查看变量 chinese_report 的影响范围
MATCH (v:Variable {name: 'chinese_report'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 7
// 查看变量 comprehensive_result 的影响范围
MATCH (v:Variable {name: 'comprehensive_result'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 8
// 查看变量 driver 的影响范围
MATCH (v:Variable {name: 'driver'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 9
// 查看变量 llm 的影响范围
MATCH (v:Variable {name: 'llm'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 10
// 查看变量 matlab_query_templates 的影响范围
MATCH (v:Variable {name: 'matlab_query_templates'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 11
// 查看变量 schema 的影响范围
MATCH (v:Variable {name: 'schema'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 12
// 查看变量 retriever 的影响范围
MATCH (v:Variable {name: 'retriever'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 13
// 查看变量 graphrag 的影响范围
MATCH (v:Variable {name: 'graphrag'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 14
// 查看变量 query_templates 的影响范围
MATCH (v:Variable {name: 'query_templates'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 15
// 查看变量 analyzer 的影响范围
MATCH (v:Variable {name: 'analyzer'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 16
// 查看变量 git_diff 的影响范围
MATCH (v:Variable {name: 'git_diff'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 17
// 查看变量 analysis_result 的影响范围
MATCH (v:Variable {name: 'analysis_result'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 18
// 查看变量 recent_analysis 的影响范围
MATCH (v:Variable {name: 'recent_analysis'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 19
// 查看变量 staged_analysis 的影响范围
MATCH (v:Variable {name: 'staged_analysis'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 20
// 查看变量 working_analysis 的影响范围
MATCH (v:Variable {name: 'working_analysis'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 21
// 查看变量 analysis 的影响范围
MATCH (v:Variable {name: 'analysis'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 22
// 查看变量 python 的影响范围
MATCH (v:Variable {name: 'python'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 23
// 查看变量 model_name 的影响范围
MATCH (v:Variable {name: 'model_name'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 24
// 查看变量 model_params 的影响范围
MATCH (v:Variable {name: 'model_params'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 25
// 查看变量 auth 的影响范围
MATCH (v:Variable {name: 'auth'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 26
// 查看变量 str 的影响范围
MATCH (v:Variable {name: 'str'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 27
// 查看变量 repo_path 的影响范围
MATCH (v:Variable {name: 'repo_path'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 28
// 查看变量 cmd 的影响范围
MATCH (v:Variable {name: 'cmd'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 29
// 查看变量 int 的影响范围
MATCH (v:Variable {name: 'int'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 30
// 查看变量 pretty 的影响范围
MATCH (v:Variable {name: 'pretty'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 31
// 查看变量 commits 的影响范围
MATCH (v:Variable {name: 'commits'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 32
// 查看变量 parts 的影响范围
MATCH (v:Variable {name: 'parts'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 33
// 查看变量 history 的影响范围
MATCH (v:Variable {name: 'history'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 34
// 查看变量 current_branch 的影响范围
MATCH (v:Variable {name: 'current_branch'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 35
// 查看变量 remote_branches 的影响范围
MATCH (v:Variable {name: 'remote_branches'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 36
// 查看变量 git 的影响范围
MATCH (v:Variable {name: 'git'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 37
// 查看变量 neo4j_schema 的影响范围
MATCH (v:Variable {name: 'neo4j_schema'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 38
// 查看变量 neo4j_database 的影响范围
MATCH (v:Variable {name: 'neo4j_database'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 39
// 查看变量 impact_analysis_template 的影响范围
MATCH (v:Variable {name: 'impact_analysis_template'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 40
// 查看变量 system_instructions 的影响范围
MATCH (v:Variable {name: 'system_instructions'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 41
// 查看变量 template 的影响范围
MATCH (v:Variable {name: 'template'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 42
// 查看变量 prompt_template 的影响范围
MATCH (v:Variable {name: 'prompt_template'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 43
// 查看变量 labels 的影响范围
MATCH (v:Variable {name: 'labels'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 44
// 查看变量 types 的影响范围
MATCH (v:Variable {name: 'types'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 45
// 查看变量 schema_info 的影响范围
MATCH (v:Variable {name: 'schema_info'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 46
// 查看变量 record 的影响范围
MATCH (v:Variable {name: 'record'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 47
// 查看变量 changes 的影响范围
MATCH (v:Variable {name: 'changes'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 48
// 查看变量 lines 的影响范围
MATCH (v:Variable {name: 'lines'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 49
// 查看变量 current_file 的影响范围
MATCH (v:Variable {name: 'current_file'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 50
// 查看变量 var_match 的影响范围
MATCH (v:Variable {name: 'var_match'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 51
// 查看变量 var_name 的影响范围
MATCH (v:Variable {name: 'var_name'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 52
// 查看变量 func_match 的影响范围
MATCH (v:Variable {name: 'func_match'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 53
// 查看变量 func_name 的影响范围
MATCH (v:Variable {name: 'func_name'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 54
// 查看变量 queries 的影响范围
MATCH (v:Variable {name: 'queries'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 55
// 查看变量 bool 的影响范围
MATCH (v:Variable {name: 'bool'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 56
// 查看变量 使用GraphRAG分析Git变更影响范围 的影响范围
MATCH (v:Variable {name: '使用GraphRAG分析Git变更影响范围'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 57
// 查看变量 analysis_results 的影响范围
MATCH (v:Variable {name: 'analysis_results'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 58
// 查看变量 comprehensive_query 的影响范围
MATCH (v:Variable {name: 'comprehensive_query'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 59
// 查看变量 all_analyses 的影响范围
MATCH (v:Variable {name: 'all_analyses'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 60
// 查看变量 diff 的影响范围
MATCH (v:Variable {name: 'diff'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 61
// 查看变量 encoding 的影响范围
MATCH (v:Variable {name: 'encoding'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 62
// 查看变量 comp_analysis 的影响范围
MATCH (v:Variable {name: 'comp_analysis'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 63
// 查看变量 影响范围分析系统 的影响范围
MATCH (v:Variable {name: '影响范围分析系统'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 64
// 查看变量 branch_info 的影响范围
MATCH (v:Variable {name: 'branch_info'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 65
// 查看变量 all_changes 的影响范围
MATCH (v:Variable {name: 'all_changes'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 66
// 查看变量 combined_diff 的影响范围
MATCH (v:Variable {name: 'combined_diff'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 67
// 查看变量 __name__ 的影响范围
MATCH (v:Variable {name: '__name__'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 68
// 查看变量 测试GraphRAG核心组件 的影响范围
MATCH (v:Variable {name: '测试GraphRAG核心组件'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 69
// 查看变量 test_query 的影响范围
MATCH (v:Variable {name: 'test_query'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 70
// 查看变量 n 的影响范围
MATCH (v:Variable {name: 'n'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 71
// 查看变量 staged_diff 的影响范围
MATCH (v:Variable {name: 'staged_diff'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 72
// 查看变量 working_diff 的影响范围
MATCH (v:Variable {name: 'working_diff'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 73
// 查看变量 test_git_diff 的影响范围
MATCH (v:Variable {name: 'test_git_diff'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 74
// 查看变量 multiplier 的影响范围
MATCH (v:Variable {name: 'multiplier'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 75
// 查看变量 test_results 的影响范围
MATCH (v:Variable {name: 'test_results'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 76
// 查看变量 status 的影响范围
MATCH (v:Variable {name: 'status'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 77
// 查看变量 passed_tests 的影响范围
MATCH (v:Variable {name: 'passed_tests'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 78
// 查看变量 total_tests 的影响范围
MATCH (v:Variable {name: 'total_tests'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 函数影响范围查询

-- 函数影响查询 1
// 查看函数 result 的影响范围
MATCH (f:Function {name: 'result'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 综合影响范围查询

-- 综合影响查询 1
// 所有变更的综合影响分析
MATCH (n)
WHERE (n:Variable AND n.name IN ['query', 'result', 'records', 'query_text', 'return_context', 'chinese_report', 'comprehensive_result', 'driver', 'llm', 'matlab_query_templates', 'schema', 'retriever', 'graphrag', 'query_templates', 'analyzer', 'git_diff', 'analysis_result', 'recent_analysis', 'staged_analysis', 'working_analysis', 'analysis', 'python', 'model_name', 'model_params', 'auth', 'str', 'repo_path', 'cmd', 'int', 'pretty', 'commits', 'parts', 'history', 'current_branch', 'remote_branches', 'git', 'neo4j_schema', 'neo4j_database', 'impact_analysis_template', 'system_instructions', 'template', 'prompt_template', 'labels', 'types', 'schema_info', 'record', 'changes', 'lines', 'current_file', 'var_match', 'var_name', 'func_match', 'func_name', 'queries', 'bool', '使用GraphRAG分析Git变更影响范围', 'analysis_results', 'comprehensive_query', 'all_analyses', 'diff', 'encoding', 'comp_analysis', '影响范围分析系统', 'branch_info', 'all_changes', 'combined_diff', '__name__', '测试GraphRAG核心组件', 'test_query', 'n', 'staged_diff', 'working_diff', 'test_git_diff', 'multiplier', 'test_results', 'status', 'passed_tests', 'total_tests'])
   OR (n:Function AND n.name IN ['result'])
   OR (n:Script AND n.name IN [])
OPTIONAL MATCH (n)-[r1:RELATES_TO]->(related1)
OPTIONAL MATCH (n)-[r2:IMPLEMENTED_IN]->(related2)
OPTIONAL MATCH (related1)-[r3:RELATES_TO]->(related3)
OPTIONAL MATCH (related1)-[r4:IMPLEMENTED_IN]->(related4)
OPTIONAL MATCH (related2)-[r5:RELATES_TO]->(related5)
OPTIONAL MATCH (related2)-[r6:IMPLEMENTED_IN]->(related6)
RETURN n, related1, related2, related3, related4, related5, related6,
       r1, r2, r3, r4, r5, r6
ORDER BY labels(n), n.name


-- ==========================================
-- 提交 3: dffd484e - Fix VertexAILLM (#342)
-- ==========================================

-- 完整影响链路查询（推荐优先使用）
-- 显示变更的完整影响范围，包括所有相关节点和关系

-- 完整链路查询 1
// 变量 parameters 的完整影响链路分析
MATCH (v:Variable {name: 'parameters'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 2
// 变量 person_tool_parameters 的完整影响链路分析
MATCH (v:Variable {name: 'person_tool_parameters'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 3
// 变量 execute_func 的完整影响链路分析
MATCH (v:Variable {name: 'execute_func'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 4
// 变量 company_tool_parameters 的完整影响链路分析
MATCH (v:Variable {name: 'company_tool_parameters'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 5
// 变量 description 的完整影响链路分析
MATCH (v:Variable {name: 'description'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 6
// 变量 properties 的完整影响链路分析
MATCH (v:Variable {name: 'properties'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 7
// 变量 required_properties 的完整影响链路分析
MATCH (v:Variable {name: 'required_properties'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 8
// 变量 additional_properties 的完整影响链路分析
MATCH (v:Variable {name: 'additional_properties'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 9
// 变量 company_info_tool 的完整影响链路分析
MATCH (v:Variable {name: 'company_info_tool'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 10
// 变量 name 的完整影响链路分析
MATCH (v:Variable {name: 'name'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 11
// 变量 TOOLS 的完整影响链路分析
MATCH (v:Variable {name: 'TOOLS'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 12
// 变量 model_name 的完整影响链路分析
MATCH (v:Variable {name: 'model_name'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 13
// 变量 tool_config 的完整影响链路分析
MATCH (v:Variable {name: 'tool_config'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 14
// 变量 function_calling_config 的完整影响链路分析
MATCH (v:Variable {name: 'function_calling_config'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 15
// 变量 mode 的完整影响链路分析
MATCH (v:Variable {name: 'mode'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 16
// 变量 allowed_function_names 的完整影响链路分析
MATCH (v:Variable {name: 'allowed_function_names'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 17
// 变量 text 的完整影响链路分析
MATCH (v:Variable {name: 'text'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 18
// 变量 text1 的完整影响链路分析
MATCH (v:Variable {name: 'text1'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 19
// 变量 input 的完整影响链路分析
MATCH (v:Variable {name: 'input'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 20
// 变量 system_message 的完整影响链路分析
MATCH (v:Variable {name: 'system_message'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 21
// 变量 model 的完整影响链路分析
MATCH (v:Variable {name: 'model'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 22
// 变量 system_instruction 的完整影响链路分析
MATCH (v:Variable {name: 'system_instruction'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 23
// 变量 messages 的完整影响链路分析
MATCH (v:Variable {name: 'messages'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 24
// 变量 response 的完整影响链路分析
MATCH (v:Variable {name: 'response'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 25
// 变量 content 的完整影响链路分析
MATCH (v:Variable {name: 'content'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 26
// 变量 options 的完整影响链路分析
MATCH (v:Variable {name: 'options'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 27
// 变量 function_declarations 的完整影响链路分析
MATCH (v:Variable {name: 'function_declarations'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 28
// 变量 vertex_ai_tools 的完整影响链路分析
MATCH (v:Variable {name: 'vertex_ai_tools'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 29
// 变量 tools 的完整影响链路分析
MATCH (v:Variable {name: 'tools'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 30
// 变量 user_message 的完整影响链路分析
MATCH (v:Variable {name: 'user_message'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 31
// 变量 last_call 的完整影响链路分析
MATCH (v:Variable {name: 'last_call'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 32
// 变量 return_value 的完整影响链路分析
MATCH (v:Variable {name: 'return_value'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 33
// 变量 contents 的完整影响链路分析
MATCH (v:Variable {name: 'contents'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 34
// 变量 res 的完整影响链路分析
MATCH (v:Variable {name: 'res'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 35
// 变量 calls 的完整影响链路分析
MATCH (v:Variable {name: 'calls'})
OPTIONAL MATCH (v)-[r1:RELATES_TO]->(f:Function)
OPTIONAL MATCH (f)-[r2:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(v3:Variable)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(f3:Function)
RETURN v, f, s, v2, f2, s2, v3, f3, r1, r2, r3, r4, r5, r6, r7
ORDER BY v.name, f.name, s.name

-- 完整链路查询 36
// 函数 that 的完整影响链路分析
MATCH (f:Function {name: 'that'})
OPTIONAL MATCH (f)-[r1:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[r2:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s)-[r3:RELATES_TO]->(f2:Function)
OPTIONAL MATCH (s)-[r4:RELATES_TO]->(v2:Variable)
OPTIONAL MATCH (f2)-[r5:IMPLEMENTED_IN]->(s2:Script)
OPTIONAL MATCH (s2)-[r6:RELATES_TO]->(f3:Function)
OPTIONAL MATCH (s2)-[r7:RELATES_TO]->(v3:Variable)
RETURN f, s, v, f2, v2, s2, f3, v3, r1, r2, r3, r4, r5, r6, r7
ORDER BY f.name, s.name

-- 变量影响范围查询

-- 变量影响查询 1
// 查看变量 parameters 的影响范围
MATCH (v:Variable {name: 'parameters'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 2
// 查看变量 person_tool_parameters 的影响范围
MATCH (v:Variable {name: 'person_tool_parameters'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 3
// 查看变量 execute_func 的影响范围
MATCH (v:Variable {name: 'execute_func'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 4
// 查看变量 company_tool_parameters 的影响范围
MATCH (v:Variable {name: 'company_tool_parameters'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 5
// 查看变量 description 的影响范围
MATCH (v:Variable {name: 'description'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 6
// 查看变量 properties 的影响范围
MATCH (v:Variable {name: 'properties'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 7
// 查看变量 required_properties 的影响范围
MATCH (v:Variable {name: 'required_properties'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 8
// 查看变量 additional_properties 的影响范围
MATCH (v:Variable {name: 'additional_properties'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 9
// 查看变量 company_info_tool 的影响范围
MATCH (v:Variable {name: 'company_info_tool'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 10
// 查看变量 name 的影响范围
MATCH (v:Variable {name: 'name'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 11
// 查看变量 TOOLS 的影响范围
MATCH (v:Variable {name: 'TOOLS'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 12
// 查看变量 model_name 的影响范围
MATCH (v:Variable {name: 'model_name'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 13
// 查看变量 tool_config 的影响范围
MATCH (v:Variable {name: 'tool_config'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 14
// 查看变量 function_calling_config 的影响范围
MATCH (v:Variable {name: 'function_calling_config'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 15
// 查看变量 mode 的影响范围
MATCH (v:Variable {name: 'mode'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 16
// 查看变量 allowed_function_names 的影响范围
MATCH (v:Variable {name: 'allowed_function_names'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 17
// 查看变量 text 的影响范围
MATCH (v:Variable {name: 'text'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 18
// 查看变量 text1 的影响范围
MATCH (v:Variable {name: 'text1'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 19
// 查看变量 input 的影响范围
MATCH (v:Variable {name: 'input'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 20
// 查看变量 system_message 的影响范围
MATCH (v:Variable {name: 'system_message'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 21
// 查看变量 model 的影响范围
MATCH (v:Variable {name: 'model'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 22
// 查看变量 system_instruction 的影响范围
MATCH (v:Variable {name: 'system_instruction'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 23
// 查看变量 messages 的影响范围
MATCH (v:Variable {name: 'messages'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 24
// 查看变量 response 的影响范围
MATCH (v:Variable {name: 'response'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 25
// 查看变量 content 的影响范围
MATCH (v:Variable {name: 'content'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 26
// 查看变量 options 的影响范围
MATCH (v:Variable {name: 'options'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 27
// 查看变量 function_declarations 的影响范围
MATCH (v:Variable {name: 'function_declarations'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 28
// 查看变量 vertex_ai_tools 的影响范围
MATCH (v:Variable {name: 'vertex_ai_tools'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 29
// 查看变量 tools 的影响范围
MATCH (v:Variable {name: 'tools'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 30
// 查看变量 user_message 的影响范围
MATCH (v:Variable {name: 'user_message'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 31
// 查看变量 last_call 的影响范围
MATCH (v:Variable {name: 'last_call'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 32
// 查看变量 return_value 的影响范围
MATCH (v:Variable {name: 'return_value'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 33
// 查看变量 contents 的影响范围
MATCH (v:Variable {name: 'contents'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 34
// 查看变量 res 的影响范围
MATCH (v:Variable {name: 'res'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 变量影响查询 35
// 查看变量 calls 的影响范围
MATCH (v:Variable {name: 'calls'})
OPTIONAL MATCH (v)-[:RELATES_TO]->(f:Function)
OPTIONAL MATCH (v)-[:RELATES_TO]->(s:Script)
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s2:Script)
RETURN v, f, s, s2
ORDER BY v.name

-- 函数影响范围查询

-- 函数影响查询 1
// 查看函数 that 的影响范围
MATCH (f:Function {name: 'that'})
OPTIONAL MATCH (f)-[:IMPLEMENTED_IN]->(s:Script)
OPTIONAL MATCH (f)-[:RELATES_TO]->(v:Variable)
OPTIONAL MATCH (s2:Script)-[:RELATES_TO]->(f)
RETURN f, s, v, s2
ORDER BY f.name

-- 综合影响范围查询

-- 综合影响查询 1
// 所有变更的综合影响分析
MATCH (n)
WHERE (n:Variable AND n.name IN ['parameters', 'person_tool_parameters', 'execute_func', 'company_tool_parameters', 'description', 'properties', 'required_properties', 'additional_properties', 'company_info_tool', 'name', 'TOOLS', 'model_name', 'tool_config', 'function_calling_config', 'mode', 'allowed_function_names', 'text', 'text1', 'input', 'system_message', 'model', 'system_instruction', 'messages', 'response', 'content', 'options', 'function_declarations', 'vertex_ai_tools', 'tools', 'user_message', 'last_call', 'return_value', 'contents', 'res', 'calls'])
   OR (n:Function AND n.name IN ['that'])
   OR (n:Script AND n.name IN [])
OPTIONAL MATCH (n)-[r1:RELATES_TO]->(related1)
OPTIONAL MATCH (n)-[r2:IMPLEMENTED_IN]->(related2)
OPTIONAL MATCH (related1)-[r3:RELATES_TO]->(related3)
OPTIONAL MATCH (related1)-[r4:IMPLEMENTED_IN]->(related4)
OPTIONAL MATCH (related2)-[r5:RELATES_TO]->(related5)
OPTIONAL MATCH (related2)-[r6:IMPLEMENTED_IN]->(related6)
RETURN n, related1, related2, related3, related4, related5, related6,
       r1, r2, r3, r4, r5, r6
ORDER BY labels(n), n.name


-- ==========================================
-- 使用说明
-- ==========================================
-- 1. 打开Neo4j Browser: http://localhost:7474
-- 2. 复制上述查询到查询框
-- 3. 点击运行按钮
-- 4. 对于可视化查询，选择'Graph'视图查看图形
-- 5. 使用'Table'视图查看详细数据
-- 6. 推荐优先使用'完整影响链路查询'查看完整依赖关系
