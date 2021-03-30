# 环境设置
## flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1
## jdk


# 编译

## web
flutter build web
pushd ./build/web ; python3 -m http.server ; popd


# docker
sudo docker run --rm -it -v ${PWD}:/build --workdir /build dockerlinz/flutter:stable
