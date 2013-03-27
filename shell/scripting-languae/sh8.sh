#!/bin/sh
word_file="./sh8/words"
cat sh8/words | xargs -I {} md5 -s {} > sh8/words_md5

