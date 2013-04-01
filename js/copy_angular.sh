#!/bin/sh

source='todo'
dist='angular'

cd $dist
mkdir -p app/images
cd ..

\cp -rf $source/app/styles/main.scss $dist/app/styles/main.scss
\cp -rf $source/app/views/* $dist/app/views/
\cp -rf $source/app/scripts/* $dist/app/scripts/
\cp -rf $source/app/images/* $dist/app/images/
\cp -rf $source/app/index.html $dist/app/index.html


