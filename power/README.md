# Power Estimation VLSI Flow 
On the EECS servers, run these commands:
```
export HAMMER_HOME=/home/ff/eecs151/hammer
source /home/ff/eecs151/hammer/sourceme.sh
source /home/ff/eecs151/tutorials/eecs151.bashrc


cd gcd

make syn
make par
make sim-gl-par
make power-par

```

Post-PAR Reports (Voltus) are located in ~power/gcd/build/power-rundir/

Post-RTL reports (Spyglass) *will* be located in ~power/gcd/spyglass/
