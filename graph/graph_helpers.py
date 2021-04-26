from random import randint
from math import floor
import igraph
from Units import *
from datetime import datetime
import pathlib


red   = (1,.5,.5,1)
green = (.5,1,.5,1)
blue  = (.5,.8,1,1)
yellow = (1,1,.5,1)

def message(msg):
    print("> "+str(msg))

# set input width of unit to sum of widths of incoming edges
def update_vertex_input_width(vertex):
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

def connect_memory_unit(g, vertex_read, vertex_write):
    g.add_vertex()
    memory_vertex = g.vs[len(g.vs)-1]
    # for now, set memory data width to minimum of compute units' input/output widths
    datawidth = min(vertex_read["unit"].i, vertex_write["unit"].o)
    # set memory address width to random constrained value
    # can't exceed vertices' output widths, since this specifies mem address
    addrwidth = min(randint(1,10), vertex_read["unit"].o, vertex_write["unit"].o)
    memory_vertex["unit"] = Memory(datawidth=datawidth,addrwidth=addrwidth)
    
    g.add_edges([(vertex_read.index,memory_vertex.index)])  # vertex_read   --> memory
    g.add_edges([(vertex_read.index,memory_vertex.index)])  # memory        --> vertex_read
    g.add_edges([(vertex_write.index,memory_vertex.index)]) # vertex_write  --> memory
    g.add_edges([(vertex_read.index,memory_vertex.index)])  # vertex_read   --> memory
    new_edge = g.es[len(g.es)-1]
    set_channel_width(new_edge,memory_vertex["unit"].i)
    # print("mem in: "+str(memory_vertex["unit"].i))

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



# assume vertex["unit"] is in class Unit with vertex["unit"].o set to a value
# iterate over vertex's outgoing edges and divide output width evenly among them
def assign_widths_to_outedges(vertex):
    edges = vertex.out_edges()
    num_edges = vertex.outdegree()
    if num_edges > 0:
        out_width = vertex["unit"].o
        out_width_peredge = floor(out_width/num_edges)
        for idx in range(num_edges-1):
            set_channel_width(edges[idx],out_width_peredge)
        # remaining edge gets rest of bits
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

def visualize_graph(graph):
    layout = graph.layout("fr")
    igraph.plot(graph,layout=layout,bbox=(1000,1000),margin=50,autocurve=False)

def save_graph_pdf(graph):
    layout = graph.layout("fr")
    now = datetime.now()
    dt_string = now.strftime("%d_%m_%Y_%H_%M_%S")
    # igraph.plot(graph, "/home/ubuntu/random_graph_"+dt_string+".pdf", layout=layout,bbox=(1000,1000),margin=50,autocurve=False)
    igraph.plot(graph, "/home/ubuntu/random_graph.pdf", layout=layout,bbox=(1000,1000),margin=50,autocurve=False)
