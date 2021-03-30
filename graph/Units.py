from enum import Enum


class UnitType(Enum):
    COMPUTE = 1
    # sub-categories of COMPUTE = 2, 3,...,9
    MEMORY = 10
    NETWORK = 20
    CHANNEL = 30

class Unit:
    def __init__(self,i=1,o=1,io=0,type=UnitType.COMPUTE):
        self.i = i
        self.o = o
        self.io = io
        self.type = type
    def get_type(self):
        return self.type.name

#   oneway:
#       - True:  -->
#       - False: <->
class Channel(Unit):
    def __init__(self,oneway=True): 
        if (oneway):
            i = 1
            o = 1
            io = 0
        else:
            i = 0
            o = 0
            io = 2
        super().__init__(i=i,o=o,io=io,type=UnitType.CHANNEL)