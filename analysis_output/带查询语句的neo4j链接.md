# 带查询语句的Neo4j链接

## Neo4j浏览器访问

- **Neo4j浏览器地址**: http://localhost:7474
- **用户名**: neo4j
- **密码**: kotei$88

## 快速查询链接

### 1. 查看所有函数

```cypher
MATCH (f:Function) RETURN f LIMIT 100
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=MATCH%20(f:Function)%20RETURN%20f%20LIMIT%20100

### 2. 查看所有变量

```cypher
MATCH (v:Variable) RETURN v LIMIT 100
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=MATCH%20(v:Variable)%20RETURN%20v%20LIMIT%20100

### 3. 查看所有脚本

```cypher
MATCH (s:Script) RETURN s LIMIT 100
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=MATCH%20(s:Script)%20RETURN%20s%20LIMIT%20100

### 4. 查看所有关系

```cypher
MATCH ()-[r]->() RETURN r LIMIT 100
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=MATCH%20()-[r]->()%20RETURN%20r%20LIMIT%20100

## 提交特定查询

### 提交: ce31873a - Update GPT2 support file path handling

#### Functions that call 'getSupportFilePath'

```cypher

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'getSupportFilePath'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28caller%3AFunction%29-%5B%3ACALLS%5D-%3E%28target%3AFunction%20%7Bname%3A%20%27getSupportFilePath%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20caller.name%20as%20caller_name%2C%20caller.file_path%20as%20caller_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20caller.name%0A%20%20%20%20%20%20%20%20

#### Variables used by 'getSupportFilePath'

```cypher

        MATCH (func:Function {name: 'getSupportFilePath'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28func%3AFunction%20%7Bname%3A%20%27getSupportFilePath%27%7D%29-%5B%3AUSES%5D-%3E%28var%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20var.name%20as%20variable_name%2C%20var.scope_id%20as%20scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20var.name%0A%20%20%20%20%20%20%20%20

#### Variables defined by 'getSupportFilePath'

```cypher

        MATCH (func:Function {name: 'getSupportFilePath'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28func%3AFunction%20%7Bname%3A%20%27getSupportFilePath%27%7D%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20var.name%20as%20variable_name%2C%20var.scope_id%20as%20scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20var.name%0A%20%20%20%20%20%20%20%20

#### Impact chain analysis for 'getSupportFilePath'

```cypher

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'getSupportFilePath'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28start%3AFunction%29-%5B%3ACALLS%2A1..3%5D-%3E%28target%3AFunction%20%7Bname%3A%20%27getSupportFilePath%27%7D%29%0A%20%20%20%20%20%20%20%20WITH%20path%2C%20start%2C%20target%2C%20length%28path%29%20as%20depth%0A%20%20%20%20%20%20%20%20RETURN%20start.name%20as%20affected_function%2C%20depth%2C%20%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%5Bnode%20in%20nodes%28path%29%20%7C%20node.name%5D%20as%20call_chain%0A%20%20%20%20%20%20%20%20ORDER%20BY%20depth%2C%20start.name%0A%20%20%20%20%20%20%20%20

#### Functions that call 'legacySupportFilePath'

```cypher

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'legacySupportFilePath'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28caller%3AFunction%29-%5B%3ACALLS%5D-%3E%28target%3AFunction%20%7Bname%3A%20%27legacySupportFilePath%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20caller.name%20as%20caller_name%2C%20caller.file_path%20as%20caller_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20caller.name%0A%20%20%20%20%20%20%20%20

#### Variables used by 'legacySupportFilePath'

```cypher

        MATCH (func:Function {name: 'legacySupportFilePath'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28func%3AFunction%20%7Bname%3A%20%27legacySupportFilePath%27%7D%29-%5B%3AUSES%5D-%3E%28var%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20var.name%20as%20variable_name%2C%20var.scope_id%20as%20scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20var.name%0A%20%20%20%20%20%20%20%20

#### Variables defined by 'legacySupportFilePath'

```cypher

        MATCH (func:Function {name: 'legacySupportFilePath'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28func%3AFunction%20%7Bname%3A%20%27legacySupportFilePath%27%7D%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20var.name%20as%20variable_name%2C%20var.scope_id%20as%20scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20var.name%0A%20%20%20%20%20%20%20%20

#### Impact chain analysis for 'legacySupportFilePath'

```cypher

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'legacySupportFilePath'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28start%3AFunction%29-%5B%3ACALLS%2A1..3%5D-%3E%28target%3AFunction%20%7Bname%3A%20%27legacySupportFilePath%27%7D%29%0A%20%20%20%20%20%20%20%20WITH%20path%2C%20start%2C%20target%2C%20length%28path%29%20as%20depth%0A%20%20%20%20%20%20%20%20RETURN%20start.name%20as%20affected_function%2C%20depth%2C%20%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%5Bnode%20in%20nodes%28path%29%20%7C%20node.name%5D%20as%20call_chain%0A%20%20%20%20%20%20%20%20ORDER%20BY%20depth%2C%20start.name%0A%20%20%20%20%20%20%20%20

#### Functions that call 'iCreateDirectoryIfItDoesNotExist'

```cypher

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'iCreateDirectoryIfItDoesNotExist'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28caller%3AFunction%29-%5B%3ACALLS%5D-%3E%28target%3AFunction%20%7Bname%3A%20%27iCreateDirectoryIfItDoesNotExist%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20caller.name%20as%20caller_name%2C%20caller.file_path%20as%20caller_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20caller.name%0A%20%20%20%20%20%20%20%20

#### Variables used by 'iCreateDirectoryIfItDoesNotExist'

```cypher

        MATCH (func:Function {name: 'iCreateDirectoryIfItDoesNotExist'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28func%3AFunction%20%7Bname%3A%20%27iCreateDirectoryIfItDoesNotExist%27%7D%29-%5B%3AUSES%5D-%3E%28var%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20var.name%20as%20variable_name%2C%20var.scope_id%20as%20scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20var.name%0A%20%20%20%20%20%20%20%20

#### Variables defined by 'iCreateDirectoryIfItDoesNotExist'

```cypher

        MATCH (func:Function {name: 'iCreateDirectoryIfItDoesNotExist'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28func%3AFunction%20%7Bname%3A%20%27iCreateDirectoryIfItDoesNotExist%27%7D%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20var.name%20as%20variable_name%2C%20var.scope_id%20as%20scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20var.name%0A%20%20%20%20%20%20%20%20

#### Impact chain analysis for 'iCreateDirectoryIfItDoesNotExist'

```cypher

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'iCreateDirectoryIfItDoesNotExist'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28start%3AFunction%29-%5B%3ACALLS%2A1..3%5D-%3E%28target%3AFunction%20%7Bname%3A%20%27iCreateDirectoryIfItDoesNotExist%27%7D%29%0A%20%20%20%20%20%20%20%20WITH%20path%2C%20start%2C%20target%2C%20length%28path%29%20as%20depth%0A%20%20%20%20%20%20%20%20RETURN%20start.name%20as%20affected_function%2C%20depth%2C%20%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%5Bnode%20in%20nodes%28path%29%20%7C%20node.name%5D%20as%20call_chain%0A%20%20%20%20%20%20%20%20ORDER%20BY%20depth%2C%20start.name%0A%20%20%20%20%20%20%20%20

#### Functions that call 'iDownloadFileIfItDoesNotExist'

```cypher

        MATCH (caller:Function)-[:CALLS]->(target:Function {name: 'iDownloadFileIfItDoesNotExist'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28caller%3AFunction%29-%5B%3ACALLS%5D-%3E%28target%3AFunction%20%7Bname%3A%20%27iDownloadFileIfItDoesNotExist%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20caller.name%20as%20caller_name%2C%20caller.file_path%20as%20caller_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20caller.name%0A%20%20%20%20%20%20%20%20

#### Variables used by 'iDownloadFileIfItDoesNotExist'

```cypher

        MATCH (func:Function {name: 'iDownloadFileIfItDoesNotExist'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28func%3AFunction%20%7Bname%3A%20%27iDownloadFileIfItDoesNotExist%27%7D%29-%5B%3AUSES%5D-%3E%28var%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20var.name%20as%20variable_name%2C%20var.scope_id%20as%20scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20var.name%0A%20%20%20%20%20%20%20%20

#### Variables defined by 'iDownloadFileIfItDoesNotExist'

```cypher

        MATCH (func:Function {name: 'iDownloadFileIfItDoesNotExist'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28func%3AFunction%20%7Bname%3A%20%27iDownloadFileIfItDoesNotExist%27%7D%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20var.name%20as%20variable_name%2C%20var.scope_id%20as%20scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20var.name%0A%20%20%20%20%20%20%20%20

#### Impact chain analysis for 'iDownloadFileIfItDoesNotExist'

```cypher

        MATCH path = (start:Function)-[:CALLS*1..3]->(target:Function {name: 'iDownloadFileIfItDoesNotExist'})
        WITH path, start, target, length(path) as depth
        RETURN start.name as affected_function, depth, 
               [node in nodes(path) | node.name] as call_chain
        ORDER BY depth, start.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28start%3AFunction%29-%5B%3ACALLS%2A1..3%5D-%3E%28target%3AFunction%20%7Bname%3A%20%27iDownloadFileIfItDoesNotExist%27%7D%29%0A%20%20%20%20%20%20%20%20WITH%20path%2C%20start%2C%20target%2C%20length%28path%29%20as%20depth%0A%20%20%20%20%20%20%20%20RETURN%20start.name%20as%20affected_function%2C%20depth%2C%20%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%5Bnode%20in%20nodes%28path%29%20%7C%20node.name%5D%20as%20call_chain%0A%20%20%20%20%20%20%20%20ORDER%20BY%20depth%2C%20start.name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'fileName' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'fileName', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27fileName%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'fileName' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'fileName', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27fileName%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'fileName' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'fileName', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27fileName%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'fileName' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'fileName', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27fileName%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'filePath' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'filePath', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27filePath%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'filePath' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'filePath', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27filePath%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'filePath' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'filePath', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27filePath%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'filePath' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'filePath', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27filePath%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'sd' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'sd', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27sd%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'sd' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'sd', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27sd%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'sd' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'sd', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27sd%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'sd' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'sd', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27sd%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'localFileDir' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'localFileDir', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27localFileDir%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'localFileDir' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'localFileDir', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27localFileDir%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'localFileDir' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'localFileDir', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27localFileDir%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'localFileDir' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'localFileDir', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27localFileDir%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'arguments' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'arguments' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'arguments', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'arguments' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'arguments', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27arguments%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'arguments' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'arguments', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27arguments%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'string' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'string' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'string', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'string' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'string', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27string%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'string' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'string', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27string%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'matlab' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'matlab' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'matlab', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'matlab' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'matlab', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27matlab%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'matlab' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'matlab', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27matlab%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'internal' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'internal' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'internal', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'internal' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'internal', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27internal%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'internal' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'internal', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27internal%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'examples' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'examples', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'examples' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'examples', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'examples' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'examples', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27examples%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'examples' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'examples', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27examples%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'utils' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'utils', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'utils' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'utils', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'utils' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'utils', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27utils%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'utils' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'utils', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27utils%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'data' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'data', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27data%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'data' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'data', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27data%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'data' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'data', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27data%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'data' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'data', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27data%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'networks' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'networks', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27networks%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'networks' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'networks', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27networks%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'networks' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'networks', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27networks%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'networks' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'networks', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27networks%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'modelType' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'modelType', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27modelType%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'modelType' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'modelType', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27modelType%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'modelType' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'modelType', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27modelType%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'modelType' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'modelType', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27modelType%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'modelDirectory' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'modelDirectory', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27modelDirectory%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'modelDirectory' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'modelDirectory', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27modelDirectory%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'modelDirectory' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'modelDirectory', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27modelDirectory%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'modelDirectory' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'modelDirectory', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27modelDirectory%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'https' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'https', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27https%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'https' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'https', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27https%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'https' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'https', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27https%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'https' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'https', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27https%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'ssd' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'ssd', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27ssd%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'ssd' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'ssd', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27ssd%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'ssd' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'ssd', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27ssd%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'ssd' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'ssd', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27ssd%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'mathworks' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'mathworks', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27mathworks%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'mathworks' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'mathworks', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27mathworks%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'mathworks' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'mathworks', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27mathworks%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'mathworks' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'mathworks', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27mathworks%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'com' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'com', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27com%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'com' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'com', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27com%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'com' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'com', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27com%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'com' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'com', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27com%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'supportfiles' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'supportfiles', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27supportfiles%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'supportfiles' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'supportfiles', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27supportfiles%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'supportfiles' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'supportfiles', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27supportfiles%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'supportfiles' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'supportfiles', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27supportfiles%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'nnet' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'nnet' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'nnet', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'nnet' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'nnet', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27nnet%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'nnet' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'nnet', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27nnet%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'directory' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'directory', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27directory%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'directory' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'directory', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27directory%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'directory' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'directory', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27directory%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'directory' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'directory', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27directory%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that use variable 'destination' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'destination', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27destination%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'destination' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'destination', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27destination%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'destination' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'destination', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27destination%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'destination' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'destination', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27destination%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Scripts that call 'getSupportFilePath.m'

```cypher

        MATCH (caller:Script)-[:CALLS]->(target:Script {name: 'getSupportFilePath.m'})
        RETURN caller.name as caller_name, caller.file_path as caller_file
        ORDER BY caller_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28caller%3AScript%29-%5B%3ACALLS%5D-%3E%28target%3AScript%20%7Bname%3A%20%27getSupportFilePath.m%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20caller.name%20as%20caller_name%2C%20caller.file_path%20as%20caller_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20caller_name%0A%20%20%20%20%20%20%20%20

#### Functions called by 'getSupportFilePath.m'

```cypher

        MATCH (script:Script {name: 'getSupportFilePath.m'})-[:CALLS]->(func:Function)
        RETURN func.name as function_name, func.file_path as function_file
        ORDER BY func.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28script%3AScript%20%7Bname%3A%20%27getSupportFilePath.m%27%7D%29-%5B%3ACALLS%5D-%3E%28func%3AFunction%29%0A%20%20%20%20%20%20%20%20RETURN%20func.name%20as%20function_name%2C%20func.file_path%20as%20function_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20func.name%0A%20%20%20%20%20%20%20%20

#### Variables used by 'getSupportFilePath.m'

```cypher

        MATCH (script:Script {name: 'getSupportFilePath.m'})-[:USES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28script%3AScript%20%7Bname%3A%20%27getSupportFilePath.m%27%7D%29-%5B%3AUSES%5D-%3E%28var%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20var.name%20as%20variable_name%2C%20var.scope_id%20as%20scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20var.name%0A%20%20%20%20%20%20%20%20

#### Variables defined by 'getSupportFilePath.m'

```cypher

        MATCH (script:Script {name: 'getSupportFilePath.m'})-[:DEFINES]->(var:Variable)
        RETURN var.name as variable_name, var.scope_id as scope
        ORDER BY var.name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28script%3AScript%20%7Bname%3A%20%27getSupportFilePath.m%27%7D%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20var.name%20as%20variable_name%2C%20var.scope_id%20as%20scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20var.name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'nnet'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'utils'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'examples'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'bert'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'bert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27bert%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'networks'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27networks%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'data'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27data%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'utils'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'examples'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'nnet'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'utils'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'examples'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'finbert'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'finbert'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27finbert%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'localFile' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'localFile'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27localFile%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'sd' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'sd'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27sd%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'directory' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'directory'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27directory%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'fileName' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'fileName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27fileName%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'modelName' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27modelName%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'localFileDir' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'localFileDir'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27localFileDir%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'sd' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'sd'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27sd%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'filePath' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'filePath'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27filePath%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'fileName' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'fileName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27fileName%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'localFile' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'localFile'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27localFile%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'sd' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'sd'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27sd%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'directory' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'directory'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27directory%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'fileName' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'fileName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27fileName%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'modelName' defined by 'getSupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelName'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27modelName%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'networks'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27networks%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'data'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27data%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'nnet'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'supportfiles'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'supportfiles'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27supportfiles%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'com'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'com'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27com%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'mathworks'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'mathworks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27mathworks%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'ssd'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'ssd'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27ssd%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'https'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'https'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27https%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'filePath' defined by 'legacySupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'filePath'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27filePath%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'modelDirectory' defined by 'legacySupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelDirectory'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27modelDirectory%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'modelType' defined by 'legacySupportFilePath'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'modelType'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27modelType%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'directory' defined by 'iCreateDirectoryIfItDoesNotExist'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'directory'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27directory%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'directory' defined by 'iCreateDirectoryIfItDoesNotExist'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'directory'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27directory%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'destination' defined by 'iDownloadFileIfItDoesNotExist'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'destination'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27destination%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that use variable 'destination' defined by 'iDownloadFileIfItDoesNotExist'

```cypher

        MATCH (definer)-[:DEFINES]->(var:Variable {name: 'destination'})
        MATCH (user)-[:USES]->(var)
        RETURN labels(user)[0] as user_type, user.name as user_name,
               labels(definer)[0] as definer_type, definer.name as definer_name
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28definer%29-%5B%3ADEFINES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27destination%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20labels%28definer%29%5B0%5D%20as%20definer_type%2C%20definer.name%20as%20definer_name%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'arguments'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'arguments'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27arguments%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'string'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'string'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27string%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'matlab'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'matlab'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27matlab%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'internal'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'internal'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27internal%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'examples'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'examples'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'examples'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'examples'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'examples'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'examples'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'examples'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'examples'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27examples%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'utils'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'utils'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'utils'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'utils'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'utils'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'utils'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'utils'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'utils'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27utils%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'data'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27data%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'data'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27data%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'data'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27data%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'data'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27data%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'data'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27data%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'data'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'data'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27data%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'networks'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27networks%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'networks'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27networks%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'networks'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27networks%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'networks'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27networks%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'networks'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27networks%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'networks'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'networks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27networks%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'https'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'https'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27https%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'ssd'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'ssd'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27ssd%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'mathworks'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'mathworks'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27mathworks%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'com'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'com'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27com%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'supportfiles'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'supportfiles'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27supportfiles%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'nnet'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'nnet'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'nnet'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'nnet'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'nnet'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'nnet'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'nnet'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'nnet'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27nnet%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20


## 使用说明

1. 点击上述链接直接跳转到Neo4j浏览器
2. 链接会自动执行相应的查询语句
3. 可以在浏览器中修改查询语句进行进一步分析
4. 使用Neo4j浏览器的可视化功能查看图形结果

---
*生成时间: 2025-06-25 11:15:24*
