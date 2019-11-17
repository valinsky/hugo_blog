#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to valinsky.github.io\033[0m\n"

printf "\033[0;32mDelete old public build? y/[n]\033[0m\n"
read delete
if [[ $delete == 'y' ]] || [[ $delete == 'yes' ]]; then
	printf "\e[91mDeleting public build!\n"
	script_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
	find $script_path/public/ -mindepth 1 -not -name 'CNAME' -not -name .git -not -name README.md -delete
fi

printf "\033[0;32mBuilding hugo site.\033[0m\n"
hugo

printf "\033[0;32mCommit public folder.\033[0m\n"
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

printf "\033[0;32mDon't forget to push to hugo_blog.\033[0m\n"
