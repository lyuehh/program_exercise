#!/bin/sh
cat sh3.data | awk '{a = toupper($0); print a}'
