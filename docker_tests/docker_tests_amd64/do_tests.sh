#!/bin/sh
svn export svn://svn.code.sf.net/p/fatsort/code/trunk fatsort-trunk
cd fatsort-trunk
make && cd tests && make ts_amd64
cd ..
cp tests/*.log ../artifacts
