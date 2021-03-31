#!/bin/bash
# 获取工作路径
homePath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
workPath=$PWD
echo work dir [$homePath] [$workPath]

export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

export JAVA_HOME=$homePath/jdk/
export CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export ANDROID_SDK_ROOT=$homePath/android_sdk/
export PATH=$homePath/flutter/bin:$JAVA_HOME/bin:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/:$PATH
export LD_LIBRARY_PATH=$homePath/run/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$homePath/run/lib/pkgconfig:$PKG_CONFIG_PATH
