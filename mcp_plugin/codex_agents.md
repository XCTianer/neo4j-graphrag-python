# Codex MCP Agents Configuration

This file defines automated agents for Codex that use MCP tools for code analysis.

## Agent: Code Impact Analyzer

**Purpose**: Automatically analyze code changes and their impact using MCP tools.

**Trigger**: When reviewing code changes, commits, or pull requests.

**Workflow**:
1. Detect recent code changes
2. Run MCP analysis tools
3. Generate impact report
4. Provide recommendations

**Commands**:
```bash
# Get recent commits
git log --oneline -5

# Analyze each commit
for commit in $(git log --oneline -3 | awk '{print $1}'); do
    echo "Analyzing commit: $commit"
    ./mcp_plugin/codex_wrapper.sh analyze_code_changes $commit
done

# Generate comprehensive report
python mcp_plugin/codex_automation.py --action report --output impact_analysis.md
```

## Agent: File Dependency Analyzer

**Purpose**: Analyze file dependencies and impact chains.

**Trigger**: When working with specific files or during refactoring.

**Workflow**:
1. Identify target file
2. Get impact chains
3. Visualize dependencies
4. Suggest refactoring strategies

**Commands**:
```bash
# Analyze specific file
./mcp_plugin/codex_wrapper.sh get_file_impact "src/main.py"

# Get impact chains with depth 5
./mcp_plugin/codex_wrapper.sh get_impact_chains "src/main.py" 5

# Generate dependency graph
python mcp_plugin/codex_automation.py --action impact-chains --file "src/main.py" --depth 5
```

## Agent: Commit Impact Reviewer

**Purpose**: Review and analyze specific commits for impact assessment.

**Trigger**: When reviewing specific commits or before merging.

**Workflow**:
1. Get commit details
2. Analyze changes
3. Assess impact
4. Generate review report

**Commands**:
```bash
# Get current commit
CURRENT_COMMIT=$(git rev-parse HEAD)

# Analyze commit
./mcp_plugin/codex_wrapper.sh analyze_code_changes $CURRENT_COMMIT

# Get commit analysis
./mcp_plugin/codex_wrapper.sh get_commit_analysis $CURRENT_COMMIT
```

## Agent: System Health Monitor

**Purpose**: Monitor system configuration and health using MCP tools.

**Trigger**: Periodically or when system issues are suspected.

**Workflow**:
1. Check system configuration
2. Validate Neo4j connection
3. Test MCP tools
4. Generate health report

**Commands**:
```bash
# Check system configuration
./mcp_plugin/codex_wrapper.sh get_analysis_config

# Get available Neo4j queries
./mcp_plugin/codex_wrapper.sh get_neo4j_queries

# Test MCP integration
python mcp_plugin/simple_codex_test.py
```

## Agent: Automated Code Review

**Purpose**: Automatically review code changes and provide feedback.

**Trigger**: On every commit or pull request.

**Workflow**:
1. Analyze code changes
2. Identify potential issues
3. Generate review comments
4. Suggest improvements

**Commands**:
```bash
# Get recent changes
RECENT_COMMITS=$(git log --oneline -3 | awk '{print $1}')

# Analyze each commit
for commit in $RECENT_COMMITS; do
    echo "=== Reviewing commit: $commit ==="
    ./mcp_plugin/codex_wrapper.sh analyze_code_changes $commit
    
    # Get changed files
    CHANGED_FILES=$(git show --name-only $commit | tail -n +2)
    
    for file in $CHANGED_FILES; do
        if [ -f "$file" ]; then
            echo "Analyzing file: $file"
            ./mcp_plugin/codex_wrapper.sh get_file_impact "$file"
        fi
    done
done
```

## Agent: Performance Impact Analyzer

**Purpose**: Analyze performance impact of code changes.

**Trigger**: When performance-critical code is modified.

**Workflow**:
1. Identify performance-critical files
2. Analyze impact chains
3. Assess performance implications
4. Suggest optimizations

**Commands**:
```bash
# Analyze performance-critical files
PERFORMANCE_FILES=("src/core/engine.py" "src/optimization/algorithm.py")

for file in "${PERFORMANCE_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "Analyzing performance impact: $file"
        ./mcp_plugin/codex_wrapper.sh get_impact_chains "$file" 5
    fi
done
```

## Agent: Security Impact Analyzer

**Purpose**: Analyze security implications of code changes.

**Trigger**: When security-sensitive code is modified.

**Workflow**:
1. Identify security-sensitive files
2. Analyze dependencies
3. Assess security risks
4. Generate security report

**Commands**:
```bash
# Analyze security-sensitive files
SECURITY_FILES=("src/auth/" "src/encryption/" "src/validation/")

for dir in "${SECURITY_FILES[@]}"; do
    if [ -d "$dir" ]; then
        echo "Analyzing security impact: $dir"
        find "$dir" -name "*.py" -exec ./mcp_plugin/codex_wrapper.sh get_file_impact {} \;
    fi
done
```

## Usage Examples

### Example 1: Daily Code Review
```bash
# Run daily automated review
python mcp_plugin/codex_automation.py --action analyze --commits 5
python mcp_plugin/codex_automation.py --action report --output daily_review.md
```

### Example 2: Pre-merge Analysis
```bash
# Analyze before merging
CURRENT_BRANCH=$(git branch --show-current)
TARGET_BRANCH="main"

# Get commits to be merged
COMMITS_TO_MERGE=$(git log --oneline $TARGET_BRANCH..$CURRENT_BRANCH | awk '{print $1}')

for commit in $COMMITS_TO_MERGE; do
    ./mcp_plugin/codex_wrapper.sh analyze_code_changes $commit
done
```

### Example 3: Refactoring Impact Assessment
```bash
# Before refactoring a file
TARGET_FILE="src/core/legacy_module.py"

# Get current impact
./mcp_plugin/codex_wrapper.sh get_file_impact "$TARGET_FILE"
./mcp_plugin/codex_wrapper.sh get_impact_chains "$TARGET_FILE" 5

# Generate refactoring plan
python mcp_plugin/codex_automation.py --action prompt > refactoring_plan.md
```

## Integration with Codex

To use these agents in Codex:

1. **Start Codex session**:
   ```bash
   cd /home/kotei/work/codex/codex-cli
   node ./dist/cli.js
   ```

2. **Use agent prompts**:
   ```
   Please run the Code Impact Analyzer agent to analyze recent changes:
   
   git log --oneline -3
   for commit in $(git log --oneline -3 | awk '{print $1}'); do
       ./mcp_plugin/codex_wrapper.sh analyze_code_changes $commit
   done
   
   Then provide a summary of the impact analysis and recommendations.
   ```

3. **Automated workflow**:
   ```
   I want to refactor src/core/engine.py. Please:
   1. Run the File Dependency Analyzer agent
   2. Analyze the impact chains
   3. Suggest a safe refactoring strategy
   4. Generate a step-by-step refactoring plan
   ```

## Configuration

Create a `.codex-agents` file in your project root:

```yaml
agents:
  code_impact_analyzer:
    enabled: true
    auto_run: false
    trigger: manual
    
  file_dependency_analyzer:
    enabled: true
    auto_run: true
    trigger: file_change
    
  commit_impact_reviewer:
    enabled: true
    auto_run: true
    trigger: commit
    
  system_health_monitor:
    enabled: true
    auto_run: true
    trigger: periodic
    interval: 3600  # 1 hour
```

This configuration enables automated agents that integrate MCP tools with Codex workflows. 