#!/bin/sh

echo "stopping XXXXXX.."

#这里如果只用JarLauncher,有误杀其他作业的风险,通过选项来识别
for i in `jps -lv | grep "JarLauncher" | grep "ds-XXXXXX-sched-lib" | awk '{print $1}'`
do
    echo "killing pid  "${i} ;
    kill ${i}
done

echo "stop XXXXXX done.."
