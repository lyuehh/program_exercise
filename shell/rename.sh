#!/bin/sh

for i in *.rmvb;
do
    name=$i
    echo $name
    newname=`echo $name | awk -F'.' '{print $4}'`
    echo $newname
    mv $name ${newname}.rmvb
done
