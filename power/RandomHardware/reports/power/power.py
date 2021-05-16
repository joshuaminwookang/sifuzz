import os.path

N = 16
register = []
logic = []
clock = []
Subtotal = []
for i in range(1,N+1):
    if not os.path.isfile('RandomHardware_{i}.syn.power.rpt'.format(i=i)): continue
    f = open('RandomHardware_{i}.syn.power.rpt'.format(i=i),'r')
    for line in f:
        words = line.split()
        # print(words)
        if words[0] == 'register':
            register.append(float(words[4]))
        if words[0] == 'logic':
            logic.append(float(words[4]))
        if words[0] == 'clock':
            clock.append(float(words[4]))
        if words[0] == 'Subtotal':
            Subtotal.append(float(words[4]))
print('register=',end='')
print(register,end='')
print(';')

print('logic=',end='')
print(logic,end='')
print(';')

print('clock=',end='')
print(clock,end='')
print(';')
