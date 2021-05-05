from random import randint, seed
import igraph
import csv
from Units import *
from sympy import symbols, Eq, solve, parse_expr


chisel_list_dict = []
with open('ChiselModules.csv', mode='r', encoding='utf-8-sig', newline='') as csvfile:
    chisels_reader = csv.DictReader(csvfile)
    chisels_fieldnames = chisels_reader.fieldnames
    for chisel_dict in chisels_reader:
        vars_vect = chisel_dict['vars'].split(';')
        chisel_dict['vars'] = vars_vect
        chisel_list_dict.append(chisel_dict)


# filtered lists that contain modules fitting certain requirements
chisel_list_same_io = list(filter(lambda x: x["fanin2out"] == "0", chisel_list_dict))
chisel_list_even = list(filter(lambda x: x["in_parity"] == "e" or x["in_parity"] == "x" , chisel_list_dict))
chisel_list_odd = list(filter(lambda x: x["in_parity"] == "o" or x["in_parity"] == "x" , chisel_list_dict))
chisel_list_same_io_even = list(filter(lambda x: x["in_parity"] == "e" or x["in_parity"] == "x" , chisel_list_same_io))
chisel_list_same_io_odd  = list(filter(lambda x: x["in_parity"] == "o" or x["in_parity"] == "x" , chisel_list_same_io))

# precompute list lengths for better performance
len_chisel_list_dict = len(chisel_list_dict)
len_chisel_list_even = len(chisel_list_even)
len_chisel_list_odd = len(chisel_list_odd)
len_chisel_list_same_io_even = len(chisel_list_same_io_even)
len_chisel_list_same_io_odd = len(chisel_list_same_io_odd)

# print([x["name"] for x in chisel_list_same_io_even])
# print([x["name"] for x in chisel_list_same_io_odd])

''' Assigns chisel module to a vertex
    vertex["chisel"] = dict
'''
def assign_chisel_module(vertex):
    seed()
    # Set 10% chance of getting a subgraph vertex
    in_width = vertex["unit"].i
    # Loop until we find appropriate module
    while(True):
        # Pick a Chisel module randomly from entire pool of possible modules
        idx_chisel = 0
        chisel_dict = []

        # Check input width's parity and fanin to fanout ratio 
        if in_width % 2 == 0 :
            if in_width < 3 :
                idx_chisel = randint(0,len_chisel_list_same_io_even-1)
                chisel_dict = chisel_list_same_io_even[idx_chisel].copy() # this module's dictionary
            else:
                idx_chisel = randint(0,len_chisel_list_even-1)
                chisel_dict = chisel_list_even[idx_chisel].copy() # this module's dictionary
        else :
            if in_width < 3 :
                idx_chisel = randint(0,len_chisel_list_same_io_odd-1)
                chisel_dict = chisel_list_same_io_odd[idx_chisel].copy() # this module's dictionary
            else:
                idx_chisel = randint(0,len_chisel_list_odd-1)
                chisel_dict = chisel_list_odd[idx_chisel].copy() # this module's dictionary
        
        # print("IN WIDTH: {}".format(in_width))
        # print("out: {}  {}, {}".format(vertex.outdegree(), chisel_dict["fanin2out"], chisel_dict["in_parity"]))
        # Two variables decidiing I/O width of given module
        # For modules that use extra param 'a', choose a random value < in_width/3
        n = symbols('n')
        a = randint(1, max(int(in_width/3),1)) # TODO: clean this up

        # Evaluate value of n 
        in_expr = chisel_dict["in_expr"]
        out_expr = chisel_dict["out_expr"]
        sols = eval("solve({} - {}, n)".format(in_expr, in_width))
        n = int(sols[0])

        # final check if n is positive integer
        if (int(sols[0]) < vertex.outdegree()): continue

        for var in chisel_dict["vars"]:
            chisel_dict[var] = eval(var)

        if (in_width == eval(in_expr)):
            vertex["chisel"] = chisel_dict
            vertex["unit"].o = eval(out_expr)
            break

def get_chisel_module_name(vertex):
    return vertex["chisel"]["name"]

def get_chisel_module_params(vertex):
    chisel_dict = vertex["chisel"]
    vars_vect = chisel_dict['vars']
    param_string = ''
    for var in chisel_dict['vars']:
        var_value = chisel_dict[var]
        param_string += var + "=" + str(var_value) + ","
    return param_string[0:len(param_string)-1]