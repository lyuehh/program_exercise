#!/bin/sh

echo 'sort:'
time sort -n data2 > /dev/null

echo 'bit:'
time ./bit < data2 > /dev/null

echo 'c:'
time ./c < data2 > /dev/null

echo 'cpp:'
time ./cpp < data2 > /dev/null

