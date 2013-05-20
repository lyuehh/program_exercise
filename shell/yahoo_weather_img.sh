#!/bin/sh

val=48
dist='./imgs'
base='http://l.yimg.com/a/i/us/nws/weather/gr/'
for((i=0;i<=$val;i++ )) do
  name="${i}d.png"
  u="http://l.yimg.com/a/i/us/nws/weather/gr/${i}d.png"
  curl $u -o $dist/$name
done
