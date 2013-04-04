#! /bin/sh

a=`find.exe . -size -1024c -print | sed 1d`

echo $a  | while read line do
  if grep -q "This is a test mail";then
    mv $line ../test
  fi
done