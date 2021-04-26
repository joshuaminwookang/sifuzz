# 2021 Josh Kang, UC Berkeley
# TODO: randomization of units, Chisel constructs (arrays, etc) to reduce genreated code size
# TODO: make top level method to call everything needed for Chisel generation (reduce file IO)

from random import randint

import igraph
from Units import *
from graph_helpers import *


# Setup Chisel output file
# @params: path to output Chisel file
def write_chisel_headers(pathname):
    chisel_file = open(pathname, "w")
    chisel_file.write (
        "package randomhardware \n\nimport chisel3._ \nimport chisel3.stage.ChiselStage \nimport chisel3.util._\n\n"
        + "class RandomHardware extends Module {\n"
    )
    chisel_file.close()


# Gather Top I/O ports for given graph
# Assum (TBD assert) that unit is GRAPH
# @params: random graph unit and path to output Chisel file
def write_io_list(unit, pathname):
    assert(unit.type == UnitType.GRAPH)
    g = unit.g
    inputs = unit.inputs
    outputs = unit.outputs

    chisel_file = open(pathname, "a+")
    to_write = "val io = IO(new Bundle {\n"
    to_write += "  val in \t = Input(UInt({}.W))\n".format(int(unit.get_input_width()))
    to_write += "  val out\t = Output(UInt({}.W))\n".format(int(unit.get_output_width()))
    to_write += "})\n"
    chisel_file.write(to_write)
    chisel_file.close()

# Encode all Channels in to Chisel wires
# @params: random graph unit and path to output Chisel file
def write_edges_to_wires(unit, pathname):
    chisel_file = open(pathname, "a+")
    assert(unit.type == UnitType.GRAPH)
    g = unit.g

    # strings to write to Chisel file
    to_write = ""

    # for each edge, create a Chisel wire instance of given width 
    for edge in g.es:
        to_write += "  val wire_{:03} \t = Wire(UInt({}.W))\n".format(edge.index, edge["unit"].i)
    to_write += "\n"

    chisel_file.write(to_write)
    chisel_file.close()

# Encode all vertices in the graph to corresponding Chisel modules
# @params: random graph unit and path to output Chisel file
def write_vertices_to_modules(unit, pathname):
    chisel_file = open(pathname, "a+")
    assert(unit.type == UnitType.GRAPH)

    # get graph and vertex lists
    g = unit.g
    inputs = unit.inputs
    outputs = unit.outputs
    non_io_vertices = [v for v in [v for v in g.vs if v not in inputs] if v not in outputs ]
    to_write = ""

    # instantiate modules TODO: add randomization HERE TODO: create bundle or vector of Modules
    for vertex in g.vs:
        idx = vertex.index
        width = vertex["unit"].i
        to_write += "  val Comp_Adder_{vidx:03} \t = Module(new ComputeAdd({n},{m}))\n".format(vidx=idx, n=width//2, m=width)
    to_write += "\n"

    to_write += io_input_to_vertices(inputs)
    to_write += io_vertices_to_output(outputs)

    for vertex in non_io_vertices:
        #change according to declared unit type from above
        idx = vertex.index
        to_write += connect_in_wires(vertex, "Comp_Adder_{vidx:03}".format(vidx=idx))
        to_write += connect_out_wires(vertex, "Comp_Adder_{vidx:03}".format(vidx=idx))
    for vertex in inputs:
        #change according to declared unit type from above
        idx = vertex.index
        to_write += connect_out_wires(vertex, "Comp_Adder_{vidx:03}".format(vidx=idx))
    for vertex in outputs:
        #change according to declared unit type from above
        idx = vertex.index
        to_write += connect_in_wires(vertex, "Comp_Adder_{vidx:03}".format(vidx=idx))

    chisel_file.write(to_write)
    chisel_file.close()

# use for NON-IO vertices + I/O Output vertices (red)
# (1) creates a temprorary wire indexed by vertex ID; concat all incoming channels
# (2) split input to 2 wires 
# @params: vertex 
def connect_in_wires(vertex, module_name):
    to_write=""
    idx = vertex.index
    width = vertex["unit"].i

    # concatenate all in wires into temp input wire
    to_write += "  val temp_vertex_{vidx:03} = Cat(Seq(".format(vidx=idx)
    for edge in vertex.in_edges():
        to_write += "wire_{e_idx:03},".format(e_idx=edge.index)
    to_write = to_write[:-1] + "))\n"

    # split the concatenated temp wire into 2 (TODO: support N input modules)
    to_write += "  {m}.io.in1 \t:= temp_vertex_{vidx:03}({e},{s})\n".format(m=module_name, vidx=idx, s=0, e=width//2-1)
    to_write += "  {m}.io.in2 \t:= temp_vertex_{vidx:03}({e},{s})\n".format(m=module_name, vidx=idx, s=width//2, e=width-1)
    return to_write



# use for I/O input vertices (green input nodes)
# (1) divide top input wire (io.in) to each input for input vertex (green) according to channel width (Unit.i)
# (2) split vertex input into 2 wires  (TODO: split into N wires)
# @params: list of input vertices TODO: take list of unit types  
def io_input_to_vertices(inputs_list):
    to_write=""
    counter=0
    for vertex in inputs_list:
        idx = vertex.index
        width = vertex["unit"].i
        to_write += "  Comp_Adder_{vidx:03}.io.in1 \t:= io.in({e},{s})\n".format(vidx=idx, s=counter, e=counter+width//2-1)
        to_write += "  Comp_Adder_{vidx:03}.io.in2 \t:= io.in({e},{s})\n".format(vidx=idx, s=counter+width//2, e=counter+width-1)
        counter += width
    return to_write

# use for NON-IO vertices + I/O Input vertices (green)
# (1) split output (N-wide) wire according widths of out edges
# @params: vertex, module_name (unit type)
def connect_out_wires(vertex, module_name):
    to_write=""
    counter=0
    for edge in vertex.out_edges():
        width = edge["unit"].width
        idx = edge.index
        to_write += "  wire_{e_idx:03} \t :=  {m}.io.out({e},{s})\n".format(e_idx=idx, m=module_name, s=counter, e=counter+width-1)
        counter += width
    return to_write

# use for I/O Output vertices (red)
# Merge all outports of output vertices and connect to top output wire (io.out)
# @params: list of output vertices TODO: take list of unit types  
def io_vertices_to_output(outputs_list):
    to_write=""
    counter=0
    to_write += "  io.out := Cat(Seq("
    for vertex in outputs_list:
        to_write += "Comp_Adder_{vidx:03}.io.out,".format(vidx=vertex.index)
    to_write = to_write[:-1] + "))\n\n"
    return to_write

# wrap up and add Chisel stage driver to generate Verilog/FIRRTL directly
# @params: random graph unit and path to output Chisel file
def write_epilogue(unit, pathname):
    chisel_file = open(pathname, "a+")
    assert(unit.type == UnitType.GRAPH)
    to_write = "}\n\n"
    to_write += "object RandomHardwareDriver extends App {(new ChiselStage).emitVerilog(new RandomHardware)}\n"

    chisel_file.write(to_write)
    chisel_file.close()