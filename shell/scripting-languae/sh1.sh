#!/bin/sh
cd ~
\du -d1 | sort -rn | head -6 | awk '{print $2}'
