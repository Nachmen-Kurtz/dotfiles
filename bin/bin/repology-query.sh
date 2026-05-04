#!/bin/sh

# Usage: repology-query.sh <project> [repo]
# Example: repology-query.sh firefox void

BASE="https://repology.org/api/v1"
PROJECT="${1}"
REPO="${2}"

if [ -z "$PROJECT" ]; then
    echo "Usage: $0 <project> [repo]"
    exit 1
fi

DATA=$(curl -s \
    -H "User-Agent: repology-query-script/1.0 (https://codeberg.org/nachmenk/repology-query)" \
    "${BASE}/project/${PROJECT}")

if [ -z "$DATA" ] || [ "$DATA" = "[]" ]; then
    echo "No results for: $PROJECT"
    exit 1
fi

echo "$DATA" | python3 -c "
import sys, json

data = json.load(sys.stdin)
repo_filter = '${REPO}'

for pkg in data:
    repo    = pkg.get('repo', '')
    version = pkg.get('version', 'N/A')
    status  = pkg.get('status', 'N/A')
    name    = pkg.get('visiblename') or pkg.get('binname') or pkg.get('srcname', '')
    summary = pkg.get('summary', '')

    if repo_filter and repo_filter not in repo:
        continue

    print(f'repo={repo}  name={name}  version={version}  status={status}')
    if summary:
        print(f'  summary: {summary}')
"
