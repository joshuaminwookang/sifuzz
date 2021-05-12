clock_period=1

import json
json_path='/scratch/nayiri/randomaccels/scripts/testbench.json'
data = {}
with open(json_path, 'r') as f:
    data = json.load(f)
end_time=data["num_tests"]*clock_period

yaml_file_path='/scratch/nayiri/randomaccels/power/RandomHardware/sim-gl-par.yml'
yaml2_file_path='/scratch/nayiri/randomaccels/power/RandomHardware/sim-gl-par2.yml'
f1 = open(yaml_file_path,'r')
f2 = open(yaml2_file_path,'w')
for line in f1:
    if 'end_times' in line:
        f2.write('  end_times: ["{}"]'.format(end_time))
    else:
        f2.write(line)
f1.close()
f2.close()