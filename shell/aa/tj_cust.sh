#! /bin/sh

#�˽ű�����ͳ�ƿͷ��ӿڷ���ĵ��ô���

if [ $# -ne 1 ]
then 
	echo "Usage: $0 time"
	echo "Sample: $0 2011041312"
	return 2
fi

log_path=/cust/log
log_name=/cust/log/applog.$1

#echo $log_name


inters=`grep start $log_name | awk '{print $1}' | awk '{split($0,my,"_");print my[2]}' | awk '{a[$0]++} END {for(i in a) print i" "a[i]}' | awk 'BEGIN {print "  �ӿ�����	    ���ô���	   ���ñ���"} {sum+=$2} {a[$1]+=$2}; END{for (i in a) print i"	"a[i]"	"a[i]/sum*100"%"}`

echo "$inters" >$0.txt
