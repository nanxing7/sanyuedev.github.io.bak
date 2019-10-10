#!/bin/sh
DATA="$1"

git add .
git commit -m '提交'
git push
echo $DATA