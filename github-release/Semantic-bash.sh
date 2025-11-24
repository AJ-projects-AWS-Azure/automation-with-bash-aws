#!/bin/bash

# Get latest commit message
COMMIT_MSG=$(git log -1 --pretty=%B)

echo "Commit message: $COMMIT_MSG"
BUMP="patch"   # ⭐ Default bump = PATCH

# Check for BREAKING CHANGE or feat!
if echo "$COMMIT_MSG" | grep -qi "BREAKING CHANGE"; then
  BUMP="major"
elif echo "$COMMIT_MSG" | grep -qi "^feat!"; then
  BUMP="major"
elif echo "$COMMIT_MSG" | grep -qi "^feat"; then
  BUMP="minor"
elif echo "$COMMIT_MSG" | grep -qi "^fix"; then
  BUMP="patch"
fi

echo "Bump type detected: $BUMP"

# Pass bump type as output (GitHub Actions style)
echo "bump=$BUMP" >> $GITHUB_OUTPUT 2>/dev/null || true
