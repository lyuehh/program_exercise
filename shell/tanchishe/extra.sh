#!/bin/sh

frame=`gifsicle -I tanchishe.gif | tail -2 | head -1 | awk '{print $3}' | cut -c2-`
echo $frame

frame=20

for((i=0; i<= $frame; i++))
do
  gifsicle tanchishe.gif "#${i}" > frames/frame${i}.jpg
done

