#!/bin/sh

RANDOM_HOME_DIR=$(pwd)
RFUZZ_DIR=RANDOM_HOME_DIR=$RANDOM_HOME_DIR/rfuzz
FUZZER_DIR=RANDOM_HOME_DIR=$RANDOM_HOME_DIR/rfuzz/fuzzer

# STEP 1: clean up
cd $RANDOM_HOME_DIR/src/main/scala
rm RandomHardware_*.scala

# cd ~
# rm *.pdf
# STEP 1: clean up
cd $RANDOM_HOME_DIR/graph
python3 main.py

cd $RANDOM_HOME_DIR
sbt run
cp RandomHardware.fir ../rfuzz/benchmarks

# STEP 3: RUN FUZZER
# make run &

# cd fuzzer
# timeout -sHUP .2m bash run.sh
# cd ~/rfuzz
# cp -r fuzzer/out outputs/out1
