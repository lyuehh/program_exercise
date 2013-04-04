#! /bin/sh

#此脚本用来统计客服接口服务的调用次数

CUST=/cust
. ${CUST}/.profile

cfg_file=${CUST}/shell/tj/tj_all.cfg
tj_log=${CUST}/shell/tj/

#if [ ! -e $cfg_file ]
#then
#	echo "tj_all.cfg missing !!"
#	return 3
#fi

if [ $# -ne 2 ]
then 
	echo "Usage: $0 inter_name time"
	echo "Sample: $0 cust 2011041312"
	return 2
fi

name=$1
log_path=`grep $1 $cfg_file | awk -F, '{print $2}'`
log_name=${log_path}/applog.$2

#echo "[$log_path]"
#echo "[$log_name]"
#echo "------------"

if [ ${log_path}x = ""x ]
then
	echo "No "$1" log file !!"
	return 4
	
fi

#log_path=/inter/interface/bank/log
#log_name=/inter/interface/bank/log/applog.$1
#echo $log_path
#echo $log_name

#echo $log_name


inters=`grep start $log_name | awk '{print $1}' | awk '{split($0,my,"_");print my[2]}' | awk '{a[$0]++} END {for(i in a) print i" "a[i]}' | awk 'BEGIN {print "  接口名称  调用次数	  调用比例"} {sum+=$2} {a[$1]+=$2}; END{for (i in a) print i"	"a[i]"	"a[i]/sum*100"%"}`

echo "$inters" >$tj_log/$1/$1_$2.txt
#echo "$inters"
