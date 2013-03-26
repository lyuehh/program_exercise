#!/bin/sh
dir='sh6'
cd $dir
for i in *; do mv "$i" "$(echo $i | sed 's/ /_/g')";done

