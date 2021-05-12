import os.path

N = 10
timing = []
for i in range(1,N+1):
    filename = 'RandomHardware_{i}.syn.timing.rpt'.format(i=i)
    if not os.path.isfile(filename): continue
    f = open(filename,'r')
    for line in f:
        words = line.split()
        if (len(words)==0): continue
        if words[0] == 'Slack':
            timing.append(float(words[2]))
print('timing=',end='')
print(timing,end='')
print(';')
