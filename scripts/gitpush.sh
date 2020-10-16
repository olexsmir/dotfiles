#!/bin/sh
git add ./
read -p "Commit message: " msg
git commit -am "$msg"
git push origin master
