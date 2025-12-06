#!/bin/bash

# Usage: ./keep-git-repo-uptodat.sh <branch_name> <commit_message> <repo_url>
# Example: ./keep-git-repo-uptodat.sh feature/login-fix "Add login fix feature" https://github.com/username/repo

BRANCH_NAME=$1
COMMIT_MSG=$2
REPO_URL=$3

if [ -z "$BRANCH_NAME" ] || [ -z "$COMMIT_MSG" ] || [ -z "$REPO_URL" ]; then
  echo "Usage: ./keep-git-repo-uptodat.sh <branch_name> <commit_message> <repo_url>"
  exit 1
fi

# 1. Update local main
git fetch origin
git checkout main
git pull

# 2. Create and switch to new branch
git checkout -b $BRANCH_NAME

# 3. Stage and commit changes
git add .
git commit -m "$COMMIT_MSG"

# 4. Push branch to remote
git push -u origin $BRANCH_NAME

# 5. Open GitHub PR page automatically
PR_URL="${REPO_URL}/compare/main...${BRANCH_NAME}?expand=1"
echo "Opening PR URL: $PR_URL"
# Open in default browser (macOS/Linux)
if command -v xdg-open &> /dev/null; then
  xdg-open "$PR_URL"
elif command -v open &> /dev/null; then
  open "$PR_URL"
else
  echo "Please open this URL manually: $PR_URL"
fi