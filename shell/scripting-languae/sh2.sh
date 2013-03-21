#!/bin/sh

# 打印重复文件的sha值
# shasum *.mp3 | sort -u | awk '{a[$1]++;if(a[$1] > 1){print $0}}' | awk '{print $1}'
shasum *.mp3 | sort -u | awk '{a[$2] = $1;} END {for(i in a) {print i"\t"a[i]}}'
