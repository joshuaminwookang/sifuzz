mkdir ~/rfuzz_out
cd ~

for i in {1..20}
do

# Random Graph
cd randomaccels_stable/graph
python3 main.py
while [ $? -ne 0 ]; do
   python3 main.py 
done

echo "✅ Graph Generation Successful"
# Scala -> FIRTL/Verilog
cd ..
sbt run
echo "✅ Elaborated Verilog"

cp RandomHardware.fir ~/rfuzz/benchmarks

cd ~/rfuzz
make bin
timeout -sHUP 3m make run &

cd fuzzer
bash run.sh
echo "✅ Fuzzing Complete"

cd ~
outdir=~/rfuzz_out/run${i}/
mkdir $outdir
mv rfuzz/fuzzer/out $outdir/entries
cp randomaccels_stable/RandomHardware.v $outdir 
cp randomaccels_stable/RandomHardware.fir $outdir
echo "✅ Results stored"

done
