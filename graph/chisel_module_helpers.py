from random import randint, seed, choice
import igraph, csv, math
from Units import *
from sympy import symbols, solve, parse_expr, log

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

chisel_list_compute = list(filter(lambda x: x["type"] == "c", chisel_list_dict))
chisel_list_mux = list(filter(lambda x: x["type"] == "mx", chisel_list_dict))
chisel_list_memory = list(filter(lambda x: x["type"] == "m", chisel_list_dict))

chisel_list_compute_even = list(filter(lambda x: x["in_parity"] == "e" or x["in_parity"] == "x", chisel_list_compute))
chisel_list_mux_even = list(filter(lambda x: x["in_parity"] == "e" or x["in_parity"] == "x", chisel_list_mux))
chisel_list_memory_even = list(filter(lambda x: x["in_parity"] == "e" or x["in_parity"] == "x", chisel_list_memory))
chisel_list_compute_odd = list(filter(lambda x: x["in_parity"] == "o" or x["in_parity"] == "x", chisel_list_compute))
chisel_list_mux_odd = list(filter(lambda x: x["in_parity"] == "o" or x["in_parity"] == "x", chisel_list_mux))
chisel_list_memory_odd = list(filter(lambda x: x["in_parity"] == "o" or x["in_parity"] == "x", chisel_list_memory))

all_even_list = [chisel_list_compute_even]+ [chisel_list_mux_even]*2 + [chisel_list_memory_even]
all_odd_list = [chisel_list_compute_odd]+ [chisel_list_mux_odd]*2 + [chisel_list_memory_odd]

# precompute list lengths for better performance
len_chisel_list_same_io = len(chisel_list_same_io)
len_chisel_list_same_io_even = len(chisel_list_same_io_even)
len_chisel_list_same_io_odd = len(chisel_list_same_io_odd)
len_chisel_list_compute = len(chisel_list_compute)
len_chisel_list_mux = len(chisel_list_mux)
len_chisel_list_memory = len(chisel_list_memory)
# print([x["name"] for x in chisel_list_same_io_even])
# print([x["name"] for x in chisel_list_same_io_odd])

''' Assigns chisel module to a vertex
    vertex["chisel"] = dict
    @returns: the unit type number 
'''
def assign_chisel_module(vertex):
    in_width = vertex["unit"].i
    assert(in_width>0)
    # Loop until we find appropriate module
    while(True):
        idx_chisel = 0
        chisel_dict = []
        
        '''
        Randomly pick module, with certain restrictions
        '''
        if in_width % 2 == 0 :
            if in_width < 16 :
                idx_chisel = randint(0,len_chisel_list_same_io_even-1)
                chisel_dict = chisel_list_same_io_even[idx_chisel].copy() # this module's dictionary
            else:
                category = choice(all_even_list)
                idx_chisel = randint(0, len(category)-1)
                chisel_dict = category[idx_chisel].copy()
        else :
            if in_width < 16 :
                idx_chisel = randint(0,len_chisel_list_same_io_odd-1)
                chisel_dict = chisel_list_same_io_odd[idx_chisel].copy() # this module's dictionary
            else:
                category = choice(all_odd_list)
                idx_chisel = randint(0, len(category)-1)
                chisel_dict = category[idx_chisel].copy()
        
        ''' 
        Variables decidiing I/O width of given module
        For modules that use extra param 'a', choose a to be log2(n)
        For moduels that use extra param 'b', choose random value between 0 and 6
        '''
        n = symbols('n')
        a = math.floor(log(in_width,2)) -2 + randint(0,3) # Guess: a = log (n), where n+2a == in_width
        b = randint(1,5) # Just random width

        # Evaluate value of n 
        in_expr = chisel_dict["in_expr"]
        out_expr = chisel_dict["out_expr"]
        sols = eval("solve({} - {}, n)".format(in_expr, in_width))
        n = int(sols[0])

        # final check if n is positive integer
        if (int(sols[0]) < vertex.outdegree()): continue

        assert(int(sols[0]) >= vertex.outdegree())
        if chisel_dict["name"] == "RegFile2R1W" and n > 128: continue

        for var in chisel_dict["vars"]:
            chisel_dict[var] = eval(var)
            # if var=="a" and a != math.ceil(log(n,2)) : continue

        if "a" in chisel_dict["vars"] and a != math.ceil(log(n,2)): continue

        if (in_width == eval(in_expr)):
            vertex["chisel"] = chisel_dict
            vertex["unit"].o = eval(out_expr)
            print("Module Name: {} N={} FROM I: {} TO O: {}".format( chisel_dict["name"],n ,in_width, eval(out_expr)))
            return 1 if chisel_dict["type"] == 'c' else 2 # TODO do pattern matching once we have network (and/or other types) units

'''
Helper methods called in other scripts 
@returns: current vertex's Chisel module name (as appears in Chisel)
'''
def get_chisel_module_name(vertex):
    return vertex["chisel"]["name"]

'''
Helper methods called in other scripts 
@returns: parameters that go into the vertex's Chisel module (as appears in Chisel)
'''
def get_chisel_module_params(vertex):
    chisel_dict = vertex["chisel"]
    vars_vect = chisel_dict['vars']
    param_string = ''
    for var in chisel_dict['vars']:
        var_value = chisel_dict[var]
        param_string += var + "=" + str(var_value) + ","
    return param_string[0:len(param_string)-1]

# print("IN WIDTH: {}".format(in_width))
        # print("out: {}  {}, {}".format(vertex.outdegree(), chisel_dict["fanin2out"], chisel_dict["in_parity"]))