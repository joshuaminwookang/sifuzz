import os.path
import json
import sys

rfuzz_num=sys.argv[1]
entries_dir=os.path.join("/scratch/nayiri/rfuzz_out/run"+rfuzz_num,"entries")

src_path="/scratch/nayiri/randomaccels/power/RandomHardware/src/RandomHardware.v"
dest_path="/scratch/nayiri/randomaccels/power/RandomHardware/src/RandomHardware_tb.v"
json_path='/scratch/nayiri/randomaccels/scripts/testbench.json'
data = {}
io_in = -1
io_out = -1
reset_bits = ''

module_RandomHardware = False

## Get I/O widths from testbench
with open(src_path,'r') as verilog_file:
    for line in verilog_file:
        if line.startswith("module RandomHardware("):
            module_RandomHardware = True
        if module_RandomHardware:
            line = (((line.replace('[','')).replace(']','')).replace(':',' ')).replace(',','')
            words = line.split()
            if len(words) == 4:
                if words[3] == 'io_in':     io_in  = int(words[1])+1
                if words[3] == 'io_out':    io_out = int(words[1])+1
            if line.startswith(');'): break

assert (io_in > -1) and (io_out > -1), "RandomHardware io width not found"
data["i_width"] = io_in
data["o_width"] = io_out

## Get input signals from json entries
i=-1
bitvector = ''
while True: # since we don't know number of entries
    i = i + 1
    entry_file_path = os.path.join(entries_dir,'entry_{:04d}.json'.format(i))
    if not os.path.isfile(entry_file_path): break
    with open(entry_file_path,'r') as entry_file:
        entry = json.load(entry_file)
        inputs = entry["entry"]["inputs"]
        tmp_bits = ''
        reset_bits = '10' + reset_bits
        for j in range(io_in): # pad bit vector with 2*io_in zeros
            tmp_bits = tmp_bits + '00'
        for input in inputs:
            tmp_bits = tmp_bits + '{:08b}'.format(input)
        num_inputs = int(len(inputs)*8/io_in)
        num_bits = io_in*num_inputs
        tmp_bits = tmp_bits[0:num_bits]
        for j in range(num_inputs-2): 
            reset_bits = '0' + reset_bits
        bitvector = bitvector + tmp_bits
# print(reset_bits)
data["reset_bits"] = reset_bits

num_tests = int(len(bitvector)/io_in)
data["num_tests"] = num_tests

inputs = []
for i in range(0,len(bitvector),io_in):
    bits = bitvector[i:i+io_in]
    hex_val = hex(int(bits,2))
    inputs.append(hex_val)
# print(inputs)
data["src_bits"] = inputs
# num_entries = i
with open(json_path, 'w') as f:
    json.dump(data, f)

