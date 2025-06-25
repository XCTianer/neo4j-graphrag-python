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

#### Functions/scripts that use variable 'source' in scope ''

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'source', scope_id: ''})
        RETURN labels(user)[0] as user_type, user.name as user_name, user.file_path as user_file
        ORDER BY user_type, user_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27source%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28user%29%5B0%5D%20as%20user_type%2C%20user.name%20as%20user_name%2C%20user.file_path%20as%20user_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20user_type%2C%20user_name%0A%20%20%20%20%20%20%20%20

#### Functions/scripts that modify variable 'source' in scope ''

```cypher

        MATCH (modifier)-[:MODIFIES]->(var:Variable {name: 'source', scope_id: ''})
        RETURN labels(modifier)[0] as modifier_type, modifier.name as modifier_name, modifier.file_path as modifier_file
        ORDER BY modifier_type, modifier_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28modifier%29-%5B%3AMODIFIES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27source%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20labels%28modifier%29%5B0%5D%20as%20modifier_type%2C%20modifier.name%20as%20modifier_name%2C%20modifier.file_path%20as%20modifier_file%0A%20%20%20%20%20%20%20%20ORDER%20BY%20modifier_type%2C%20modifier_name%0A%20%20%20%20%20%20%20%20

#### Variables assigned to 'source' in scope ''

```cypher

        MATCH (source:Variable)-[:ASSIGNED_TO]->(target:Variable {name: 'source', scope_id: ''})
        RETURN source.name as source_name, source.scope_id as source_scope
        ORDER BY source_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%20%7Bname%3A%20%27source%27%2C%20scope_id%3A%20%27%27%7D%29%0A%20%20%20%20%20%20%20%20RETURN%20source.name%20as%20source_name%2C%20source.scope_id%20as%20source_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20source_name%0A%20%20%20%20%20%20%20%20

#### Variables that 'source' in scope '' is assigned to

```cypher

        MATCH (source:Variable {name: 'source', scope_id: ''})-[:ASSIGNED_TO]->(target:Variable)
        RETURN target.name as target_name, target.scope_id as target_scope
        ORDER BY target_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28source%3AVariable%20%7Bname%3A%20%27source%27%2C%20scope_id%3A%20%27%27%7D%29-%5B%3AASSIGNED_TO%5D-%3E%28target%3AVariable%29%0A%20%20%20%20%20%20%20%20RETURN%20target.name%20as%20target_name%2C%20target.scope_id%20as%20target_scope%0A%20%20%20%20%20%20%20%20ORDER%20BY%20target_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'directory'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'directory'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27directory%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'directory'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'directory'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27directory%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'destination'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'destination'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27destination%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'destination'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'destination'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27destination%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'source'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'source'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27source%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20

#### Components that depend on usage of variable 'source'

```cypher

        MATCH (user)-[:USES]->(var:Variable {name: 'source'})
        MATCH path = (dependent)-[:CALLS*0..3]->(user)
        WHERE dependent <> user
        RETURN labels(dependent)[0] as dependent_type, dependent.name as dependent_name,
               length(path) as dependency_depth
        ORDER BY dependency_depth, dependent_name
        
```

**直接链接**: http://localhost:7474/browser/?cmd=play&arg=%0A%20%20%20%20%20%20%20%20MATCH%20%28user%29-%5B%3AUSES%5D-%3E%28var%3AVariable%20%7Bname%3A%20%27source%27%7D%29%0A%20%20%20%20%20%20%20%20MATCH%20path%20%3D%20%28dependent%29-%5B%3ACALLS%2A0..3%5D-%3E%28user%29%0A%20%20%20%20%20%20%20%20WHERE%20dependent%20%3C%3E%20user%0A%20%20%20%20%20%20%20%20RETURN%20labels%28dependent%29%5B0%5D%20as%20dependent_type%2C%20dependent.name%20as%20dependent_name%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20length%28path%29%20as%20dependency_depth%0A%20%20%20%20%20%20%20%20ORDER%20BY%20dependency_depth%2C%20dependent_name%0A%20%20%20%20%20%20%20%20


## 使用说明

1. 点击上述链接直接跳转到Neo4j浏览器
2. 链接会自动执行相应的查询语句
3. 可以在浏览器中修改查询语句进行进一步分析
4. 使用Neo4j浏览器的可视化功能查看图形结果

---
*生成时间: 2025-06-25 13:56:27*
