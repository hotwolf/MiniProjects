#!/bin/sh

#Run NopSCADlib scripts
cd $(dirname $0)/..
#echo `pwd`
export OPENSCADPATH=.:../lib
python3 ../lib/NopSCADlib/scripts/make_all.py
