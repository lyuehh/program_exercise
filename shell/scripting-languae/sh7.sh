#!/bin/sh
sort sh7/a > a1
sort sh7/b > b1
diff a1 a2 | | grep -v '@@' | grep -v 'diff' | grep -v 'index' | grep -v '-' | grep -v '+' | wc -l