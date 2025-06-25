-- 代码变更记录影响链路的查询语句
-- 生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
-- 仓库: {analysis.get('repository_info', {}).get('name', 'N/A')}

-- ========================================
-- 提交: mock1234 - Mock commit: Update BERT model implementation
-- ========================================

-- Functions that call 'bert'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'bert'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'bert'

        MATCH (func:Function {name: 'bert'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'bert'

        MATCH (func:Function {name: 'bert'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'bert'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'bert'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions that call 'iJapaneseBERTModel'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'iJapaneseBERTModel'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'iJapaneseBERTModel'

        MATCH (func:Function {name: 'iJapaneseBERTModel'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'iJapaneseBERTModel'

        MATCH (func:Function {name: 'iJapaneseBERTModel'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'iJapaneseBERTModel'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'iJapaneseBERTModel'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions/scripts that use variable 'nvp' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'nvp', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'nvp' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'nvp', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'nvp' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'nvp', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'nvp' in scope '' is assigned to

        MATCH (source:Variable {name: 'nvp', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'arguments' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'arguments' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'arguments', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'arguments' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'arguments', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'arguments' in scope '' is assigned to

        MATCH (source:Variable {name: 'arguments', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'string' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'string', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'string' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'string', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'string' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'string', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'string' in scope '' is assigned to

        MATCH (source:Variable {name: 'string', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'base' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'base', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'base' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'base', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'base' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'base', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'base' in scope '' is assigned to

        MATCH (source:Variable {name: 'base', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'multilingual' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'multilingual' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'multilingual', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'multilingual' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'multilingual', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'multilingual' in scope '' is assigned to

        MATCH (source:Variable {name: 'multilingual', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'cased' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'cased', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'cased' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'cased', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'cased' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'cased', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'cased' in scope '' is assigned to

        MATCH (source:Variable {name: 'cased', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'medium' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'medium', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'medium' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'medium', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'medium' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'medium', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'medium' in scope '' is assigned to

        MATCH (source:Variable {name: 'medium', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'small' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'small', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'small' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'small', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'small' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'small', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'small' in scope '' is assigned to

        MATCH (source:Variable {name: 'small', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'mini' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mini', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mini' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mini', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mini' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mini', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mini' in scope '' is assigned to

        MATCH (source:Variable {name: 'mini', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'tiny' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'tiny', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'tiny' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'tiny', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'tiny' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'tiny', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'tiny' in scope '' is assigned to

        MATCH (source:Variable {name: 'tiny', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'japanese' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'japanese' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'japanese', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'japanese' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'japanese', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'japanese' in scope '' is assigned to

        MATCH (source:Variable {name: 'japanese', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'wwm' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'wwm', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'wwm' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'wwm', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'wwm' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'wwm', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'wwm' in scope '' is assigned to

        MATCH (source:Variable {name: 'wwm', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'modelName' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'modelName', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'modelName' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'modelName', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'modelName' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'modelName', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'modelName' in scope '' is assigned to

        MATCH (source:Variable {name: 'modelName', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'zipFileName' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'zipFileName', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'zipFileName' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'zipFileName', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'zipFileName' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'zipFileName', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'zipFileName' in scope '' is assigned to

        MATCH (source:Variable {name: 'zipFileName', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'zipFilePath' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'zipFilePath', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'zipFilePath' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'zipFilePath', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'zipFilePath' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'zipFilePath', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'zipFilePath' in scope '' is assigned to

        MATCH (source:Variable {name: 'zipFilePath', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'modelDir' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'modelDir', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'modelDir' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'modelDir', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'modelDir' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'modelDir', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'modelDir' in scope '' is assigned to

        MATCH (source:Variable {name: 'modelDir', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'btok' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'btok', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'btok' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'btok', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'btok' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'btok', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'btok' in scope '' is assigned to

        MATCH (source:Variable {name: 'btok', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'vocabFile' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'vocabFile', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'vocabFile' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'vocabFile', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'vocabFile' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'vocabFile', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'vocabFile' in scope '' is assigned to

        MATCH (source:Variable {name: 'vocabFile', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'ftok' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'ftok', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'ftok' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'ftok', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'ftok' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'ftok', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'ftok' in scope '' is assigned to

        MATCH (source:Variable {name: 'ftok', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'tok' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'tok', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'tok' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'tok', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'tok' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'tok', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'tok' in scope '' is assigned to

        MATCH (source:Variable {name: 'tok', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'NumHeads' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'NumHeads' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'NumHeads', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'NumHeads' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'NumHeads', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'NumHeads' in scope '' is assigned to

        MATCH (source:Variable {name: 'NumHeads', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'NumLayers' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'NumLayers' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'NumLayers', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'NumLayers' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'NumLayers', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'NumLayers' in scope '' is assigned to

        MATCH (source:Variable {name: 'NumLayers', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'NumContext' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'NumContext', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'NumContext' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'NumContext', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'NumContext' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'NumContext', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'NumContext' in scope '' is assigned to

        MATCH (source:Variable {name: 'NumContext', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'HiddenSize' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'HiddenSize', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'HiddenSize' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'HiddenSize', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'HiddenSize' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'HiddenSize', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'HiddenSize' in scope '' is assigned to

        MATCH (source:Variable {name: 'HiddenSize', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'mdl' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mdl', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mdl' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mdl', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mdl' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mdl', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mdl' in scope '' is assigned to

        MATCH (source:Variable {name: 'mdl', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'Tokenizer' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'Tokenizer' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'Tokenizer', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'Tokenizer' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'Tokenizer', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'Tokenizer' in scope '' is assigned to

        MATCH (source:Variable {name: 'Tokenizer', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'Parameters' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'Parameters' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'Parameters', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'Parameters' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'Parameters', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'Parameters' in scope '' is assigned to

        MATCH (source:Variable {name: 'Parameters', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'bert' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'bert', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'bert' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'bert', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'bert' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'bert', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'bert' in scope '' is assigned to

        MATCH (source:Variable {name: 'bert', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'internal' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'internal', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'internal' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'internal', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'internal' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'internal', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'internal' in scope '' is assigned to

        MATCH (source:Variable {name: 'internal', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'zip' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'zip', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'zip' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'zip', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'zip' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'zip', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'zip' in scope '' is assigned to

        MATCH (source:Variable {name: 'zip', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'tokenizer' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'tokenizer' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'tokenizer', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'tokenizer' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'tokenizer', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'tokenizer' in scope '' is assigned to

        MATCH (source:Variable {name: 'tokenizer', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'Language' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'Language', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'Language' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'Language', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'Language' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'Language', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'Language' in scope '' is assigned to

        MATCH (source:Variable {name: 'Language', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'ja' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'ja', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'ja' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'ja', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'ja' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'ja', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'ja' in scope '' is assigned to

        MATCH (source:Variable {name: 'ja', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'TokenizeMethod' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'TokenizeMethod', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'TokenizeMethod' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'TokenizeMethod', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'TokenizeMethod' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'TokenizeMethod', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'TokenizeMethod' in scope '' is assigned to

        MATCH (source:Variable {name: 'TokenizeMethod', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'mecab' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mecab', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mecab' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mecab', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mecab' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mecab', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mecab' in scope '' is assigned to

        MATCH (source:Variable {name: 'mecab', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'IgnoreCase' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'IgnoreCase' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'IgnoreCase', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'IgnoreCase' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'IgnoreCase', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'IgnoreCase' in scope '' is assigned to

        MATCH (source:Variable {name: 'IgnoreCase', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'vocab' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'vocab' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'vocab', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'vocab' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'vocab', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'vocab' in scope '' is assigned to

        MATCH (source:Variable {name: 'vocab', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'txt' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'txt', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'txt' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'txt', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'txt' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'txt', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'txt' in scope '' is assigned to

        MATCH (source:Variable {name: 'txt', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'BasicTokenizer' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'BasicTokenizer' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'BasicTokenizer', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'BasicTokenizer' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'BasicTokenizer', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'BasicTokenizer' in scope '' is assigned to

        MATCH (source:Variable {name: 'BasicTokenizer', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'FullTokenizer' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'FullTokenizer' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'FullTokenizer', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'FullTokenizer' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'FullTokenizer', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'FullTokenizer' in scope '' is assigned to

        MATCH (source:Variable {name: 'FullTokenizer', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'weights' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'weights', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'weights' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'weights', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'weights' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'weights', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'weights' in scope '' is assigned to

        MATCH (source:Variable {name: 'weights', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'mat' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mat', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mat' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mat', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mat' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mat', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mat' in scope '' is assigned to

        MATCH (source:Variable {name: 'mat', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'dlarray' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'dlarray', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'dlarray' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'dlarray', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'dlarray' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'dlarray', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'dlarray' in scope '' is assigned to

        MATCH (source:Variable {name: 'dlarray', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'params' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'params', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'params' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'params', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'params' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'params', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'params' in scope '' is assigned to

        MATCH (source:Variable {name: 'params', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'Weights' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'Weights' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'Weights', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'Weights' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'Weights', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'Weights' in scope '' is assigned to

        MATCH (source:Variable {name: 'Weights', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Scripts that call 'bert.m'

        MATCH (caller:Script)-[:CALLS]->(target:Script {name: 'bert.m'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller_name
        

-- Functions called by 'bert.m'

        MATCH (script:Script {name: 'bert.m'})-[:CALLS]->(func:Function)
        RETURN func.name as function_name, func.file_path as function_file
        ORDER BY func.name
        

-- Variables used by 'bert.m'

        MATCH (script:Script {name: 'bert.m'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'bert.m'

        MATCH (script:Script {name: 'bert.m'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Functions that call 'finbert'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'finbert'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'finbert'

        MATCH (func:Function {name: 'finbert'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'finbert'

        MATCH (func:Function {name: 'finbert'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'finbert'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'finbert'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions/scripts that use variable 'nvp' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'nvp', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'nvp' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'nvp', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'nvp' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'nvp', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'nvp' in scope '' is assigned to

        MATCH (source:Variable {name: 'nvp', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'arguments' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'arguments' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'arguments', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'arguments' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'arguments', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'arguments' in scope '' is assigned to

        MATCH (source:Variable {name: 'arguments', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'string' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'string', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'string' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'string', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'string' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'string', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'string' in scope '' is assigned to

        MATCH (source:Variable {name: 'string', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'language' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'language', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'language' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'language', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'language' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'language', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'language' in scope '' is assigned to

        MATCH (source:Variable {name: 'language', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'model' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'model', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'model' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'model', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'model' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'model', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'model' in scope '' is assigned to

        MATCH (source:Variable {name: 'model', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'sentiment' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'sentiment', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'sentiment' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'sentiment', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'sentiment' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'sentiment', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'sentiment' in scope '' is assigned to

        MATCH (source:Variable {name: 'sentiment', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Scripts that call 'finbert.m'

        MATCH (caller:Script)-[:CALLS]->(target:Script {name: 'finbert.m'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller_name
        

-- Functions called by 'finbert.m'

        MATCH (script:Script {name: 'finbert.m'})-[:CALLS]->(func:Function)
        RETURN func.name as function_name, func.file_path as function_file
        ORDER BY func.name
        

-- Variables used by 'finbert.m'

        MATCH (script:Script {name: 'finbert.m'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'finbert.m'

        MATCH (script:Script {name: 'finbert.m'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Functions that call 'predictMaskedToken'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'predictMaskedToken'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'predictMaskedToken'

        MATCH (func:Function {name: 'predictMaskedToken'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'predictMaskedToken'

        MATCH (func:Function {name: 'predictMaskedToken'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'predictMaskedToken'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'predictMaskedToken'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions that call 'encodeScalarString'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'encodeScalarString'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'encodeScalarString'

        MATCH (func:Function {name: 'encodeScalarString'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'encodeScalarString'

        MATCH (func:Function {name: 'encodeScalarString'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'encodeScalarString'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'encodeScalarString'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions that call 'rebuildScalarString'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'rebuildScalarString'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'rebuildScalarString'

        MATCH (func:Function {name: 'rebuildScalarString'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'rebuildScalarString'

        MATCH (func:Function {name: 'rebuildScalarString'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'rebuildScalarString'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'rebuildScalarString'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions/scripts that use variable 'mdl' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mdl', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mdl' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mdl', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mdl' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mdl', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mdl' in scope '' is assigned to

        MATCH (source:Variable {name: 'mdl', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'str' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'str', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'str' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'str', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'str' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'str', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'str' in scope '' is assigned to

        MATCH (source:Variable {name: 'str', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'arguments' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'arguments' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'arguments', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'arguments' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'arguments', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'arguments' in scope '' is assigned to

        MATCH (source:Variable {name: 'arguments', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'tok' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'tok', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'tok' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'tok', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'tok' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'tok', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'tok' in scope '' is assigned to

        MATCH (source:Variable {name: 'tok', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'pieces' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'pieces', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'pieces' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'pieces', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'pieces' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'pieces', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'pieces' in scope '' is assigned to

        MATCH (source:Variable {name: 'pieces', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'fulltok' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'fulltok', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'fulltok' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'fulltok', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'fulltok' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'fulltok', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'fulltok' in scope '' is assigned to

        MATCH (source:Variable {name: 'fulltok', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'maskCode' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'maskCode', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'maskCode' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'maskCode', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'maskCode' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'maskCode', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'maskCode' in scope '' is assigned to

        MATCH (source:Variable {name: 'maskCode', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'tokens' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'tokens', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'tokens' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'tokens', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'tokens' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'tokens', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'tokens' in scope '' is assigned to

        MATCH (source:Variable {name: 'tokens', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'MaskToken' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'MaskToken', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'MaskToken' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'MaskToken', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'MaskToken' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'MaskToken', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'MaskToken' in scope '' is assigned to

        MATCH (source:Variable {name: 'MaskToken', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'FullTokenizer' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'FullTokenizer' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'FullTokenizer', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'FullTokenizer' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'FullTokenizer', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'FullTokenizer' in scope '' is assigned to

        MATCH (source:Variable {name: 'FullTokenizer', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'pieces' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'pieces', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'pieces' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'pieces', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'pieces' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'pieces', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'pieces' in scope '' is assigned to

        MATCH (source:Variable {name: 'pieces', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'predictedTokens' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'predictedTokens', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'predictedTokens' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'predictedTokens', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'predictedTokens' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'predictedTokens', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'predictedTokens' in scope '' is assigned to

        MATCH (source:Variable {name: 'predictedTokens', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'out' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'out', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'out' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'out', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'out' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'out', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'out' in scope '' is assigned to

        MATCH (source:Variable {name: 'out', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Scripts that call 'predictMaskedToken.m'

        MATCH (caller:Script)-[:CALLS]->(target:Script {name: 'predictMaskedToken.m'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller_name
        

-- Functions called by 'predictMaskedToken.m'

        MATCH (script:Script {name: 'predictMaskedToken.m'})-[:CALLS]->(func:Function)
        RETURN func.name as function_name, func.file_path as function_file
        ORDER BY func.name
        

-- Variables used by 'predictMaskedToken.m'

        MATCH (script:Script {name: 'predictMaskedToken.m'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'predictMaskedToken.m'

        MATCH (script:Script {name: 'predictMaskedToken.m'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Components that depend on usage of variable 'wwm'

        MATCH (user)-[:USES]->(var:Variable {name: 'wwm'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'japanese'

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tiny'

        MATCH (user)-[:USES]->(var:Variable {name: 'tiny'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mini'

        MATCH (user)-[:USES]->(var:Variable {name: 'mini'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'small'

        MATCH (user)-[:USES]->(var:Variable {name: 'small'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'medium'

        MATCH (user)-[:USES]->(var:Variable {name: 'medium'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'cased'

        MATCH (user)-[:USES]->(var:Variable {name: 'cased'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'multilingual'

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that use variable 'nvp' defined by 'bert'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'nvp'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'params'

        MATCH (user)-[:USES]->(var:Variable {name: 'params'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'dlarray'

        MATCH (user)-[:USES]->(var:Variable {name: 'dlarray'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mecab'

        MATCH (user)-[:USES]->(var:Variable {name: 'mecab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'TokenizeMethod'

        MATCH (user)-[:USES]->(var:Variable {name: 'TokenizeMethod'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'ja'

        MATCH (user)-[:USES]->(var:Variable {name: 'ja'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Language'

        MATCH (user)-[:USES]->(var:Variable {name: 'Language'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'zip'

        MATCH (user)-[:USES]->(var:Variable {name: 'zip'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that use variable 'Parameters' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'Parameters'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'Tokenizer' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'Tokenizer'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'mdl' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'mdl'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'HiddenSize' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'HiddenSize'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'NumContext' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'NumContext'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'NumLayers' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'NumLayers'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'NumHeads' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'NumHeads'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'tok' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'tok'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'ftok' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'ftok'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'vocabFile' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'vocabFile'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'btok' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'btok'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'modelDir' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelDir'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'zipFilePath' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'zipFilePath'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'zipFileName' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'zipFileName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'modelName' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'multilingual'

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'multilingual'

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'multilingual'

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'multilingual'

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'cased'

        MATCH (user)-[:USES]->(var:Variable {name: 'cased'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'cased'

        MATCH (user)-[:USES]->(var:Variable {name: 'cased'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'cased'

        MATCH (user)-[:USES]->(var:Variable {name: 'cased'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'cased'

        MATCH (user)-[:USES]->(var:Variable {name: 'cased'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'medium'

        MATCH (user)-[:USES]->(var:Variable {name: 'medium'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'medium'

        MATCH (user)-[:USES]->(var:Variable {name: 'medium'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'medium'

        MATCH (user)-[:USES]->(var:Variable {name: 'medium'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'small'

        MATCH (user)-[:USES]->(var:Variable {name: 'small'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'small'

        MATCH (user)-[:USES]->(var:Variable {name: 'small'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'small'

        MATCH (user)-[:USES]->(var:Variable {name: 'small'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mini'

        MATCH (user)-[:USES]->(var:Variable {name: 'mini'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mini'

        MATCH (user)-[:USES]->(var:Variable {name: 'mini'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mini'

        MATCH (user)-[:USES]->(var:Variable {name: 'mini'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tiny'

        MATCH (user)-[:USES]->(var:Variable {name: 'tiny'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tiny'

        MATCH (user)-[:USES]->(var:Variable {name: 'tiny'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tiny'

        MATCH (user)-[:USES]->(var:Variable {name: 'tiny'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'japanese'

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'japanese'

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'japanese'

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'japanese'

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'wwm'

        MATCH (user)-[:USES]->(var:Variable {name: 'wwm'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'wwm'

        MATCH (user)-[:USES]->(var:Variable {name: 'wwm'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumContext'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumContext'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'HiddenSize'

        MATCH (user)-[:USES]->(var:Variable {name: 'HiddenSize'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'zip'

        MATCH (user)-[:USES]->(var:Variable {name: 'zip'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Language'

        MATCH (user)-[:USES]->(var:Variable {name: 'Language'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Language'

        MATCH (user)-[:USES]->(var:Variable {name: 'Language'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'ja'

        MATCH (user)-[:USES]->(var:Variable {name: 'ja'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'ja'

        MATCH (user)-[:USES]->(var:Variable {name: 'ja'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'TokenizeMethod'

        MATCH (user)-[:USES]->(var:Variable {name: 'TokenizeMethod'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'TokenizeMethod'

        MATCH (user)-[:USES]->(var:Variable {name: 'TokenizeMethod'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mecab'

        MATCH (user)-[:USES]->(var:Variable {name: 'mecab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mecab'

        MATCH (user)-[:USES]->(var:Variable {name: 'mecab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'dlarray'

        MATCH (user)-[:USES]->(var:Variable {name: 'dlarray'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'dlarray'

        MATCH (user)-[:USES]->(var:Variable {name: 'dlarray'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'dlarray'

        MATCH (user)-[:USES]->(var:Variable {name: 'dlarray'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'params'

        MATCH (user)-[:USES]->(var:Variable {name: 'params'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'sentiment'

        MATCH (user)-[:USES]->(var:Variable {name: 'sentiment'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'model'

        MATCH (user)-[:USES]->(var:Variable {name: 'model'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'language'

        MATCH (user)-[:USES]->(var:Variable {name: 'language'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that use variable 'nvp' defined by 'finbert'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'nvp'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'language'

        MATCH (user)-[:USES]->(var:Variable {name: 'language'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'language'

        MATCH (user)-[:USES]->(var:Variable {name: 'language'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'language'

        MATCH (user)-[:USES]->(var:Variable {name: 'language'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'language'

        MATCH (user)-[:USES]->(var:Variable {name: 'language'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'model'

        MATCH (user)-[:USES]->(var:Variable {name: 'model'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'model'

        MATCH (user)-[:USES]->(var:Variable {name: 'model'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'model'

        MATCH (user)-[:USES]->(var:Variable {name: 'model'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'model'

        MATCH (user)-[:USES]->(var:Variable {name: 'model'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'model'

        MATCH (user)-[:USES]->(var:Variable {name: 'model'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'model'

        MATCH (user)-[:USES]->(var:Variable {name: 'model'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'sentiment'

        MATCH (user)-[:USES]->(var:Variable {name: 'sentiment'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'sentiment'

        MATCH (user)-[:USES]->(var:Variable {name: 'sentiment'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mustBeInteger'

        MATCH (user)-[:USES]->(var:Variable {name: 'mustBeInteger'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mustBePositive'

        MATCH (user)-[:USES]->(var:Variable {name: 'mustBePositive'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that use variable 'str' defined by 'predictMaskedToken'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'str'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'mdl' defined by 'predictMaskedToken'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'mdl'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'maskIdx' defined by 'predictMaskedToken'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'maskIdx'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'mdl' defined by 'predictMaskedToken'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'mdl'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'MaskToken'

        MATCH (user)-[:USES]->(var:Variable {name: 'MaskToken'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'SeparatorToken'

        MATCH (user)-[:USES]->(var:Variable {name: 'SeparatorToken'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'StartToken'

        MATCH (user)-[:USES]->(var:Variable {name: 'StartToken'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'MaskToken'

        MATCH (user)-[:USES]->(var:Variable {name: 'MaskToken'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that use variable 'tokens' defined by 'encodeScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'tokens'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'maskCode' defined by 'encodeScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'maskCode'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'fulltok' defined by 'encodeScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'fulltok'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'pieces' defined by 'encodeScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'pieces'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'tok' defined by 'encodeScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'tok'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'tokens' defined by 'encodeScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'tokens'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'maskCode' defined by 'encodeScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'maskCode'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'fulltok' defined by 'encodeScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'fulltok'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'pieces' defined by 'encodeScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'pieces'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'out' defined by 'rebuildScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'out'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'predictedTokens' defined by 'rebuildScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'predictedTokens'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'pieces' defined by 'rebuildScalarString'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'pieces'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokens'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokens'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'MaskToken'

        MATCH (user)-[:USES]->(var:Variable {name: 'MaskToken'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'MaskToken'

        MATCH (user)-[:USES]->(var:Variable {name: 'MaskToken'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'MaskToken'

        MATCH (user)-[:USES]->(var:Variable {name: 'MaskToken'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'MaskToken'

        MATCH (user)-[:USES]->(var:Variable {name: 'MaskToken'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- ========================================
-- 提交: mock9876 - Mock commit: Update GPT2 model implementation
-- ========================================

-- Functions that call 'gpt2'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'gpt2'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'gpt2'

        MATCH (func:Function {name: 'gpt2'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'gpt2'

        MATCH (func:Function {name: 'gpt2'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'gpt2'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'gpt2'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions/scripts that use variable 'mdl' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mdl', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mdl' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mdl', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mdl' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mdl', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mdl' in scope '' is assigned to

        MATCH (source:Variable {name: 'mdl', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'paramsStructFile' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'paramsStructFile', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'paramsStructFile' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'paramsStructFile', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'paramsStructFile' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'paramsStructFile', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'paramsStructFile' in scope '' is assigned to

        MATCH (source:Variable {name: 'paramsStructFile', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'gpt2' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'gpt2' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'gpt2', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'gpt2' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'gpt2', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'gpt2' in scope '' is assigned to

        MATCH (source:Variable {name: 'gpt2', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'tokenizer' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'tokenizer' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'tokenizer', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'tokenizer' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'tokenizer', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'tokenizer' in scope '' is assigned to

        MATCH (source:Variable {name: 'tokenizer', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'internal' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'internal', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'internal' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'internal', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'internal' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'internal', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'internal' in scope '' is assigned to

        MATCH (source:Variable {name: 'internal', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'gpt2_355M_params' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2_355M_params', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'gpt2_355M_params' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'gpt2_355M_params', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'gpt2_355M_params' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'gpt2_355M_params', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'gpt2_355M_params' in scope '' is assigned to

        MATCH (source:Variable {name: 'gpt2_355M_params', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'mat' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mat', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mat' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mat', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mat' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mat', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mat' in scope '' is assigned to

        MATCH (source:Variable {name: 'mat', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Scripts that call 'gpt2.m'

        MATCH (caller:Script)-[:CALLS]->(target:Script {name: 'gpt2.m'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller_name
        

-- Functions called by 'gpt2.m'

        MATCH (script:Script {name: 'gpt2.m'})-[:CALLS]->(func:Function)
        RETURN func.name as function_name, func.file_path as function_file
        ORDER BY func.name
        

-- Variables used by 'gpt2.m'

        MATCH (script:Script {name: 'gpt2.m'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'gpt2.m'

        MATCH (script:Script {name: 'gpt2.m'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Functions that call 'bert'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'bert'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'bert'

        MATCH (func:Function {name: 'bert'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'bert'

        MATCH (func:Function {name: 'bert'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'bert'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'bert'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions that call 'iJapaneseBERTModel'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'iJapaneseBERTModel'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'iJapaneseBERTModel'

        MATCH (func:Function {name: 'iJapaneseBERTModel'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'iJapaneseBERTModel'

        MATCH (func:Function {name: 'iJapaneseBERTModel'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'iJapaneseBERTModel'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'iJapaneseBERTModel'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions/scripts that use variable 'nvp' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'nvp', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'nvp' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'nvp', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'nvp' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'nvp', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'nvp' in scope '' is assigned to

        MATCH (source:Variable {name: 'nvp', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'arguments' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'arguments' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'arguments', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'arguments' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'arguments', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'arguments' in scope '' is assigned to

        MATCH (source:Variable {name: 'arguments', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'string' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'string', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'string' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'string', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'string' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'string', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'string' in scope '' is assigned to

        MATCH (source:Variable {name: 'string', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'base' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'base', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'base' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'base', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'base' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'base', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'base' in scope '' is assigned to

        MATCH (source:Variable {name: 'base', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'multilingual' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'multilingual' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'multilingual', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'multilingual' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'multilingual', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'multilingual' in scope '' is assigned to

        MATCH (source:Variable {name: 'multilingual', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'cased' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'cased', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'cased' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'cased', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'cased' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'cased', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'cased' in scope '' is assigned to

        MATCH (source:Variable {name: 'cased', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'medium' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'medium', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'medium' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'medium', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'medium' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'medium', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'medium' in scope '' is assigned to

        MATCH (source:Variable {name: 'medium', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'small' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'small', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'small' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'small', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'small' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'small', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'small' in scope '' is assigned to

        MATCH (source:Variable {name: 'small', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'mini' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mini', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mini' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mini', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mini' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mini', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mini' in scope '' is assigned to

        MATCH (source:Variable {name: 'mini', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'tiny' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'tiny', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'tiny' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'tiny', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'tiny' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'tiny', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'tiny' in scope '' is assigned to

        MATCH (source:Variable {name: 'tiny', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'japanese' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'japanese' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'japanese', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'japanese' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'japanese', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'japanese' in scope '' is assigned to

        MATCH (source:Variable {name: 'japanese', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'wwm' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'wwm', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'wwm' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'wwm', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'wwm' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'wwm', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'wwm' in scope '' is assigned to

        MATCH (source:Variable {name: 'wwm', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'modelName' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'modelName', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'modelName' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'modelName', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'modelName' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'modelName', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'modelName' in scope '' is assigned to

        MATCH (source:Variable {name: 'modelName', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'zipFileName' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'zipFileName', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'zipFileName' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'zipFileName', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'zipFileName' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'zipFileName', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'zipFileName' in scope '' is assigned to

        MATCH (source:Variable {name: 'zipFileName', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'zipFilePath' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'zipFilePath', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'zipFilePath' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'zipFilePath', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'zipFilePath' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'zipFilePath', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'zipFilePath' in scope '' is assigned to

        MATCH (source:Variable {name: 'zipFilePath', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'modelDir' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'modelDir', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'modelDir' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'modelDir', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'modelDir' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'modelDir', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'modelDir' in scope '' is assigned to

        MATCH (source:Variable {name: 'modelDir', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'btok' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'btok', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'btok' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'btok', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'btok' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'btok', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'btok' in scope '' is assigned to

        MATCH (source:Variable {name: 'btok', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'vocabFile' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'vocabFile', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'vocabFile' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'vocabFile', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'vocabFile' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'vocabFile', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'vocabFile' in scope '' is assigned to

        MATCH (source:Variable {name: 'vocabFile', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'ftok' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'ftok', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'ftok' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'ftok', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'ftok' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'ftok', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'ftok' in scope '' is assigned to

        MATCH (source:Variable {name: 'ftok', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'tok' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'tok', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'tok' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'tok', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'tok' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'tok', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'tok' in scope '' is assigned to

        MATCH (source:Variable {name: 'tok', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'NumHeads' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'NumHeads' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'NumHeads', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'NumHeads' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'NumHeads', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'NumHeads' in scope '' is assigned to

        MATCH (source:Variable {name: 'NumHeads', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'NumLayers' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'NumLayers' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'NumLayers', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'NumLayers' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'NumLayers', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'NumLayers' in scope '' is assigned to

        MATCH (source:Variable {name: 'NumLayers', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'NumContext' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'NumContext', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'NumContext' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'NumContext', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'NumContext' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'NumContext', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'NumContext' in scope '' is assigned to

        MATCH (source:Variable {name: 'NumContext', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'HiddenSize' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'HiddenSize', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'HiddenSize' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'HiddenSize', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'HiddenSize' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'HiddenSize', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'HiddenSize' in scope '' is assigned to

        MATCH (source:Variable {name: 'HiddenSize', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'mdl' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mdl', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mdl' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mdl', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mdl' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mdl', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mdl' in scope '' is assigned to

        MATCH (source:Variable {name: 'mdl', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'Tokenizer' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'Tokenizer' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'Tokenizer', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'Tokenizer' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'Tokenizer', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'Tokenizer' in scope '' is assigned to

        MATCH (source:Variable {name: 'Tokenizer', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'Parameters' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'Parameters' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'Parameters', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'Parameters' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'Parameters', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'Parameters' in scope '' is assigned to

        MATCH (source:Variable {name: 'Parameters', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'bert' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'bert', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'bert' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'bert', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'bert' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'bert', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'bert' in scope '' is assigned to

        MATCH (source:Variable {name: 'bert', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'internal' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'internal', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'internal' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'internal', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'internal' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'internal', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'internal' in scope '' is assigned to

        MATCH (source:Variable {name: 'internal', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'zip' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'zip', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'zip' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'zip', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'zip' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'zip', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'zip' in scope '' is assigned to

        MATCH (source:Variable {name: 'zip', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'tokenizer' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'tokenizer' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'tokenizer', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'tokenizer' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'tokenizer', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'tokenizer' in scope '' is assigned to

        MATCH (source:Variable {name: 'tokenizer', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'Language' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'Language', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'Language' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'Language', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'Language' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'Language', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'Language' in scope '' is assigned to

        MATCH (source:Variable {name: 'Language', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'ja' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'ja', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'ja' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'ja', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'ja' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'ja', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'ja' in scope '' is assigned to

        MATCH (source:Variable {name: 'ja', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'TokenizeMethod' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'TokenizeMethod', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'TokenizeMethod' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'TokenizeMethod', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'TokenizeMethod' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'TokenizeMethod', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'TokenizeMethod' in scope '' is assigned to

        MATCH (source:Variable {name: 'TokenizeMethod', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'mecab' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mecab', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mecab' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mecab', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mecab' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mecab', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mecab' in scope '' is assigned to

        MATCH (source:Variable {name: 'mecab', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'IgnoreCase' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'IgnoreCase' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'IgnoreCase', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'IgnoreCase' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'IgnoreCase', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'IgnoreCase' in scope '' is assigned to

        MATCH (source:Variable {name: 'IgnoreCase', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'vocab' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'vocab' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'vocab', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'vocab' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'vocab', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'vocab' in scope '' is assigned to

        MATCH (source:Variable {name: 'vocab', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'txt' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'txt', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'txt' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'txt', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'txt' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'txt', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'txt' in scope '' is assigned to

        MATCH (source:Variable {name: 'txt', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'BasicTokenizer' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'BasicTokenizer' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'BasicTokenizer', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'BasicTokenizer' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'BasicTokenizer', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'BasicTokenizer' in scope '' is assigned to

        MATCH (source:Variable {name: 'BasicTokenizer', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'FullTokenizer' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'FullTokenizer' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'FullTokenizer', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'FullTokenizer' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'FullTokenizer', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'FullTokenizer' in scope '' is assigned to

        MATCH (source:Variable {name: 'FullTokenizer', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'weights' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'weights', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'weights' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'weights', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'weights' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'weights', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'weights' in scope '' is assigned to

        MATCH (source:Variable {name: 'weights', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'mat' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mat', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mat' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mat', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mat' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mat', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mat' in scope '' is assigned to

        MATCH (source:Variable {name: 'mat', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'dlarray' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'dlarray', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'dlarray' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'dlarray', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'dlarray' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'dlarray', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'dlarray' in scope '' is assigned to

        MATCH (source:Variable {name: 'dlarray', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'params' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'params', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'params' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'params', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'params' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'params', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'params' in scope '' is assigned to

        MATCH (source:Variable {name: 'params', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'Weights' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'Weights' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'Weights', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'Weights' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'Weights', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'Weights' in scope '' is assigned to

        MATCH (source:Variable {name: 'Weights', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Scripts that call 'bert.m'

        MATCH (caller:Script)-[:CALLS]->(target:Script {name: 'bert.m'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller_name
        

-- Functions called by 'bert.m'

        MATCH (script:Script {name: 'bert.m'})-[:CALLS]->(func:Function)
        RETURN func.name as function_name, func.file_path as function_file
        ORDER BY func.name
        

-- Variables used by 'bert.m'

        MATCH (script:Script {name: 'bert.m'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'bert.m'

        MATCH (script:Script {name: 'bert.m'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2_355M_params'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2_355M_params'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that use variable 'paramsStructFile' defined by 'gpt2'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'paramsStructFile'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'mdl' defined by 'gpt2'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'mdl'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2_355M_params'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2_355M_params'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'gpt2_355M_params'

        MATCH (user)-[:USES]->(var:Variable {name: 'gpt2_355M_params'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'wwm'

        MATCH (user)-[:USES]->(var:Variable {name: 'wwm'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'japanese'

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tiny'

        MATCH (user)-[:USES]->(var:Variable {name: 'tiny'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mini'

        MATCH (user)-[:USES]->(var:Variable {name: 'mini'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'small'

        MATCH (user)-[:USES]->(var:Variable {name: 'small'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'medium'

        MATCH (user)-[:USES]->(var:Variable {name: 'medium'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'cased'

        MATCH (user)-[:USES]->(var:Variable {name: 'cased'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'multilingual'

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that use variable 'nvp' defined by 'bert'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'nvp'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'params'

        MATCH (user)-[:USES]->(var:Variable {name: 'params'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'dlarray'

        MATCH (user)-[:USES]->(var:Variable {name: 'dlarray'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mecab'

        MATCH (user)-[:USES]->(var:Variable {name: 'mecab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'TokenizeMethod'

        MATCH (user)-[:USES]->(var:Variable {name: 'TokenizeMethod'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'ja'

        MATCH (user)-[:USES]->(var:Variable {name: 'ja'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Language'

        MATCH (user)-[:USES]->(var:Variable {name: 'Language'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'zip'

        MATCH (user)-[:USES]->(var:Variable {name: 'zip'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that use variable 'Parameters' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'Parameters'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'Tokenizer' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'Tokenizer'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'mdl' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'mdl'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'HiddenSize' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'HiddenSize'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'NumContext' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'NumContext'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'NumLayers' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'NumLayers'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'NumHeads' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'NumHeads'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'tok' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'tok'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'ftok' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'ftok'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'vocabFile' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'vocabFile'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'btok' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'btok'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'modelDir' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelDir'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'zipFilePath' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'zipFilePath'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'zipFileName' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'zipFileName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'modelName' defined by 'iJapaneseBERTModel'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'arguments'

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'string'

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'base'

        MATCH (user)-[:USES]->(var:Variable {name: 'base'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'multilingual'

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'multilingual'

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'multilingual'

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'multilingual'

        MATCH (user)-[:USES]->(var:Variable {name: 'multilingual'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'cased'

        MATCH (user)-[:USES]->(var:Variable {name: 'cased'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'cased'

        MATCH (user)-[:USES]->(var:Variable {name: 'cased'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'cased'

        MATCH (user)-[:USES]->(var:Variable {name: 'cased'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'cased'

        MATCH (user)-[:USES]->(var:Variable {name: 'cased'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'medium'

        MATCH (user)-[:USES]->(var:Variable {name: 'medium'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'medium'

        MATCH (user)-[:USES]->(var:Variable {name: 'medium'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'medium'

        MATCH (user)-[:USES]->(var:Variable {name: 'medium'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'small'

        MATCH (user)-[:USES]->(var:Variable {name: 'small'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'small'

        MATCH (user)-[:USES]->(var:Variable {name: 'small'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'small'

        MATCH (user)-[:USES]->(var:Variable {name: 'small'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mini'

        MATCH (user)-[:USES]->(var:Variable {name: 'mini'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mini'

        MATCH (user)-[:USES]->(var:Variable {name: 'mini'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mini'

        MATCH (user)-[:USES]->(var:Variable {name: 'mini'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tiny'

        MATCH (user)-[:USES]->(var:Variable {name: 'tiny'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tiny'

        MATCH (user)-[:USES]->(var:Variable {name: 'tiny'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tiny'

        MATCH (user)-[:USES]->(var:Variable {name: 'tiny'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'japanese'

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'japanese'

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'japanese'

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'japanese'

        MATCH (user)-[:USES]->(var:Variable {name: 'japanese'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'wwm'

        MATCH (user)-[:USES]->(var:Variable {name: 'wwm'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'wwm'

        MATCH (user)-[:USES]->(var:Variable {name: 'wwm'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumHeads'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumHeads'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumLayers'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumLayers'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'NumContext'

        MATCH (user)-[:USES]->(var:Variable {name: 'NumContext'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'HiddenSize'

        MATCH (user)-[:USES]->(var:Variable {name: 'HiddenSize'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'Tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Parameters'

        MATCH (user)-[:USES]->(var:Variable {name: 'Parameters'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'bert'

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'internal'

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'zip'

        MATCH (user)-[:USES]->(var:Variable {name: 'zip'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'tokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'tokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Language'

        MATCH (user)-[:USES]->(var:Variable {name: 'Language'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Language'

        MATCH (user)-[:USES]->(var:Variable {name: 'Language'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'ja'

        MATCH (user)-[:USES]->(var:Variable {name: 'ja'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'ja'

        MATCH (user)-[:USES]->(var:Variable {name: 'ja'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'TokenizeMethod'

        MATCH (user)-[:USES]->(var:Variable {name: 'TokenizeMethod'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'TokenizeMethod'

        MATCH (user)-[:USES]->(var:Variable {name: 'TokenizeMethod'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mecab'

        MATCH (user)-[:USES]->(var:Variable {name: 'mecab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mecab'

        MATCH (user)-[:USES]->(var:Variable {name: 'mecab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'IgnoreCase'

        MATCH (user)-[:USES]->(var:Variable {name: 'IgnoreCase'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'vocab'

        MATCH (user)-[:USES]->(var:Variable {name: 'vocab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'txt'

        MATCH (user)-[:USES]->(var:Variable {name: 'txt'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'BasicTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'BasicTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'FullTokenizer'

        MATCH (user)-[:USES]->(var:Variable {name: 'FullTokenizer'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mat'

        MATCH (user)-[:USES]->(var:Variable {name: 'mat'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'dlarray'

        MATCH (user)-[:USES]->(var:Variable {name: 'dlarray'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'dlarray'

        MATCH (user)-[:USES]->(var:Variable {name: 'dlarray'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'dlarray'

        MATCH (user)-[:USES]->(var:Variable {name: 'dlarray'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'params'

        MATCH (user)-[:USES]->(var:Variable {name: 'params'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'Weights'

        MATCH (user)-[:USES]->(var:Variable {name: 'Weights'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

