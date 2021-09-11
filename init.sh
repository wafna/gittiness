#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

REPO_DIR="$SCRIPT_DIR/repo"

[ -d "$REPO_DIR" ] || mkdir "$REPO_DIR"
