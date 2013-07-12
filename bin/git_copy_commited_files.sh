#!/bin/bash
# Copying all changed files from the last N commits
# Taken from https://git.wiki.kernel.org/index.php/ExampleScripts

# Usage:
# ../copy_git_recent.sh "/destination/path" number_of_revisions
#
# Example:
# ../copy_git_recent.sh "/cygdrive/c/Windows Documents/SourceSafe/Project1" 4

for file in $(git diff-tree master~$2 master --name-only -r); do
  cp --parents "$file" "$1"
done