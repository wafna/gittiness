#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source "$SCRIPT_DIR/util.sh"

touchAndGo main-1 main-1
touchAndGo main-2 main-2
touchAndGo main-3 main-3
touchAndGo main-4 main-4

