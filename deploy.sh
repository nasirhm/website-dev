#!/usr/bin/env sh

# abort on errors
set -e

# install dependencies
npm install

# build - creates static site (html, css, js) in dist/
npm run build

# go into build output
cd dist/

# create .nojekyll to remove Jekyll preprocessing
touch .nojekyll

git init

# configure github user
git config user.name "octocat"
git config user.email "octocat@github.com"

git checkout -B dev-deploy
git add -A
git commit -m 'Deployment'

git push -f https://${TARGET_REPO_AUTH}@github.com/Applied-Engineering-FC/applied-engineering-fc.github.io dev-deploy
