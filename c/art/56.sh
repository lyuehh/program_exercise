#!/bin/sh

for i in `cat 56.in`; do
    echo $i | ./a.out
done

# show the longest
# cat 56.out | awk ' BEGIN {a=1; b=0} {if (NF > a) {a = NF;b=$0} } END {print a, b}'
