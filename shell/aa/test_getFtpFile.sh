#! /bin/sh

date +%Y%m%d|read DATE
#DATE=20100628
echo $DATE

DATE=20110331

######�ļ���Ϣ###########
#�˴���������������Ҫ�޸�


#WORKDIR=/bank/shell/file
#FILEPATH=/bank/shell/tmpfile
#ERROR_FILE_PATH=/bank/shell/errorfile
#DISPOSED_FILE_PATH=/bank/print

######�ļ���Ϣ###########
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
	echo "�÷���$0 count"
	return -2
fi

count=$1
echo "��Ҫ������Ŀ��$1"

write_count=`sed "1d" /bank/shell/bankftp.cfg | wc -l | awk '{print $1}'`

if [ $count -ne $write_count ]
then
	echo "��Ŀ����������!!"
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
		echo "��λ: Ԫ"
	else
		echo "��λ�� ��"
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
	
	
############�����ļ�������################
dispose_error_file()
{
#cp ${FILEPATH} ${ERROR_FILE_PATH}
#rm ${FILEPATH}
echo "�쳣�ļ�-������[${FILEPATH}]"
#exit
}
dispose_ok_file(){
cp ${FILEPATH} ${DISPOSED_FILE_PATH}
rm ${FILEPATH}
echo  "++++++++++�ļ�[${unit_code}_${DATE}.TXT]����ɹ�++++++++++"
#exit
}

#########����Ƿ����ļ���Ҫ����############
ls ${WORKDIR}|read checkfile
#echo ---------${checkfile}
if [ "${checkfile}" == "" ]||[ "${checkfile}" == " " ];then
{
	echo "û���ļ���Ҫ����"
	exit
}
fi

####ȡ�����и��Ķ����ļ������������Ͷ��˽��########


check()
{
if [ -a ${FILEPATH} ];then
{
    echo "�ļ�����"
}
else
{
    echo "��鿴�����ļ�����Ŀ¼FILEPATH�����Ƿ���ȷ��"
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
    #echo "COUNT������Ϊ��${infopoint}"
}
fi
if [ "${infopoint}" -ne "${infopoint2}" ];then
{
    #echo "������ȡ����"	
    yhinfo=`echo ${info}|awk -F ',' '{print $0}'|awk -F ',' '{print $1,$2}'|awk -F '=' '{print $2,$3}'|awk '{print $1,$3}'`
}
fi
done

#echo "�ؼ���\"COUNT\"������Ϊ��${infopoint}"

#yhinfo=`echo "COUNT=3,SUMMONEY=130"|awk -F ',' '{print $1,$2}'|awk -F '=' '{print $2,$3}'|awk '{print $1,$3}'`
#echo "������Ϣ-----------${yhinfo}"
rows=`echo ${yhinfo}|awk '{print $1}'`
echo "���ж��˼�¼��Ϊ��${rows}��"
totalmoney=`echo ${yhinfo}|awk '{print $2}'`

echo "���ж����ܽ��Ϊ��[${totalmoney}]Ԫ"
if [ "$MON_TYPE" = "1" ]
then
	## ���м�¼�н�� ��λΪԪ��ת��Ϊ��
	totalmoney=$(echo "$totalmoney*100" | bc)
	totalmoney=${totalmoney%%.*}
else
	## ���м�¼�н�� ��λΪ�֣�����
	echo "��λΪ�֣�����"
fi

echo "���ж����ܽ��Ϊ��${totalmoney}Ԫ"

####��������ж������ݵ�����####
tempcount=`wc -l ${FILEPATH}|awk '{print $1}'`
if [ "${tempcount}" -ge "2" ];then
{
  count=`expr ${tempcount} - 2`
  echo "ʵ������Ϊ��${count}��"
}
else
{
  echo "û�ж�������"
}
fi

####���������������ݵ�ʵ�ʽ��####
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

echo "ʵ�ʽ��Ϊ;${sum}Ԫ"

####�ж������ϴ����ļ���Ϣ�Ƿ���ȷ####
file_flag=0
if [ "${rows}" -ne "${count}" ]||[ "${totalmoney}" -ne "${sum}" ];then
{
    echo "�����ϴ��������ļ������������ܽ������"
    dispose_error_file
    file_flag=1
}
else
{
    echo "�����ϴ��������ļ������������ܽ����ȷ"
    file_flag=0
}
fi

#############��������Ƿ���ȷ################  У������ʱ�����Ĺ����Ż� by zhangtao 20100406
#�˴���ע�͵�һ��α�ɾ���� by www 20110328




############��������Ƿ���ȷ################

if [ "${file_flag}" = "0" ];then
{

point=0
cat ${FILEPATH}|while read line
do
echo ${line}
agt_accept=`echo ${line}|awk -F ',' '{print $2}'`
end_flag=`echo ${line}|awk -F ',' '{print $6}'`
#echo ${agt_accept}
#echo "β��ʾΪ��${end_flag}"
#���˳������ֵ�agt_accept
expr ${agt_accept} + 10 > /dev/null 2>&1
flag=`echo $?`
if [ "${flag}" = "0" ];then
{
    #echo "agt_accept�����ֲŻ����"
    point2=0
    point=`expr ${point} + 1`
    #echo "point��ֵΪ${point}"
    if [ "${rows}" -eq "${point}" ];then
    {
        
        if [ "${end_flag}" -ne "1" ];then
        {
            echo "�����ļ�û��β��ʶ"
            dispose_error_file
        }
        else
        {
            echo "�����ļ���β��ʶ"
        }
        fi
    }
    fi
#�����ˮ�Ƿ����ظ�
agt_accept_no=`grep "${agt_accept}" ${FILEPATH} | wc -l | awk '{print $1}'`
if [ "${agt_accept_no}" -gt "1" ];then
	{
		echo "���ظ���ˮ[agt_accept=${agt_accept}]"
		dispose_error_file
	}
	fi   
    
    
#    cat ${FILEPATH}|while read line2
#		do
#		point2=`expr ${point2} + 1`
#    #echo "point2��ֵΪ${point2}"
#		#echo ${line2}
#		agt_accept2=`echo ${line2}|awk -F ',' '{print $2}'`
#		if [ "${point2}" -gt "${point}" ]; then
#		{
#		    #echo "��һ�����ȵڶ�������"
#		    if [ "${agt_accept2}" = "${agt_accept}" ];then
#		    {
#		        echo "���������ظ���¼"
#		        dispose_error_file
#		    }
#		    fi
#		}
#		fi
#		done
}
fi
done



#########����У����ɺ���ļ�����Ŀ��·��###############
dispose_ok_file
}
fi
}

for unit_code in $BANKCODE_LIST
do
	FILEPATH=${WORKDIR}/${unit_code}_${DATE}.TXT
		if [ -a ${FILEPATH}  ];then
	{
		echo "##########���ڴ���[${unit_code}_${DATE}.TXT]##########"
	  check
	}
	else
	{
		echo "##########[${unit_code}]û�ж��������ļ�##########"
	}
	fi
	
done

	a=$(($a+1))
done

