#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source "$SCRIPT_DIR/util.sh"

for BRANCH in $(cd .git/refs/heads/ && ls)
do
	git switch "$BRANCH" 2> /dev/null
	log "$BRANCH"
	git hist
done