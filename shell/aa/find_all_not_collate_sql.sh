#! bin/sh

if [ $# -ne 1 ]
then 
	echo "Usage: $0 month,Sample: $0 201103"
	echo ""
	return 10
fi

### �˺���������ORACLE���ݿ⣬�������ں�agt_code ��ȡ���˴���ļ�¼

get_not_collate_sql()
{
	sqlplus -s offon/offon@crmdb <<!
set heading off feedback off pagesize 0 verify off echo off
select agt_code, count(*)  from dtranslog where collate_flag = '0'   and unpay_flag = '0'   and to_char(agt_date, 'yyyymmdd') = '$1' group by agt_code;
   quit
!
	return 0
}

#����agt_code �� agt_date ��ѯ�����˳�������(�˴������ agt-code ����Ϊ 3λ������)
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
		
### �ж� ${agt_code}0000_${day}.txt �ļ���print �ļ��к�printbak�ļ������Ƿ����
### ���� ff ��ֵ�жϣ�print �´��ڣ�ff + 1����printbak�´��ڣ� ff + 2��
### ��������������У�ff = 3��һ�㲻�ᷢ������print�´��� printbak�²����ڣ�ff = 1����Ҫ�ֶ����ж��˳��򣩣�
###��print�²����ڣ�prinbak�´��ڣ��ռ��ľ�����Щ��¼����
### ff = 2���������ڣ�ff = 0�������ˣ���
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


### �����ҳ� ff = 1 �ļ�¼���ֶ����ж��˳���

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
			echo "ff = 0 ���������"
		elif [ $ff = 1 ]
		then
			echo "ff = 1 ���ö��˳������ ++++++++++++++++"
			echo "$file_name" > /bank/shell/temp/${file}_list.txt
			cat /bank/shell/temp/${file}_list.txt
			echo "+++++++++++++++++"
			#/bank/bin/collate_bank shell/temp/${file}_list.txt print 1
		elif [ $ff = 2 ]
		then
			echo "ff = 2 ��¼SQL��ѯ��� [agt_code] = [${agt_code}0000] [date] = [${a}]"
			echo "agt_code = [${agt_code}0000],date = [${a}]" >> /bank/shell/result.txt
			get_sql_result ${agt_code}0000 ${a} >> /bank/shell/result.txt
			echo "sql���ý���--------"
		else [ $ff = 3 ]
			echo "ff = 4 ����������ټ�"
		fi
	done
	
	a=$(($a+1))
done