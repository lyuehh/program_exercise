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

#生成上一小时
lasthour=`echo "set heading off\nselect   to_char(sysdate-1/24, 'yyyymmddHH24')   from   dual;\nexit\n" | sqlplus -s $CRMUSERNAME/$CRMPASSWORD@$CRMDBNAME | grep -v "^$"`

echo lasthour=${lasthour}

for i in cust echn interjl
do
	/cust/shell/tj/tj_all.sh $i $lasthour
	#echo "tj_all.sh $i $lasthour"
done

