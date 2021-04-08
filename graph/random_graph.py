import random

import igraph
from Units import *

N = 30

# generate random DAC
#   loop until DAG successfully generated (always happens on first try for me)
#   do this because feedback_arc_set() uses a heuristic, so it might fail with complex graph
while True:
    g = igraph.Graph.Erdos_Renyi(n=N, p=0.05,directed=True,loops=False)
    extra_edges = g.feedback_arc_set()
    g.delete_edges(extra_edges)
    if g.is_dag():
        print('Random DAG created!')
        break
# simpler method:
# g = igraph.Graph.Erdos_Renyi(n=N, p=0.05,directed=True,loops=False)
# g.simplify() # remove multiedges and loops


# delete unconnected vertices
for v in g.vs:
    if v.degree() == 0:
        g.delete_vertices(v.index)

# iterate over vertices and initialize compute units
for vertex in g.vs:
    vertex["unit"] = Compute(i=0,o=0)

# iterate over edges and create channel with random width
for edge in g.es:
    edge["unit"] = Channel(width=random.randint(1,10))
    width = edge["unit"].width
    g.vs[edge.source]["unit"].o += width
    g.vs[edge.target]["unit"].i += width
    edge["label"] = str(width)

# plot graph
layout = g.layout("fr")
igraph.plot(g,layout=layout,bbox=(700,700),margin=100,autocurve=False)
