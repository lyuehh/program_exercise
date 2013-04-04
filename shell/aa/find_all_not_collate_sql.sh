#! bin/sh

if [ $# -ne 1 ]
then 
	echo "Usage: $0 month,Sample: $0 201103"
	echo ""
	return 10
fi

### 此函数连接至ORACLE数据库，根据日期和agt_code 获取对账错误的记录

get_not_collate_sql()
{
	sqlplus -s offon/offon@crmdb <<!
set heading off feedback off pagesize 0 verify off echo off
select agt_code, count(*)  from dtranslog where collate_flag = '0'   and unpay_flag = '0'   and to_char(agt_date, 'yyyymmdd') = '$1' group by agt_code;
   quit
!
	return 0
}

#根据agt_code 和 agt_date 查询出对账出错数据(此处传入的 agt-code 必须为 3位！！！)
get_sql_result() 
{
	
	sqlplus -s offon/offon@crmdb <<!
set heading off feedback off pagesize 0 verify off echo off 
set lines 300
select * from dtranslog where agt_code = '$1' and collate_flag = '0' and unpay_flag = '0' and to_char(agt_date, 'yyyymmdd') = '$2';
   quit
!
	return 0
}

echo "123"

day_first=20110301
day_last=20110330

echo "345"
a=$day_first
while [ $a -le $day_last ]
do
	get_not_collate_sql $a > /bank/shell/temp/${a}.txt
	a=$(($a+1))
done

echo "567"
a=$day_first
while [ $a -le $day_last ]
do
	echo "+++++++++"
	cat /bank/shell/temp/${a}.txt | while read line
	do
	
		echo "---- $line"
		agt_code=`echo "$line" | cut -c1-3`
		file="${agt_code}_${a}"
		ff=0
		
### 判断 ${agt_code}0000_${day}.txt 文件在print 文件夹和printbak文件夹中是否存在
### 根据 ff 的值判断，print 下存在，ff + 1。，printbak下存在， ff + 2，
### 共四种情况，均有，ff = 3（一般不会发生）；print下存在 printbak下不存在，ff = 1（需要手动运行对账程序）；
###　print下不存在，prinbak下存在（收集的就是这些记录）；
### ff = 2；均不存在，ff = 0（不管了）；
		echo "---- file = [$file]"
		if [ -e /bank/print/${file}.txt ] || [ -e /bank/print/${file}.TXT ]
		then
			ff=$(($ff+1))
		else
			ff=$(($ff+0))
		fi

		if [ -e /bank/printbak/${file}.txt ] || [ -e /bank/printbak/${file}.TXT ]
		then
			ff=$(($ff+2))
		else
			ff=$(($ff+0))
		fi
		echo "$line  -> $ff "		
		echo `print "$line   $ff "` >> /bank/shell/temp/${a}_result.txt
	done		
	
	a=$(($a+1))
done


### 现在找出 ff = 1 的记录，手动运行对账程序

echo "879"
a=$day_first
while [ $a -le $day_last ]
do
	cat /bank/shell/temp/${a}_result.txt | while read line
	do
		agt_code=`echo "$line" | cut -c1-3`
		file="${agt_code}_${a}"
		
		if [ -e /bank/print/${file}.txt ]
		then
			file_name=${file}.txt
		else
			file_name=${file}.TXT
		fi
		
		
		ff=`echo "$line" | awk '{print $3}'`
		if [ $ff = 0 ]
		then
			echo "ff = 0 此情况不管"
		elif [ $ff = 1 ]
		then
			echo "ff = 1 调用对账程序对账 ++++++++++++++++"
			echo "$file_name" > /bank/shell/temp/${file}_list.txt
			cat /bank/shell/temp/${file}_list.txt
			echo "+++++++++++++++++"
			#/bank/bin/collate_bank shell/temp/${file}_list.txt print 1
		elif [ $ff = 2 ]
		then
			echo "ff = 2 记录SQL查询结果 [agt_code] = [${agt_code}0000] [date] = [${a}]"
			echo "agt_code = [${agt_code}0000],date = [${a}]" >> /bank/shell/result.txt
			get_sql_result ${agt_code}0000 ${a} >> /bank/shell/result.txt
			echo "sql调用结束--------"
		else [ $ff = 3 ]
			echo "ff = 4 此情况极其少见"
		fi
	done
	
	a=$(($a+1))
done