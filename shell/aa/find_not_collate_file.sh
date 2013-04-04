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
	echo "print    目录下有 [$1_$2] 文件"
else
	echo "print    目录下没有 [$1_$2] 文件"
fi

if [ -e /bank/printbak/$1_$2.txt ] || [ -e /bank/printbak/$1_$2.TXT ]
then
	echo "printbak    目录下有 [$1_$2] 文件"
else
	echo "printbak    目录下没有 [$1_$2] 文件"
fi

