-- 代码变更记录影响链路的查询语句
-- 生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
-- 仓库: {analysis.get('repository_info', {}).get('name', 'N/A')}

-- ========================================
-- 提交: ce31873a - Update GPT2 support file path handling
-- ========================================

-- Functions that call 'getSupportFilePath'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'getSupportFilePath'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'getSupportFilePath'

        MATCH (func:Function {name: 'getSupportFilePath'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'getSupportFilePath'

        MATCH (func:Function {name: 'getSupportFilePath'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'getSupportFilePath'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'getSupportFilePath'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions that call 'legacySupportFilePath'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'legacySupportFilePath'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'legacySupportFilePath'

        MATCH (func:Function {name: 'legacySupportFilePath'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'legacySupportFilePath'

        MATCH (func:Function {name: 'legacySupportFilePath'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'legacySupportFilePath'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'legacySupportFilePath'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions that call 'iCreateDirectoryIfItDoesNotExist'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'iCreateDirectoryIfItDoesNotExist'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'iCreateDirectoryIfItDoesNotExist'

        MATCH (func:Function {name: 'iCreateDirectoryIfItDoesNotExist'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'iCreateDirectoryIfItDoesNotExist'

        MATCH (func:Function {name: 'iCreateDirectoryIfItDoesNotExist'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'iCreateDirectoryIfItDoesNotExist'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'iCreateDirectoryIfItDoesNotExist'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions that call 'iDownloadFileIfItDoesNotExist'

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'iDownloadFileIfItDoesNotExist'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        

-- Variables used by 'iDownloadFileIfItDoesNotExist'

        MATCH (func:Function {name: 'iDownloadFileIfItDoesNotExist'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'iDownloadFileIfItDoesNotExist'

        MATCH (func:Function {name: 'iDownloadFileIfItDoesNotExist'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Impact chain analysis for 'iDownloadFileIfItDoesNotExist'

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'iDownloadFileIfItDoesNotExist'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        

-- Functions/scripts that use variable 'fileName' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'fileName', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'fileName' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'fileName', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'fileName' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'fileName', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'fileName' in scope '' is assigned to

        MATCH (source:Variable {name: 'fileName', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'filePath' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'filePath', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'filePath' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'filePath', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'filePath' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'filePath', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'filePath' in scope '' is assigned to

        MATCH (source:Variable {name: 'filePath', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'sd' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'sd', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'sd' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'sd', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'sd' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'sd', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'sd' in scope '' is assigned to

        MATCH (source:Variable {name: 'sd', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'localFileDir' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'localFileDir', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'localFileDir' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'localFileDir', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'localFileDir' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'localFileDir', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'localFileDir' in scope '' is assigned to

        MATCH (source:Variable {name: 'localFileDir', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
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
        

-- Functions/scripts that use variable 'matlab' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'matlab' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'matlab', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'matlab' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'matlab', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'matlab' in scope '' is assigned to

        MATCH (source:Variable {name: 'matlab', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
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
        

-- Functions/scripts that use variable 'examples' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'examples', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'examples' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'examples', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'examples' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'examples', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'examples' in scope '' is assigned to

        MATCH (source:Variable {name: 'examples', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'utils' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'utils', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'utils' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'utils', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'utils' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'utils', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'utils' in scope '' is assigned to

        MATCH (source:Variable {name: 'utils', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'data' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'data', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'data' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'data', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'data' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'data', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'data' in scope '' is assigned to

        MATCH (source:Variable {name: 'data', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'networks' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'networks', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'networks' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'networks', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'networks' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'networks', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'networks' in scope '' is assigned to

        MATCH (source:Variable {name: 'networks', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'modelType' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'modelType', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'modelType' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'modelType', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'modelType' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'modelType', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'modelType' in scope '' is assigned to

        MATCH (source:Variable {name: 'modelType', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'modelDirectory' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'modelDirectory', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'modelDirectory' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'modelDirectory', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'modelDirectory' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'modelDirectory', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'modelDirectory' in scope '' is assigned to

        MATCH (source:Variable {name: 'modelDirectory', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'https' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'https', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'https' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'https', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'https' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'https', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'https' in scope '' is assigned to

        MATCH (source:Variable {name: 'https', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'ssd' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'ssd', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'ssd' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'ssd', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'ssd' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'ssd', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'ssd' in scope '' is assigned to

        MATCH (source:Variable {name: 'ssd', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'mathworks' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'mathworks', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'mathworks' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mathworks', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'mathworks' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mathworks', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'mathworks' in scope '' is assigned to

        MATCH (source:Variable {name: 'mathworks', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'com' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'com', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'com' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'com', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'com' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'com', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'com' in scope '' is assigned to

        MATCH (source:Variable {name: 'com', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'supportfiles' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'supportfiles', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'supportfiles' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'supportfiles', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'supportfiles' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'supportfiles', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'supportfiles' in scope '' is assigned to

        MATCH (source:Variable {name: 'supportfiles', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'nnet' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'nnet' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'nnet', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'nnet' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'nnet', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'nnet' in scope '' is assigned to

        MATCH (source:Variable {name: 'nnet', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'directory' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'directory', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'directory' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'directory', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'directory' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'directory', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'directory' in scope '' is assigned to

        MATCH (source:Variable {name: 'directory', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Functions/scripts that use variable 'destination' in scope ''

        MATCH (user)-[:USES]->(var:Variable {name: 'destination', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        

-- Functions/scripts that modify variable 'destination' in scope ''

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'destination', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        

-- Variables assigned to 'destination' in scope ''

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'destination', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        

-- Variables that 'destination' in scope '' is assigned to

        MATCH (source:Variable {name: 'destination', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        

-- Scripts that call 'getSupportFilePath.m'

        MATCH (caller:Script)-[:CALLS]->(target:Script {name: 'getSupportFilePath.m'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller_name
        

-- Functions called by 'getSupportFilePath.m'

        MATCH (script:Script {name: 'getSupportFilePath.m'})-[:CALLS]->(func:Function)
        RETURN func.name as function_name, func.file_path as function_file
        ORDER BY func.name
        

-- Variables used by 'getSupportFilePath.m'

        MATCH (script:Script {name: 'getSupportFilePath.m'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Variables defined by 'getSupportFilePath.m'

        MATCH (script:Script {name: 'getSupportFilePath.m'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        

-- Components that depend on usage of variable 'nnet'

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'utils'

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'examples'

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
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
        

-- Components that depend on usage of variable 'networks'

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'data'

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'utils'

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'examples'

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
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
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
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
        

-- Components that depend on usage of variable 'nnet'

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'utils'

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'examples'

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
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
        

-- Components that depend on usage of variable 'finbert'

        MATCH (user)-[:USES]->(var:Variable {name: 'finbert'})
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
        

-- Components that use variable 'localFile' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'localFile'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'sd' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'sd'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'directory' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'directory'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'fileName' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'fileName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'modelName' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'localFileDir' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'localFileDir'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'sd' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'sd'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'filePath' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'filePath'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'fileName' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'fileName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'localFile' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'localFile'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'sd' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'sd'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'directory' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'directory'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'fileName' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'fileName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'modelName' defined by 'getSupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that depend on usage of variable 'networks'

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'data'

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'nnet'

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'supportfiles'

        MATCH (user)-[:USES]->(var:Variable {name: 'supportfiles'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'com'

        MATCH (user)-[:USES]->(var:Variable {name: 'com'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mathworks'

        MATCH (user)-[:USES]->(var:Variable {name: 'mathworks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'ssd'

        MATCH (user)-[:USES]->(var:Variable {name: 'ssd'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'https'

        MATCH (user)-[:USES]->(var:Variable {name: 'https'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that use variable 'filePath' defined by 'legacySupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'filePath'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'modelDirectory' defined by 'legacySupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelDirectory'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'modelType' defined by 'legacySupportFilePath'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelType'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'directory' defined by 'iCreateDirectoryIfItDoesNotExist'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'directory'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'directory' defined by 'iCreateDirectoryIfItDoesNotExist'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'directory'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'destination' defined by 'iDownloadFileIfItDoesNotExist'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'destination'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        

-- Components that use variable 'destination' defined by 'iDownloadFileIfItDoesNotExist'

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'destination'})
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
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'matlab'

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
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
        

-- Components that depend on usage of variable 'examples'

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'examples'

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'examples'

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'examples'

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'examples'

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'examples'

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'examples'

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'utils'

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'utils'

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'utils'

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'utils'

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'utils'

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'utils'

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'utils'

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'data'

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'data'

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'data'

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'data'

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'data'

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'data'

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'networks'

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'networks'

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'networks'

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'networks'

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'networks'

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'networks'

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'https'

        MATCH (user)-[:USES]->(var:Variable {name: 'https'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'ssd'

        MATCH (user)-[:USES]->(var:Variable {name: 'ssd'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'mathworks'

        MATCH (user)-[:USES]->(var:Variable {name: 'mathworks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'com'

        MATCH (user)-[:USES]->(var:Variable {name: 'com'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'supportfiles'

        MATCH (user)-[:USES]->(var:Variable {name: 'supportfiles'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'nnet'

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'nnet'

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'nnet'

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'nnet'

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'nnet'

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'nnet'

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

-- Components that depend on usage of variable 'nnet'

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        

