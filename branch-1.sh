#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source "$SCRIPT_DIR/util.sh"

"$SCRIPT_DIR/main.sh"

git switch -c branch-1 HEAD^^

touchAndGo branch-1-1 branch-1-1
touchAndGo branch-1-2 branch-1-2

git switch -
