#!/bin/sh
END=20
RANDOM_HOME_DIR=$(pwd)
RFUZZ_DIR=$RANDOM_HOME_DIR/rfuzz
FUZZER_DIR=$RANDOM_HOME_DIR/rfuzz/fuzzer
TOP_OUTPUT_DIR=$RANDOM_HOME_DIR/all_random_hw_out

mkdir $TOP_OUTPUT_DIR
cp RFUZZ_MAKEFILE $RFUZZ_DIR/Makefile
# cd ~

for i in $(seq 1 $END)
do
   # Random Graph
   cd $RANDOM_HOME_DIR/graph
   # cd randomaccels_stable/graph
   python3 main.py
   while [ $? -ne 0 ]; do
      python3 main.py 
   done
   echo "✅ Graph Generation Successful"

   # Scala -> FIRTL/Verilog
   cd ..
   sbt run
   echo "✅ Elaborated Verilog"
      
   OUTDIR=$TOP_OUTPUT_DIR/run${i}/
   mkdir $OUTDIR
   cp $RANDOM_HOME_DIR/RandomHardware.v $OUTDIR
   cp $RANDOM_HOME_DIR/RandomHardware.fir $OUTDIR

   # cp RandomHardware.fir ~/rfuzz/benchmarks
   cp RandomHardware.fir $RFUZZ_DIR/benchmarks

   cd $RFUZZ_DIR
   make bin
   timeout -sHUP 5m make run &

   cd $FUZZER_DIR
   rm -rf out
   cargo run --release -- -c  -o out ../build/RandomHardware.toml
   echo "✅ Fuzzing Complete"

   FUZZ_PID=$!
   wait $FUZZ_PID

   # cd ~
   mv $RFUZZ_DIR/fuzzer/out $OUTDIR/entries
   echo "✅ Results stored"

done
