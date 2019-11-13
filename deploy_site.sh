#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub\033[0m\n"

# echo -e "\033[0;32mDelete old build\033[0m"
# find ./public/ -not -name 'CNAME' -delete

printf "\033[0;32mBuilding hugo site\033[0m\n"
# TODO remove -D
hugo -D

printf "\033[0;32mCommit public folder\033[0m\n"
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

printf "\033[0;32mPush public to valinsky.github.io\033[0m\n"
git push origin master

printf "\033[0;32mDon't forget to push to hugo_blog\033[0m\n"
