#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

REPO_DIR="$SCRIPT_DIR/repo"

if [ "$(pwd)" != "$REPO_DIR" ]
then
  echo "Must run in $REPO_DIR"
fi

log() {
  for LINE in "$@"
  do
    echo ">>= $LINE"
  done
}

# Creates one or more files, appends the commit message to each, adds them to staging, then commits the lot.
# Usage: <commit> <files...>
touchAndGo() {
  "$SCRIPT_DIR/work.sh" "$@"
}