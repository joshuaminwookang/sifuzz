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
chisel_list_io_expanding = list(filter(lambda x: x["fanin2out"] == "0", chisel_list_dict))
chisel_list_io_expanding_even = list(filter(lambda x: x["in_parity"] == "e" or x["in_parity"] == "x" , chisel_list_io_expanding))
chisel_list_io_expanding_odd  = list(filter(lambda x: x["in_parity"] == "o" or x["in_parity"] == "x" , chisel_list_io_expanding))
chisel_list_io_shrinking = list(filter(lambda x: x["fanin2out"] == "1", chisel_list_dict))

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
len_chisel_list_io_expanding_even = len(chisel_list_io_expanding_even)
len_chisel_list_io_expanding_odd = len(chisel_list_io_expanding_odd)

''' Assigns chisel module to a vertex
    vertex["chisel"] = dict
    @returns: the unit type number 
'''
def assign_chisel_module(vertex):
    in_width = vertex["unit"].i
    assert(in_width < 1024)
    # Loop until we find appropriate module
    while(True):
        idx_chisel = 0
        chisel_dict = []
        
        '''
        Randomly pick module, with certain restrictions
        '''
        if in_width == 0 : 
            chisel_dict = {"name": "LFSR", "type": "other", "vars":["n", "b"], "in_expr":"n-4*b", "out_expr": "n"}
        else: 
            if in_width % 2 == 0 :
                if in_width < 8 :
                    idx_chisel = randint(0,len_chisel_list_io_expanding_even-1)
                    chisel_dict = chisel_list_io_expanding_even[idx_chisel].copy() # this module's dictionary
                else:
                    category = choice(all_even_list)
                    idx_chisel = randint(0, len(category)-1)
                    chisel_dict = category[idx_chisel].copy()
            else :
                if in_width < 8 :
                    idx_chisel = randint(0,len_chisel_list_io_expanding_odd-1)
                    chisel_dict = chisel_list_io_expanding_odd[idx_chisel].copy() # this module's dictionary
                else:
                    category = choice(all_odd_list)
                    idx_chisel = randint(0, len(category)-1)
                    chisel_dict = category[idx_chisel].copy()
        
        ''' 
        Variables decidiing I/O width of given module
        For modules that use extra param 'a', choose a to be log2(n)
        For moduels that use extra param 'b', choose random value between 0 and 6
        '''
        print("Module Name: {} FROM I: {}".format( chisel_dict["name"],in_width))

        n = symbols('n')
        a = 0; b = 0
        if "a" in chisel_dict["vars"]: 
            a = math.floor(in_width / 6) + randint(0,2) # Guess: a = log (n), where n+2a == in_width
        if "b" in chisel_dict["vars"]: 
            if in_width <= 8 : b = 1
            else : b = randint(1, in_width//4) # Just random width

        # Evaluate value of n 

        in_expr = chisel_dict["in_expr"]
        out_expr = chisel_dict["out_expr"]
        sols = eval("solve({} - {}, n)".format(in_expr, in_width))
        n = int(sols[0])
        out_width = eval(out_expr)
        
        print("Module Name: {} N={} FROM I: {} TO O: {}".format( chisel_dict["name"],n ,in_width, out_width))

        # final check if n is positive integer
        # if (out_width < vertex.outdegree()): 
        #     print("check 1 {}".format(vertex.outdegree())); continue
        if chisel_dict["name"] == "RegFile2R1W" and n > 128: print("check 2"); continue
        if "a" in chisel_dict["vars"]:
            if n < 1 : continue
            if a != math.ceil(log(n,2)) : continue

        for var in chisel_dict["vars"]:
            chisel_dict[var] = eval(var)
        #     # if var=="a" and a != math.ceil(log(n,2)) : continue


        if (in_width == eval(in_expr)):
            vertex["chisel"] = chisel_dict
            vertex["unit"].o = out_width
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