#!/bin/sh

RDIR=$(pwd)
cd ../src/main/scala
rm RandomHardware_*.scala

cd ~
rm *.pdf

cd $RDIR
python3.7 main.py
