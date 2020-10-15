#!/bin/bash

#!/bin/sh

set -euo pipefail

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

hugo -t m10c

msg="rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi

(
    cd public
    git add .
    git commit -m "$msg"
    git push origin master
)

git add .
git commit -m "$msg"
git push origin master

