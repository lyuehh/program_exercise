#! /bin/sh

debug=1
today=`date  +%Y%m%d`
ystd=$(($today-1))
echo "Time: $ystd"

#log=applog.$today
#ylog=applog.$ystd
#echo $ylog

s1=0
while [ s1 -lt 24 ];do
	
	if [ s1 -lt 10 ]
	then
		lname="applog.${ystd}0$s1"
		logname=`print "/cust/log/${lname}"`
	else
		lname="applog.${ystd}$s1"
		logname=`print "/cust/log/${lname}"`
	fi
	
	echo $lname
	#echo "LOGNAME: $logname" >> ${lname}.txt
	
    #grep 00215 $logname | grep "sent pkg"  | awk '{print $1}'  | while read line;do
	grep 00215 $logname | grep "sent pkg" |  awk '{split($1,ret,"|");print ret[1]}' | while read line;do
		#grep "$line" "$logname" | grep start | awk '{split($1,ret2,"_");printf ret2[2]}' | while read line2;do
		#	echo $line2
		#done
		time=`grep "$line" "$logname" | grep start | head -1 | awk '{print $3, $4}' | awk '{split($0,aa,"=");print aa[1]}'`
		ermsg=`grep "$line" "$logname" | grep failed`
		echo `print "$time -> $ermsg"` >> /cust/shell/errorlog/applog.${ystd}.txt
		echo "..."
	done
	echo "ok~~~~"
	s1=$(($s1+1))
done
