#!/usr/bin/env bash
cd "~/Documents/notes/"
today=$(date +'%d%m%Y')

if [[ `git status --porcelain` ]]; then
    git add .
    git commit -m "$today notes backup"
    git push
fi
