from enum import Enum

class UnitType(Enum):
    GRAPH = 0
    COMPUTE = 1
    INT_ADD = 2
    INT_AND = 3
    INT_MUL = 4
    INT_DIV = 5
    INT_MOD = 6
    RED_MUX_AND = 7
    RED_MUX_OR = 8
    RED_MUX_XOR = 9

    # sub-categories of COMPUTE = 2, 3,...,9
    MEMORY = 10
    NETWORK = 20
    CHANNEL = 30
    MEMORY_CHANNEL = 31
    
class ChiselModuleNames(Enum):
    RandomHardware = 0
    Add = 2
    And = 3
    Mul = 4
    Div = 5
    Mod = 6
    ReduceAndMux = 7
    ReduceOrMux = 8
    ReduceXorMux = 9

class Unit:
    def __init__(self,i=1,o=1,type=UnitType.COMPUTE):
        self.i = i
        self.o = o
        self.type = type
        self.connected_to_mem = False
        self.immutable_widths = False
    def get_input_width(self):
        return self.i
    def get_output_width(self):
        return self.o
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
    def __init__(self,i=2,o=2,type=UnitType.COMPUTE):
        super().__init__(i=i,o=o,type=type)

class Memory(Unit):
    def __init__(self,datawidth=2, addrwidth=2):
        # input = in, addr, re, we
        # output = out
        self.datawidth=datawidth
        self.addrwidth=addrwidth
        i=datawidth+addrwidth+2
        o=datawidth
        super().__init__(i=i,o=o,type=UnitType.MEMORY)
        self.connected_to_mem = True


class ReadyValidInterface(Channel):
    def __init__(self,datawidth=2):
        # input = in[datawidth-1:0], i_val, o_rdy
        # output = out[datawidth-1:0], i_rdy, o_val
        super().__init__(width=datawidth+2,type=UnitType.RDY_VAL)

