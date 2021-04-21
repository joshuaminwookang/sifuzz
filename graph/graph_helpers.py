from random import randint
from math import floor
import igraph
from Units import *

red   = (1,.5,.5,1)
green = (.5,1,.5,1)
blue  = (.5,.8,1,1)
yellow = (1,1,.5,1)

# set input width of unit to sum of widths of incoming edges
def set_and_get_input_width(vertex):
    edges = vertex.in_edges()
    width = 0
    for edge in edges:
        width += edge["unit"].width
    vertex["unit"].i = width
    return width

# obj["unit"] is Channel object
def set_channel_width(obj, width):
    if obj["unit"] is None:
        obj["unit"] = Channel(width=width)
    else:
        obj["unit"].set_width(width)
    obj["label"] = str(width)+'/ '

def connect_memory_unit(g, compute_vertex):
    g.add_vertex()
    memory_vertex = g.vs[len(g.vs)-1]
    # for now, set memory data width to minimum of compute unit's input/output widths
    datawidth = min(compute_vertex["unit"].i, compute_vertex["unit"].o)
    # set memory address width to random constrained value
    addrwidth = randint(1,10)
    memory_vertex["unit"] = Memory(datawidth=datawidth,addrwidth=addrwidth)

    # memory --> compute
    g.add_edges([(memory_vertex.index,compute_vertex.index)])
    new_edge = g.es[len(g.es)-1]
    set_channel_width(new_edge,memory_vertex["unit"].o)
    print("mem out: "+str(memory_vertex["unit"].o))

    # compute --> memory
    g.add_edges([(compute_vertex.index,memory_vertex.index)])
    new_edge = g.es[len(g.es)-1]
    set_channel_width(new_edge,memory_vertex["unit"].i)
    print("mem in: "+str(memory_vertex["unit"].i))

    # add memory channel to compute unit's input
    compute_vertex["unit"].i += memory_vertex["unit"].o
    # change memory vertex shape and color
    memory_vertex["shape"] = "rectangle"
    memory_vertex["color"] = blue
    compute_vertex["unit"].connected_to_mem = True


# def format_memory_vertex(vertex):
#     unit = vertex["unit"]
#     in_edge = unit.in_edges()[0]
#     out_edge = unit.out_edges()[0]



# assume vertex["unit"] is in class Unit with self.i set to a value
def assign_widths_to_outedges(vertex):
    edges = vertex.out_edges()
    num_edges = len(edges)
    if num_edges > 0:
        out_width = vertex["unit"].o
        out_width_peredge = floor(out_width/num_edges)
        for idx in range(num_edges-1):
            set_channel_width(edges[idx],out_width_peredge)
        # remaining edge gets rest of signals
        lastedge_width = out_width - out_width_peredge*(num_edges-1)
        set_channel_width(edges[-1], lastedge_width)

# currently for simplicity, set output = input width
def scale_output_from_input(vertex):
    vertex["unit"].o = vertex["unit"].i
    # TODO: implement some scheme to decide when output width is 2x input
    # (perhaps when input width falls below a certain threshold)
    # if (vertex["unit"].i < vertex.outdegree()):
    #     vertex["unit"].o = 2*vertex["unit"].i
    # elif (vertex["unit"].i < 2*vertex.outdegree()):
    #     vertex["unit"].o = 2*vertex["unit"].i
    # elif (vertex["unit"].i < 6*vertex.outdegree()):
    #     vertex["unit"].o = 2*vertex["unit"].i
    # else:
    #     vertex["unit"].o = vertex["unit"].i
