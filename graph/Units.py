from enum import Enum


class UnitType(Enum):
    COMPUTE = 1
    # sub-categories of COMPUTE = 2, 3,...,9
    MEMORY = 10
    NETWORK = 20
    CHANNEL = 30
    MEMORY_CHANNEL = 31

class Unit:
    def __init__(self,i=1,o=1,type=UnitType.COMPUTE,connected_to_mem=False):
        self.i = i
        self.o = o
        self.type = type
        self.connected_to_mem = connected_to_mem
    def get_type(self):
        return self.type.name

class Channel(Unit):
    def __init__(self,width=2): 
        i=width
        o=width
        self.width=width
        super().__init__(i=i,o=o,type=UnitType.CHANNEL)
    def set_width(self, width):
        self.width=width
        self.i=width
        self.o=width

class Compute(Unit):
    def __init__(self,i=2,o=2):
        super().__init__(i=i,o=o,type=UnitType.COMPUTE)

class Memory(Unit):
    def __init__(self,datawidth=2, addrwidth=2):
        # input = in, addr, re, we
        # output = out
        self.datawidth=datawidth
        self.addrwidth=addrwidth
        i=datawidth+addrwidth+2
        o=datawidth
        super().__init__(i=i,o=o,type=UnitType.MEMORY,connected_to_mem=True)


class ReadyValidInterface(Channel):
    def __init__(self,datawidth=2):
        # input = in[datawidth-1:0], i_val, o_rdy
        # output = out[datawidth-1:0], i_rdy, o_val
        super().__init__(width=datawidth+2,type=UnitType.RDY_VAL)