#!/bin/bash

# Variables
BRANCH_NAME=$1   # e.g., feature/my-new-branch
COMMIT_MSG=$2    # e.g., "Add login feature"

if [ -z "$BRANCH_NAME" ] || [ -z "$COMMIT_MSG" ]; then
  echo "Usage: ./keep-git-repo-uptodate.sh <branch_name> <commit_message>"
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

echo "Branch '$BRANCH_NAME' pushed to remote."
echo "Now go to GitHub to create a PR from '$BRANCH_NAME'."