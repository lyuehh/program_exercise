#!/bin/sh

for((i=1;i<=836;i++)) do
    echo "$i.."
    wget -q "http://calgo.acm.org/$i.gz"
done

for((j=827;j<=927;j++)) do
    echo "$j.."
    wget -q "http://calgo.acm.org/$j.zip"
done
