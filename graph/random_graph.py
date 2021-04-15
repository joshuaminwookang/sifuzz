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



# delete unconnected vertices
for v in g.vs:
    if v.degree() == 0:
        g.delete_vertices(v.index)

# iterate over vertices and initialize compute units
for vertex in g.vs:
    vertex["unit"] = Compute(i=0,o=0)
    vertex["label"] = vertex.index

# iterate over edges and create channel object
for edge in g.es:
    edge["unit"] = Channel(width=0)
    # width = edge["unit"].width
    # g.vs[edge.source]["unit"].o += width
    # g.vs[edge.target]["unit"].i += width
    # edge["label"] = str(width)

# plot graph

# igraph.plot(g,layout=layout,bbox=(1000,1000),margin=100,autocurve=False)

# i = g.community_infomap()
# print('i')
# print(i) 
# print('membership')
# print(i.membership)
# pal = igraph.drawing.colors.ClusterColoringPalette(len(i))
# g.vs['color'] = pal.get_many(i.membership)
# igraph.plot(g,layout=layout,bbox=(1000,1000),margin=100,autocurve=False)

inputs = []
outputs = []
for vertex in g.vs:
    vertex['color'] = yellow
    if vertex.indegree() == 0:
        # vertex['color'] = blue
        inputs.append(vertex)
    if vertex.outdegree() == 0:
        # vertex['color'] = red
        outputs.append(vertex)
# maxlen = 0
# bfs_paths = []
# for i in inputs:
#     [vertices, parents] = g.bfs(inputs[0].index)
#     bfs_paths.append(vertices)

# do breadth-first search
# start with arbitrary input node (found above)


for input in inputs:
    in_width = 2*randint(10,20)
    input["unit"].i = in_width
    input["unit"].o = in_width
    # input["label"] = str(in_width)
    assign_widths_to_outedges(input)
    [v_idxs, layers, parents] = g.bfs(input.index) 
    for v_idx in v_idxs[1:]:
        vertex = g.vs[v_idx]
        # set input width of unit to sum of widths of incoming edges
        in_width = set_and_get_input_width(vertex)
        scale_output_from_input(vertex)
        assign_widths_to_outedges(vertex)

# add graph vertices that are input channels to graph
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

# add graph vertices that are output channels to graph
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

layout = g.layout("fr")
igraph.plot(g,layout=layout,bbox=(1000,1000),margin=100,autocurve=False)

