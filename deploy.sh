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

echo "${REPO_AUTH}"

TARGET_REPO="https://${REPO_AUTH}@github.com/Applied-Engineering-FC/applied-engineering-fc.github.io.git"

echo $TARGET_REPO

git push -f "https://${REPO_AUTH}@github.com/Applied-Engineering-FC/applied-engineering-fc.github.io.git" dev-deploy
