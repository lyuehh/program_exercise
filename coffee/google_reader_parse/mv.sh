#!/bin/sh

cd posts
ls -1 | xargs -I {} mv {} ../../reader/_posts/{}