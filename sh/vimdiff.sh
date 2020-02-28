#!/bin/sh
while test $# -gt 2; do shift; done
vimdiff $@

# chmod +x vindiff.sh
# ~/.subversion/config 파일 안에 
# diff-cmd = vimdiff.sh

