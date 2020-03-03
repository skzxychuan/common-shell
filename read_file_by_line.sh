#!/bin/sh

#两种比较好用的方法,这两种方法避免了"for xxx in xxx"语句的空格换行问题，很好用

#方法一：
cat data.dat | while read line
do
    echo "File:${line}"
done

#方法二：
while read line
do
    echo "File:${line}"
done < data.dat


#关于for XXX in XXX 方法的缺陷：

#	for var in file　表示变量var在file中循环取值．取值的分隔符由$IFS确定．
#		1 for line in $(cat data.dat)
#		2 do 
#		3     echo "File:${line}"
#		4 done
#		5 
#		6 for line in `cat data.dat`
#		7 do 
#		8     echo "File:${line}"
#		9 done
#	如果输入文本每行中没有空格，则line在输入文本中按换行符分隔符循环取值．如果输入文本中包括空格或制表符，则不是换行读取，line在输入文本中按空格分隔符或制表符或换行
#	符特环取值．可以通过把IFS设置为换行符来达到逐行读取的功能．
#	demo：
#	假设现需要读取如下的文件rollback_config.txt：
#		ROLLBACK_SERVICES:upserv  checkserv
#		ROLLBACK_VERSION:v1.1
#	使用   for line in `cat rollback_config.txt`; do echo "${line}"; done  读取的结果会是：
#	ROLLBACK_SERVICES:upserv 
#	checkserv
#	ROLLBACK_VERSION:v1.1
#	显然不是我们想要的。解决方法：
#	IFS_old=$IFS
#	IFS=$'\n'
#	for line in  `cat  rollback_config`;do
#	echo "$line"
#	done;
#	IFS=$IFS_old
#	这样一来就可以了！IFS的默认值为：空白(包括：空格，制表符，换行符)．

