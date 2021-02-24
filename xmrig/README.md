https://www.onepool.com/
git clone https://github.com/xmrig/xmrig.git
sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
sudo apt-get install automake libtool autoconf -y

./xmrig -o xmr.pool.onepool.co:13531 -u id:aa -p x -k


pushd ./web ; python3 -m http.server 27463 ; popd
