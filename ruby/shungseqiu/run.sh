#!/bin/sh

for i in `seq 2003 2014`
do
    u="http://www.3dcp.cn/zs/gonggao.php?type=ssq&year=$i"
    echo $u
    curl -s $u | iconv -f gbk -t utf8  | hquery -e 'table' -c '.eq(13).parent().html()' > $i.html
done
