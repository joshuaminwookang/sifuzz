#!/bin/sh

# Paths setup
export HDIR=/scratch/nayiri/randomaccels
export PDIR=$HDIR/power/RandomHardware


# for i in {20..40}
# do
#     bash run_graph.sh
#     bash run_verilog.sh
#     bash run_power.sh
#     cp $PDIR/build/syn-rundir/reports/RandomHardware.syn.power.rpt $PDIR/reports/power/RandomHardware_$i.syn.power.rpt
#     cp $PDIR/build/syn-rundir/reports/final_area.rpt $PDIR/reports/area/RandomHardware_$i.syn.area.rpt
#     cp $PDIR/build/syn-rundir/reports/final.rpt $PDIR/reports/timing/RandomHardware_$i.syn.timing.rpt
# done

i=1

# Copy all files
rfuzzout=$HDIR/rfuzz_out/run${i}
cp $rfuzzout/RandomHardware.v randomaccels/power/RandomHardware/src/RandomHardware.v
echo "Transfered all files"

cd $HDIR/scripts
python3 testbench_json.py 1
python3 generate_testbench.py
python3 end_times.py
mv $PDIR/sim-gl-par2.yml $PDIR/sim-gl-par.yml
echo "Generated testbench"

cd $PDIR
make clean
make sim-rtl
cd $PDIR/build/sim-rundir
vpd2vcd vcdplus.vpd RandomHardware.vcd

make syn
make par
make sim-gl-par
make power-par
echo "Ran VLSI Flow"

cd $PDIR/build
cp -r power-rundir /scratch/nayiri/randomaccels/power-par/run${i}

cd $HDIR
echo "Done"