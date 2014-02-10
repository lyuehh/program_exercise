#!/bin/sh

for i in `seq 2003 2014`
do
    echo $i
    cat ${i}.html | hquery -p -f a.js | sed '$d' > json/${i}.json
done
