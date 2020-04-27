#!/bin/sh

#shell中的变量默认都是String, 可以用declare -i声明成int
declare -i num=0

while true
do
    echo "ds:total:count:"
    redis-cli -h xxx.xxx.xxx -p xxxx GET ds:hermes:job:inst:progress:ds:total:count:${1}:${2}
    echo "sink:total:num:"
    redis-cli -h xxx.xxx.xxx -p xxxx GET ds:hermes:job:inst:progress:sink:total:num:${1}:${2}
    echo "real:total:count:"
    redis-cli -h xxx.xxx.xxx -p xxxx GET ds:hermes:job:inst:progress:real:total:count:${1}:${2}
    num=${num}+1
    echo "========================${num}"
    sleep 2
done
