#! /bin/sh

DIR=/cust/shell/errorlog
DSTFILE=/cust/shell/result215.txt

echo `print "时间 	客服编码 	客服名称 	错误代码 	错误信息"` >> $DSTFILE

#ls -1 $DIR | xargs cat | while read line
cat applog.20110222.txt | while read line
do
	time=`echo $line | awk '{print $1}'`
	custid=`echo $line | awk '{print $4}'| awk '{split($0,aa,"|");print aa[2]}'`
	custname=`echo $line | awk '{print $5}'`
	errorid=`echo $line | awk '{print $7}'| awk '{split($0,bb,"\]");print bb[1]}'`
	errormsg=`echo $line | awk '{print $7}'| awk '{split($0,cc,"\]");print cc[2]}'`
	
	echo `print "$time 	$custid 	$custname 	$errorid 	$errormsg"`
	echo `print "$time 	$custid 	$custname 	$errorid 	$errormsg"` >> $DSTFILE
	
done

