#!/bin/sh

declare -i a
a=1

for i in `cat u.txt`;
do
    curl -s $i | json_reformat > $a.json
    echo $a
    a=$a+1
done