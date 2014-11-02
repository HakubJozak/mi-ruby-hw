#!/usr/bin/env bash
set -euo pipefail # see http://redsymbol.net/articles/unofficial-bash-strict-mode/


usage() {
    echo -e "Update master branch from both origin and upstream and switch to a new branch with a given name (or create a new one)."
    echo
    echo "Usage: $0 <branch name>"; exit 1;
}

git_current_branch() {
    git rev-parse --abbrev-ref HEAD
}

echo_branch() {
    echo -e "\033[1mYou are now on branch: $(git_current_branch)\033[0m"
}

[ $# -eq 0 ] && usage

BRANCH=$1

git checkout master
echo_branch

echo "Merging from origin"
git fetch origin -v
git merge origin/master

echo "Updating from upstream"
git fetch upstream
git rebase upstream/master

echo "Checkout branch $BRANCH"
git checkout "$BRANCH" || git checkout -b "$BRANCH"
echo_branch
