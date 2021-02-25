#!/bin/bash

SAPATH=./run
SATOOL=$SAPATH/ssh-auditor
SAUSER=("root" "admin" "tomcat" "test" "system" "role1" "role1")

do_download(){
    rm -rf $SAPATH ssh-auditor_0.16_linux_amd64.tar.gz ssh_db.sqlite
    wget https://github.com/ncsa/ssh-auditor/releases/download/v0.16/ssh-auditor_0.16_linux_amd64.tar.gz
    tar -zxvf ssh-auditor_0.16_linux_amd64.tar.gz 
    mv ssh-auditor_0.16_linux_amd64 $SAPATH
    $SATOOL --help
}

do_init(){
    do_download
    for value in ${SAUSER[@]}
    do
        cat ./password.txt | xargs -t -i $SATOOL credential add $value {} 
    done
    $SATOOL credential list
}
do_scan(){
    echo scan
}
do_see(){
    echo "$SATOOL credential add root 12345678"
    echo "$SATOOL credential list"
    echo "$SATOOL discover -p 22 -p 2222 192.168.1.0/24 10.0.0.1/24"
    echo "$SATOOL host list"
    echo "$SATOOL scan"
    echo "$SATOOL vuln"
}
do_auto(){
    echo auto
}
case "$1" in
	init|scan|see|auto)
	do_$1
	;;
	*)
	echo "使用方法: $0 { init | scan | see | auto }"
	;;
esac
