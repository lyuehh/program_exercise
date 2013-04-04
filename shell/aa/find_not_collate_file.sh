#! /bin/sh

if [ $# -ne 2 ]
then
	echo "Usage: $1 agt_code date,Sample: $2 907 20110301"
	return 10
fi

echo "-------------------------------------------"
echo ""
echo "agt_code = [$1],date = [$2]"


if [ -e /bank/print/$1_$2.txt ] || [ -e /bank/print/$1_$2.TXT ]
then
	echo "print    Ŀ¼���� [$1_$2] �ļ�"
else
	echo "print    Ŀ¼��û�� [$1_$2] �ļ�"
fi

if [ -e /bank/printbak/$1_$2.txt ] || [ -e /bank/printbak/$1_$2.TXT ]
then
	echo "printbak    Ŀ¼���� [$1_$2] �ļ�"
else
	echo "printbak    Ŀ¼��û�� [$1_$2] �ļ�"
fi

