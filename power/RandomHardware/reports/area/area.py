import os.path

N = 10
area = []
for i in range(1,N+1):
    filename = 'RandomHardware_{i}.syn.area.rpt'.format(i=i)
    if not os.path.isfile(filename): continue
    f = open(filename,'r')
    for line in f:
        words = line.split()
        if (len(words)>0):
            if words[0] == 'RandomHardware':
                area.append(float(words[4]))
print('area=',end='')
print(area,end='')
print(';')
