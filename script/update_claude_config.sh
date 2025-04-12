#!/bin/bash

SOURCE_FILE="/Users/jinhyeokhong/Library/Application Support/Claude/claude_desktop_config.json"
DEST_FILE="claude_config.json"

if [ ! -f "$SOURCE_FILE" ]; then
  echo "not found: $SOURCE_FILE"
  exit 1
fi

echo "Copying $SOURCE_FILE to $DEST_FILE..."
cp "$SOURCE_FILE" "$DEST_FILE"
git add "$DEST_FILE"

if git diff --cached --quiet; then
  echo "no changes, exiting."
  exit 0
fi

git -c core.hooksPath=/dev/null commit -m "Claude 설정 파일 업데이트 $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main
echo "Updated $DEST_FILE to the repository."
