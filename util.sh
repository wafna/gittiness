#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

REPO_DIR="$SCRIPT_DIR/repo"

if [ "$(pwd)" != "$REPO_DIR" ]
then
  echo "Must run in $REPO_DIR"
fi

# Creates one or more files, adds them to staging, then commits the lot.
# Usage: <commit> <files...>
touchAndGo() {
  local COMMIT="$1"
  shift
  for FILE in "$@"
  do
    echo "$COMMIT" >> "$FILE"
    git add "$FILE" > /dev/null || exit 2
  done
  git commit -m "$COMMIT" > /dev/null || exit 2
}