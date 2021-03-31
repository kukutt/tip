# 环境设置
## flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1
## jdk
去[官网](https://www.oracle.com/java/technologies/javase-downloads.html)下载
目前使用[jdk8](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html)可以使用

## android sdk
环境配置
```
wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
./cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_ROOT "cmdline-tools;latest"
```
手动管理包命令(flutter会自动下载android sdk包)
```
sdkmanager --list
sdkmanager "platform-tools" "build-tools;28.0.3" "platforms;android-28"
```
## xbuild

# 编译

## web
flutter build web
pushd ./build/web ; python3 -m http.server ; popd


# docker
sudo docker run --rm -it -v ${PWD}:/build --workdir /build dockerlinz/flutter:stable
