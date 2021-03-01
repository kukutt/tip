# info
## 官网地址
https://github.com/ipfs/go-ipfs
## 下载地址
[linux] https://github.com/ipfs/go-ipfs/releases/download/v0.8.0/go-ipfs_v0.8.0_linux-amd64.tar.gz
[win] https://github.com/ipfs/go-ipfs/releases/download/v0.8.0/go-ipfs_v0.8.0_windows-amd64.zip
[树莓派] https://github.com/ipfs/go-ipfs/releases/download/v0.8.0/go-ipfs_v0.8.0_linux-arm.tar.gz
## 访问不了
https://ipfs.github.io/public-gateway-checker/ 去看看可以访问网点
测试 https://k2k4r8km2t6v89ervfm8gcx2szxrz8ios9rltwgmbib4bhfgoqgnrydp.ipns.dweb.link/可以访问

# 初始化
ipfs init

# 创建目录
ipfs files mkdir /dirname

# 发布
ipfs name --key=kukutt publish $SITE_CID

# 备份还原ipns
ipfs key export kukutt
ipfs key import kukutt kukutt.key
