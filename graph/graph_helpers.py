from random import randint
from math import floor
import igraph
from Units import *

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
    obj["unit"].width = width
    obj["label"] = str(width)

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
