from random import randint

import igraph
from Units import *
from graph_helpers import *

N = 30
red   = (1,.5,.5,1)
green = (.5,1,.5,1)
blue  = (.5,.8,1,1)
yellow = (1,1,.5,1)

# generate random DAC
#   loop until DAG successfully generated (always happens on first try for me)
#   do this because feedback_arc_set() uses a heuristic, so it might fail with complex graph
while True:
    g = igraph.Graph.Erdos_Renyi(n=N, p=0.03,directed=True,loops=False)
    extra_edges = g.feedback_arc_set()
    g.delete_edges(extra_edges)
    # only keep largest connected graph (remove unconnected vertices/edges)
    g = g.clusters(mode='weak').giant()
    if g.is_dag():
        print('Random DAG created!')
        break
# simpler method:
# g = igraph.Graph.Erdos_Renyi(n=N, p=0.05,directed=True,loops=False)
# g.simplify() # remove multiedges and loops
# layout =largest.layout("fr")
# igraph.plot(largest,layout=layout,bbox=(1000,1000),margin=100,autocurve=False)

# iterate over edges and create channel object
for edge in g.es:
    edge["unit"] = Channel(width=0)

# iterate over vertices
# initialize all "unit" attributes as Compute objects
# store input and output vertices (for later)
inputs = []
outputs = []
for vertex in g.vs:
    vertex["unit"] = Compute(i=0,o=0)
    # for debugging, label all vertices with their index
    # vertex["label"] = vertex.index
    vertex["color"] = yellow
    if vertex.indegree() == 0:
        inputs.append(vertex)
    if vertex.outdegree() == 0:
        outputs.append(vertex)

# iterate over input vertices
# randomly initialize input channel width
# from these inputs, do Breadth-First Search (BFS)
#   to assign output channel widths based on input widths
for input in inputs:
    in_width = 2*randint(10,20)
    input["unit"].i = in_width
    input["unit"].o = in_width
    # input["label"] = str(in_width)
    assign_widths_to_outedges(input)
    [v_idxs, layers, parents] = g.bfs(input.index) 
    for v_idx in v_idxs[1:]:
        vertex = g.vs[v_idx]
        in_width = set_and_get_input_width(vertex)
        scale_output_from_input(vertex)
        assign_widths_to_outedges(vertex)
print("Widths assigned to all channels.")

# add graph vertices that are input channels to graph
# and do the same for outputs
# inputs - green
# outputs - red
# labels of input/output vertices/edges denote channel width of that input
# each {input,output} verted+edge point to same Channel object
for input in inputs:
    g.add_vertex()
    new_vertex = g.vs[len(g.vs)-1]
    g.add_edges([(new_vertex.index,input.index)])
    new_edge = g.es[len(g.es)-1]
    # set new vertex and edge to point to same Channel object
    new_vertex["unit"] = Channel()
    new_edge["unit"] = new_vertex["unit"]
    set_channel_width(new_edge, input["unit"].i)
    new_vertex["label"] = str(input["unit"].i)
    new_vertex["color"] = green
for output in outputs:
    g.add_vertex()
    new_vertex = g.vs[len(g.vs)-1]
    g.add_edges([(output.index,new_vertex.index)])
    new_edge = g.es[len(g.es)-1]
    # set new vertex and edge to point to same Channel object
    new_vertex["unit"] = Channel()
    new_edge["unit"] = new_vertex["unit"]
    set_channel_width(new_edge, output["unit"].o)
    new_vertex["label"] = str(output["unit"].o)
    new_vertex["color"] = red
print("Input (green) and Output (red) Channel objects added.")

# display results!
layout = g.layout("fr")
igraph.plot(g,layout=layout,bbox=(1000,1000),margin=100,autocurve=False)

