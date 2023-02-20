#!/usr/bin/env sh

# abort on errors
set -e

# build - creates static site (html, css, js) in dist/
npm run build

# go into build output
cd dist/

# create .nojekyll to remove Jekyll preprocessing
touch .nojekyll

git init
git checkout -B dev-deploy
git add -A
git commit -m 'Deployment'

git push -f https://${REPO_AUTH}@github.com/Applied-Engineering-FC/applied-engineering-fc.git dev-deploy
