from enum import Enum


class UnitType(Enum):
    COMPUTE = 1
    # sub-categories of COMPUTE = 2, 3,...,9
    MEMORY = 10
    NETWORK = 20
    CHANNEL = 30
    RDY_VAL = 31

class Unit:
    def __init__(self,i=1,o=1,type=UnitType.COMPUTE):
        self.i = i
        self.o = o
        self.type = type
    def get_type(self):
        return self.type.name

class Channel(Unit):
    def __init__(self,width=2,type=UnitType.CHANNEL): 
        i=width
        o=width
        self.width=width
        super().__init__(i=i,o=o,type=type)

class Compute(Unit):
    def __init__(self,i=2,o=2):
        super().__init__(i=i,o=o,type=UnitType.COMPUTE)

class Memory(Unit):
    def __init__(self,datawidth=2):
        # input = in[datawidth-1:0], re, we
        # output = out[datawidth-1:0]
        i=datawidth+2
        o=datawidth
        super().__init__(i=i,o=o,type=UnitType.MEMORY)


class ReadyValidInterface(Channel):
    def __init__(self,datawidth=2):
        # input = in[datawidth-1:0], i_val, o_rdy
        # output = out[datawidth-1:0], i_rdy, o_val
        super().__init__(width=datawidth+2,type=UnitType.RDY_VAL)