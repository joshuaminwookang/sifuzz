import random

from igraph import *
from Units import UnitType, Unit, Channel

N = 3

g = Graph(n=N,directed=True)

# generate units
g.vs[0]["unit"] = Unit(type=UnitType.COMPUTE)
g.vs[1]["unit"] = Unit(type=UnitType.MEMORY)
g.vs[2]["unit"] = Unit(type=UnitType.NETWORK)

# connect units based on io
# algorithm for this...?
for i in range(N-1):
    g.add_edges([(i,i+1)])
    # r/w memory
    if (g.vs[i]["unit"].type == UnitType.MEMORY):
        g.add_edges([(i,i-1)])

# graph formatting
#g.vs["label"] = ["\n\n\n"+g.vs[i]["unit"].get_type()+"_"+str(i) for i in range(N)]
for i in range(N):
    g.vs[i]["label"] = g.vs[i]["unit"].get_type()+"_"+str(i)
    if (g.vs[i]["unit"].type == UnitType.COMPUTE):
        g.vs[i]["shape"] = "circle"
    else:
        g.vs[i]["shape"] = "rectangle"

layout = g.layout("fr")
plot(g,layout=layout,bbox=(500,500),margin=100,autocurve=False)
