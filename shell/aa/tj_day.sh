#! /bin/sh

#if [ ! -e tj_all.sh ]
#then
#	echo "tj_all.sh missing !!"
#	return 2
#fi
CUST=/cust
. ${CUST}/.profile

CRMDBNAME=crmdb
CRMUSERNAME=offon
CRMPASSWORD=offon
DESTIP=130.89.2.22

#生成昨天日期
lastdate=`echo "set heading off\nselect to_char(sysdate-1,'yyyymmdd') from dual;\nexit\n" | sqlplus -s $CRMUSERNAME/$CRMPASSWORD@$CRMDBNAME | grep -v "^$"`

echo lastdate=${lastdate}

for i in bank onecard intervc
do
	/cust/shell/tj/tj_all.sh $i $lastdate
	#echo "tj_all.sh $i $lastdate"
done

