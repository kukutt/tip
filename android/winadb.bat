::adb logcat >> aa.txt 去查询引用Activity
::adb shell am start -n com.ichano.athome.avs.otg/.LoadingActivity 启动应用
::adb shell am force-stop  com.ichano.athome.avs.otg 关闭应用
::网络调试
::::adb tcpip 5555 （端口号）
::::adb connect 192.168.xx.xx （Android设备IP地址）
::截图
::::adb shell screencap -p /sdcard/screen.png
::::adb pull  /sdcard/screen.png
::解锁
::::adb shell input keyevent 26
::::adb shell input swipe 300 1000 300 500
::::adb shell input text xxxx
SET PATH=%PATH%;C:\Users\admin\AppData\Local\Android\Sdk\platform-tools
cmd