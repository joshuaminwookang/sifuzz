import os.path

N = 16
time = []
power = []
internal = []
switching = []
leakage = []
activity = []
for i in range(1,2):
    write = False
    filename = 'RandomHardware_{i}.par.power_profile.rpt'.format(i=i)
    if not os.path.isfile(filename): continue
    f = open(filename,'r')
    for line in f:
        words = line.split()
        # print(line)
        if write and (len(words) == 9):
            time.append(float(words[0]));       time.append(float(words[2]))
            power.append(float(words[4]));      power.append(float(words[4]))
            internal.append(float(words[5]));   internal.append(float(words[5]))
            switching.append(float(words[6]));  switching.append(float(words[6]))
            leakage.append(float(words[7]));    leakage.append(float(words[7]))
            activity.append(float(words[8]));   activity.append(float(words[8]))
        if line.startswith('----'):
            write = True

print('time=',end='')
print(time,end='')
print(';')

print('power=',end='')
print(power,end='')
print(';')

print('internal=',end='')
print(internal,end='')
print(';')

print('leakage=',end='')
print(leakage,end='')
print(';')

print('switching=',end='')
print(switching,end='')
print(';')

print('activity=',end='')
print(activity,end='')
print(';\n\n')
