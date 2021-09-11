#!/usr/bin/env bash

# Simulate some work on some files.

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source "$SCRIPT_DIR/util.sh"

COMMIT="$1"
shift
for FILE in "$@"
do
	echo "$COMMIT" >> "$FILE"
	git add "$FILE" > /dev/null || exit 2
done
git commit -m "$COMMIT" > /dev/null || exit 2
