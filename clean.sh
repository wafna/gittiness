#!/usr/bin/env bash

export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

export REPO_DIR="$SCRIPT_DIR/repo"

source "$SCRIPT_DIR/util.sh"

rm -rf ./* ./.git

git init

git config init.defaultBranch main

git config alias.hist 'log --graph --pretty="%h %Cgreen%cr %Creset%s" -20'

