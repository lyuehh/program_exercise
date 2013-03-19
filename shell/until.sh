#!/bin/sh
i=1
until [ $i -gt 5 ]
do
  echo $i
  i=$(( $i+1 ))
done
