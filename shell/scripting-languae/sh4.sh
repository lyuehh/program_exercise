#!/bin/sh
word_file="/usr/share/dict/words"
sed -n '/^.x.*n.$/p' $word_file

