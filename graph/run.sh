#!/bin/sh

RDIR=$(pwd)
cd ../src/main/scala
rm RandomHardware_*.scala
rm *.pdf
cd $RDIR
python3.7 RandomGraph.py
