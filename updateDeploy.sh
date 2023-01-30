#! /bin/bash

cp -r /Users/sherryhsu/Sync/study/Work ./docs

git add .
git commit -m "Updated notes"
git push

echo "https://sherryh.github.io/TIL-mkdocs/"