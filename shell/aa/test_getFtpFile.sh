#! /bin/sh

date +%Y%m%d|read DATE
#DATE=20100628
echo $DATE

DATE=20110331

######文件信息###########
#此处在生产环境上需要修改


#WORKDIR=/bank/shell/file
#FILEPATH=/bank/shell/tmpfile
#ERROR_FILE_PATH=/bank/shell/errorfile
#DISPOSED_FILE_PATH=/bank/print

######文件信息###########
WORKDIR=/bank/temfile
FILEPATH=/bank/temfile/
ERROR_FILE_PATH=/bank/temfile
DISPOSED_FILE_PATH=/bank/print

if [ ! -e /bank/shell/bankftp.cfg ]
then
	echo "bankftp.cfg missing!!"
	echo ""
	return -1
fi

if [ $# -ne 1 ]
then 
	echo "用法：$0 count"
	return -2
fi

count=$1
echo "需要处理数目：$1"

write_count=`sed "1d" /bank/shell/bankftp.cfg | wc -l | awk '{print $1}'`

if [ $count -ne $write_count ]
then
	echo "数目不符，请检查!!"
	return -3
fi

a=1
echo "--- $a"
echo "--- $count"

while [ $a -le $count ]
do
	echo "--$a"
	
	USERNAME=`sed "1d" /bank/shell/bankftp.cfg |sed -n "${a}p" | cut -d, -f1`
	PASSWORD=`sed "1d" /bank/shell/bankftp.cfg |sed -n "${a}p" | cut -d, -f2`
	HOMEPATH=`sed "1d" /bank/shell/bankftp.cfg |sed -n "${a}p" | cut -d, -f3`
	FILEBAKPATH=`sed "1d" /bank/shell/bankftp.cfg |sed -n "${a}p" | cut -d, -f4`
	BANKCODE_LIST=`sed "1d" /bank/shell/bankftp.cfg |sed -n "${a}p" | cut -d, -f5`
	MON_TYPE=`sed "1d" /bank/shell/bankftp.cfg | sed -n "${a}p" | cut -d, -f6`
	
	FTPIP=130.89.214.83
	
	echo "USERNAME: $USERNAME"	
	echo "PASSWORD: $PASSWORD"
	echo "HOMEPATH: $HOMEPATH"
	echo "FILEBAKPATH: $FILEBAKPATH"
	echo "BANKCODE_LIST: $BANKCODE_LIST"
	echo "MON_TYPE: [$MON_TYPE]"
	
	if [ "$MON_TYPE" = "1" ]
	then
		echo "单位: 元"
	else
		echo "单位： 分"
	fi
	
	get_ftp_file(){
		cd ${WORKDIR}
		ftp -inv ${FTPIP} << !
user ${USERNAME} ${PASSWORD}
cd ${HOMEPATH}
get ${unit_code}_${DATE}.TXT
put ${unit_code}_${DATE}.TXT ${FILEBAKPATH}${unit_code}_${DATE}.TXT
delete ${unit_code}_${DATE}.TXT
bye
!
	}

	for unit_code in $BANKCODE_LIST
	do
		get_ftp_file
	done
	
	
############数据文件检查后处理################
dispose_error_file()
{
#cp ${FILEPATH} ${ERROR_FILE_PATH}
#rm ${FILEPATH}
echo "异常文件-保存在[${FILEPATH}]"
#exit
}
dispose_ok_file(){
cp ${FILEPATH} ${DISPOSED_FILE_PATH}
rm ${FILEPATH}
echo  "++++++++++文件[${unit_code}_${DATE}.TXT]处理成功++++++++++"
#exit
}

#########检查是否有文件需要处理############
ls ${WORKDIR}|read checkfile
#echo ---------${checkfile}
if [ "${checkfile}" == "" ]||[ "${checkfile}" == " " ];then
{
	echo "没有文件需要处理"
	exit
}
fi

####取出银行给的对账文件中数据行数和对账金额########


check()
{
if [ -a ${FILEPATH} ];then
{
    echo "文件存在"
}
else
{
    echo "请查看您的文件处理目录FILEPATH配置是否正确！"
#    exit
}
fi
infopoint=0
infopoint2=0
cat ${FILEPATH}|while read info
do
infopoint2=`expr ${infopoint2} + 1`
countinfo=`echo ${info}|awk -F ',' '{print $1}'|awk -F '=' '{print $1}'`
#echo "countinfo:${countinfo}"
if [ "${countinfo}" != "COUNT" ];then
{
    infopoint=`expr ${infopoint} + 1` 
    #echo "COUNT所在行为：${infopoint}"
}
fi
if [ "${infopoint}" -ne "${infopoint2}" ];then
{
    #echo "这里提取数据"	
    yhinfo=`echo ${info}|awk -F ',' '{print $0}'|awk -F ',' '{print $1,$2}'|awk -F '=' '{print $2,$3}'|awk '{print $1,$3}'`
}
fi
done

#echo "关键字\"COUNT\"所在行为：${infopoint}"

#yhinfo=`echo "COUNT=3,SUMMONEY=130"|awk -F ',' '{print $1,$2}'|awk -F '=' '{print $2,$3}'|awk '{print $1,$3}'`
#echo "银行信息-----------${yhinfo}"
rows=`echo ${yhinfo}|awk '{print $1}'`
echo "银行对账记录数为：${rows}条"
totalmoney=`echo ${yhinfo}|awk '{print $2}'`

echo "银行对账总金额为：[${totalmoney}]元"
if [ "$MON_TYPE" = "1" ]
then
	## 银行记录中金额 单位为元，转化为分
	totalmoney=$(echo "$totalmoney*100" | bc)
	totalmoney=${totalmoney%%.*}
else
	## 银行记录中金额 单位为分，不动
	echo "单位为分，不动"
fi

echo "银行对账总金额为：${totalmoney}元"

####计算出银行对账数据的条数####
tempcount=`wc -l ${FILEPATH}|awk '{print $1}'`
if [ "${tempcount}" -ge "2" ];then
{
  count=`expr ${tempcount} - 2`
  echo "实际条数为：${count}条"
}
else
{
  echo "没有对账数据"
}
fi

####计算银行所给数据的实际金额####
sum=0
cat ${FILEPATH}|while read file
do
money=`echo ${file}|awk -F ',' '{print $5}'`
#echo ${money}
if [ "${money}" != " " ]&&[ "${money}" != "" ];then
{
    sum=`expr ${sum} + ${money}`
}
fi
done
sum=`expr ${sum}`

echo "实际金额为;${sum}元"

####判断银行上传的文件信息是否正确####
file_flag=0
if [ "${rows}" -ne "${count}" ]||[ "${totalmoney}" -ne "${sum}" ];then
{
    echo "银行上传的数据文件对账条数或总金额有误"
    dispose_error_file
    file_flag=1
}
else
{
    echo "银行上传的数据文件对账条数或总金额正确"
    file_flag=0
}
fi

#############检查数据是否正确################  校验数据时间消耗过长优化 by zhangtao 20100406
#此处的注释的一大段被删除了 by www 20110328




############检查数据是否正确################

if [ "${file_flag}" = "0" ];then
{

point=0
cat ${FILEPATH}|while read line
do
echo ${line}
agt_accept=`echo ${line}|awk -F ',' '{print $2}'`
end_flag=`echo ${line}|awk -F ',' '{print $6}'`
#echo ${agt_accept}
#echo "尾标示为：${end_flag}"
#过滤出是数字的agt_accept
expr ${agt_accept} + 10 > /dev/null 2>&1
flag=`echo $?`
if [ "${flag}" = "0" ];then
{
    #echo "agt_accept是数字才会进来"
    point2=0
    point=`expr ${point} + 1`
    #echo "point的值为${point}"
    if [ "${rows}" -eq "${point}" ];then
    {
        
        if [ "${end_flag}" -ne "1" ];then
        {
            echo "数据文件没有尾标识"
            dispose_error_file
        }
        else
        {
            echo "数据文件有尾标识"
        }
        fi
    }
    fi
#检查流水是否有重复
agt_accept_no=`grep "${agt_accept}" ${FILEPATH} | wc -l | awk '{print $1}'`
if [ "${agt_accept_no}" -gt "1" ];then
	{
		echo "有重复流水[agt_accept=${agt_accept}]"
		dispose_error_file
	}
	fi   
    
    
#    cat ${FILEPATH}|while read line2
#		do
#		point2=`expr ${point2} + 1`
#    #echo "point2的值为${point2}"
#		#echo ${line2}
#		agt_accept2=`echo ${line2}|awk -F ',' '{print $2}'`
#		if [ "${point2}" -gt "${point}" ]; then
#		{
#		    #echo "第一个数比第二个数大"
#		    if [ "${agt_accept2}" = "${agt_accept}" ];then
#		    {
#		        echo "数据中有重复记录"
#		        dispose_error_file
#		    }
#		    fi
#		}
#		fi
#		done
}
fi
done



#########所有校验完成后把文件传至目标路径###############
dispose_ok_file
}
fi
}

for unit_code in $BANKCODE_LIST
do
	FILEPATH=${WORKDIR}/${unit_code}_${DATE}.TXT
		if [ -a ${FILEPATH}  ];then
	{
		echo "##########正在处理[${unit_code}_${DATE}.TXT]##########"
	  check
	}
	else
	{
		echo "##########[${unit_code}]没有对账数据文件##########"
	}
	fi
	
done

	a=$(($a+1))
done

