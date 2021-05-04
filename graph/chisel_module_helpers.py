from random import randint
import igraph
import csv
from sympy import symbols, Eq, solve


chisel_list_dict = []

with open('ChiselModules.csv', mode='r', encoding='utf-8-sig', newline='') as csvfile:
    chisels_reader = csv.DictReader(csvfile)
    chisels_fieldnames = chisels_reader.fieldnames
    for chisel_dict in chisels_reader:
        vars_vect = chisel_dict['vars'].split(';')
        chisel_dict['vars'] = vars_vect
        chisel_list_dict.append(chisel_dict)

num_chisel_modules = len(chisel_list_dict)

''' Assigns chisel module to a vertex
    vertex["chisel"] = dict
'''
def assign_chisel_module(vertex):
    in_width = vertex["unit"].i
    while(True):
        # assign Chisel modules randomly
        # TODO: add bounds-checking (maybe parity checking) to choose units
        idx_chisel = randint(0,num_chisel_modules-1)
        chisel_dict = chisel_list_dict[idx_chisel].copy()
        in_expr = chisel_dict["in_expr"]
        out_expr = chisel_dict["out_expr"]
        a = randint(1,max(int(in_width/3),1)) # TODO: clean this up
        n = symbols('n')
        s = 'solve(' + in_expr + ' - ' + str(in_width) +')'
        sols = eval(s)
        n = int(sols[0])
        if (n <= 0): continue
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