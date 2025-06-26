"""
GitHub integration module for fetching code change records via GitHub API (no local clone).
"""

import requests
import os
from datetime import datetime, timedelta
from typing import List, Dict, Optional
import logging

logger = logging.getLogger(__name__)

class GitHubIntegration:
    """GitHub integration for fetching repository changes via API."""
    
    def __init__(self, repo_url: str, github_token: Optional[str] = None):
        """
        Args:
            repo_url: GitHub repository URL (e.g. https://github.com/owner/repo.git)
            github_token: Optional GitHub personal access token for private repos or higher rate limit
        """
        self.repo_url = repo_url
        self.repo_name = self._extract_repo_name(repo_url)
        self.owner, self.repo = self.repo_name.split('/')
        self.api_base = f"https://api.github.com/repos/{self.owner}/{self.repo}"
        
        # Configure session with proxy support
        self.session = requests.Session()
        
        # Disable proxies completely to avoid SOCKS issues
        # proxies = {}
        # if os.environ.get('http_proxy'):
        #     proxies['http'] = os.environ.get('http_proxy')
        # if os.environ.get('https_proxy'):
        #     proxies['https'] = os.environ.get('https_proxy')
        
        # if proxies:
        #     self.session.proxies.update(proxies)
        #     logger.info(f"Using proxies: {proxies}")
        
        # Explicitly disable proxies
        self.session.proxies = {}
        logger.info("Proxies disabled to avoid SOCKS issues")
        
        # Try to get token from parameter, then environment variable
        if github_token:
            self.token = github_token
        else:
            self.token = os.environ.get('GITHUB_TOKEN')
        
        if self.token:
            self.session.headers["Authorization"] = f"token {self.token}"
            logger.info("GitHub token configured - using authenticated API calls")
        else:
            logger.warning("No GitHub token provided - using unauthenticated API calls (limited rate)")
        
        self.session.headers["Accept"] = "application/vnd.github+json"
    
    def _extract_repo_name(self, repo_url: str) -> str:
        """Extract owner/repo from URL."""
        if repo_url.endswith('.git'):
            repo_url = repo_url[:-4]
        parts = repo_url.split('/')
        return f"{parts[-2]}/{parts[-1]}"
    
    def clone_or_update_repository(self) -> bool:
        """No-op for API mode, always return True."""
        return True
    
    def get_recent_commits(self, days: int = 7, per_page: int = 30, max_commits: Optional[int] = None) -> List[Dict]:
        """
        Get recent commits from the repository via GitHub API.
        Args:
            days: Number of days to look back
            per_page: Number of commits per page (max 100)
            max_commits: Maximum number of commits to return (None for all)
        Returns:
            List of commit information
        """
        since = (datetime.utcnow() - timedelta(days=days)).isoformat() + 'Z'
        url = f"{self.api_base}/commits"
        params = {"since": since, "per_page": per_page}
        resp = self.session.get(url, params=params)
        if resp.status_code != 200:
            logger.error(f"Failed to fetch commits: {resp.text}")
            return []
        commits = []
        for c in resp.json():
            commits.append({
                'hash': c['sha'],
                'author_name': c['commit']['author']['name'],
                'author_email': c['commit']['author']['email'],
                'date': c['commit']['author']['date'],
                'message': c['commit']['message'],
                'url': c['url']
            })
        
        # Limit to max_commits if specified
        if max_commits and len(commits) > max_commits:
            commits = commits[:max_commits]
            logger.info(f"Limited to {max_commits} most recent commits")
        
        logger.info(f"Found {len(commits)} recent commits via API")
        return commits
    
    def get_latest_commit(self) -> Optional[Dict]:
        """
        Get only the latest commit from the repository (no date restriction).
        Returns:
            Latest commit information or None
        """
        url = f"{self.api_base}/commits"
        params = {"per_page": 1}
        resp = self.session.get(url, params=params)
        if resp.status_code != 200:
            logger.error(f"Failed to fetch latest commit: {resp.text}")
            return None
        commits = []
        for c in resp.json():
            commits.append({
                'hash': c['sha'],
                'author_name': c['commit']['author']['name'],
                'author_email': c['commit']['author']['email'],
                'date': c['commit']['author']['date'],
                'message': c['commit']['message'],
                'url': c['url']
            })
        if commits:
            logger.info(f"Found latest commit: {commits[0]['hash'][:8]} - {commits[0]['message']}")
            return commits[0]
        else:
            logger.warning("No commits found")
            return None
    
    def get_commit_changes(self, commit_hash: str) -> List[Dict]:
        """
        Get changes for a specific commit via GitHub API.
        Args:
            commit_hash: Git commit hash
        Returns:
            List of file changes
        """
        url = f"{self.api_base}/commits/{commit_hash}"
        resp = self.session.get(url)
        if resp.status_code != 200:
            logger.error(f"Failed to fetch commit {commit_hash}: {resp.text}")
            return []
        data = resp.json()
        changes = []
        for f in data.get('files', []):
            changes.append({
                'status': f.get('status'),
                'file_path': f.get('filename'),
                'commit_hash': commit_hash,
                'additions': f.get('additions', 0),
                'deletions': f.get('deletions', 0),
                'changes': f.get('changes', 0),
                'patch': f.get('patch', None)
            })
        return changes
    
    def get_file_content(self, file_path: str, commit_hash: Optional[str] = None) -> Optional[str]:
        """
        Get content of a specific file at a commit via GitHub API.
        Args:
            file_path: Path to the file
            commit_hash: Specific commit hash (optional)
        Returns:
            File content as string (text), or None
        """
        if not commit_hash:
            logger.warning("commit_hash is required for get_file_content in API mode")
            return None
        url = f"{self.api_base}/contents/{file_path}"
        params = {"ref": commit_hash}
        resp = self.session.get(url, params=params)
        if resp.status_code == 200:
            import base64
            content = resp.json().get('content', '')
            encoding = resp.json().get('encoding', 'base64')
            if encoding == 'base64':
                return base64.b64decode(content).decode('utf-8', errors='ignore')
            else:
                return content
        else:
            logger.error(f"Failed to fetch file content: {resp.text}")
            return None
    
    def get_repository_info(self) -> Dict:
        """
        Get basic repository information via API.
        Returns:
            Repository information dictionary
        """
        url = f"{self.api_base}"
        resp = self.session.get(url)
        if resp.status_code != 200:
            logger.error(f"Failed to fetch repo info: {resp.text}")
            return {}
        data = resp.json()
        return {
            'name': data.get('full_name', self.repo_name),
            'url': data.get('html_url', self.repo_url),
            'local_path': None,
            'last_updated': data.get('updated_at', None)
        } 