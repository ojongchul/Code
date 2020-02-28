#!/bin/bash

#backup wiki

cd ~/wiki/
watch -n 10 -g -d git status -s

git add -A;
os=uname
if [ $(uname) != 'Darwin' ];  // OS X
  then ls -alt --time-style='+%Y-%m-%d  %H:%M' *.md Log/*.md | grep -Ev 'index.md|README' | awk '{print "* ["$6,  $7"]",  "[["substr($8,0,length($8)-2)"]]" "(/"$8")"}' > index.md
else // Linux
  gls -alt --time-style='+%Y-%m-%d  %H:%M' *.md Log/*.md | grep -Ev 'index.md|README' | awk '{print "* ["$6,  $7"]",  "[["substr($8,0,length($8)-3)"]]" "(/"$8")"}' > index.md
fi

cp index.md README.md
git add -A;
git commit -am "$(git status -s)"
git push

#backup dotfile

cp  $HOME/{.zshrc,.vimrc} ~/dotfile/ && cd ~/dotfile/

gs="$(git status | grep -i "modified")"
git add -u;
git commit -m "New backup `date +'%Y-%m-%d %H:%M:%S'`";
git push
