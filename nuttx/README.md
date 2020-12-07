#

## 
sudo apt-get install git gcc gcc-arm-none-eabi automake bison build-essential flex gperf libncurses5-dev libtool libusb-dev libusb-1.0-0-dev

git clone https://github.com/apache/incubator-nuttx nuttx
git clone https://github.com/apache/incubator-nuttx-apps apps

## no kconfig-tweak 
git clone https://bitbucket.org/nuttx/tools.git
cd tools/kconfig-frontends
./configure --prefix=$PWD/../../run/
. ./env.sh



# 
./tools/configure.sh stm32f4discovery:nsh
