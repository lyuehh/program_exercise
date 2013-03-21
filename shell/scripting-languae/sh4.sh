#!/bin/sh
word_file="/usr/share/dict/words"
sed -n '/.x.*/p' $word_file

