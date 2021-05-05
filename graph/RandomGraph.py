from random import randint, seed

import igraph, math
from Units import *
from graph_helpers import *
from chisel_module_helpers import *
from generate_chisel import *

M = 2  # number of memory units
red   = (1,.5,.5,1)
green = (.5,1,.5,1)
blue  = (.5,.8,1,1)
yellow = (1,1,.5,1)
orange = (1,.65,0)

MaxTypeNum = 10

Hierarchical = True
''' class objects:
    - from Unit:
        - i, o, type
    - g: igraph object
    - hierarchy_level: current depth in the hierarchy
    - inputs: list of input vertices of graph g
    - outputs: list of output vertices of graph g
'''
class RandomGraph(Unit):
    def __init__(self,L=0,I=0, IN_W=0, OUT_W=0):
        self.g = igraph.Graph()
        self.inputs = []
        self.outputs = []
        self.hierarchy_level = L
        self.level_id = I
        self.in_wire_width = IN_W
        self.out_wire_width = OUT_W
        super().__init__(type=UnitType.GRAPH)
        # allowed igraph shapes:
        # [1] "circle"     "square"     "csquare"    "rectangle"  "crectangle"
        # [6] "vrectangle" "none"

    def build_graph(self, N=50, IN_W=0, OUT_W=0):
        # List of vertices that are themselves subgraphs
        subgraph_vertices = []
        # Update wire widths coming in and out of graph (from higher hierachy level graph)
        self.in_wire_width = IN_W
        self.out_wire_width = OUT_W
        self.N = N

        ''' generate random DAG
            loop until DAG successfully generated (always happens on first try for me)
            do this because feedback_arc_set() uses a heuristic, so it might fail with complex graph
        '''
        while True:
            g = igraph.Graph.Erdos_Renyi(n=N, p=0.03,directed=True, loops=False)
            extra_edges = g.feedback_arc_set()
            g.delete_edges(extra_edges)
            # only keep largest connected graph (remove unconnected vertices/edges)
            g = g.clusters(mode='weak').giant()
            if g.is_dag():
                # Check if given input width is large enough for generated graph 
                diameter_vs = g.get_diameter()
                min_in_w = 2
                for vid in diameter_vs[:-1] :
                    min_in_w *= g.vs[vid].outdegree()
                if IN_W > min_in_w : 
                    message('Random DAG created!')
                    break

        # iterate over edges and create channel object
        for edge in g.es:
            edge["unit"] = Channel(width=0)

        ''' iterate over vertices
            initialize all "unit" attributes randomly
            store input and output vertices (for later)
        '''
        for vertex in g.vs:
            vertex["color"] = yellow
            if vertex.indegree() == 0:
                vertex["color"] = green
                self.inputs.append(vertex)
            if vertex.outdegree() == 0:
                vertex["color"] = red
                self.outputs.append(vertex)
            vertex["unit"] = Unit()

        ''' iterate over input vertices
            randomly initialize input channel width
            from these inputs, do Breadth-First Search (BFS)
            to assign output channel widths based on input widths
        '''   
        remaining_in_width = IN_W
        remaining_inputs = len(self.inputs)
        for input in self.inputs:
            mean_in_width = remaining_in_width // remaining_inputs
            assert(mean_in_width >= 4)

            # Heuristic: roughly distribute input widths equally across all input vertices
            in_width = max(4, randint(mean_in_width//4-1, mean_in_width//4+2) * 4) if remaining_inputs > 1 else remaining_in_width
            remaining_in_width -= in_width
            remaining_inputs -= 1
            
            input["unit"].i = in_width
            self.instantiate_vertex(input)
            assign_widths_to_outedges(input)
            vertex_iter = g.bfsiter(input.index)
            next(vertex_iter) # advance iterator past input vertex
            for vertex in vertex_iter:
                update_vertex_input_width(vertex)
                self.instantiate_vertex(vertex)
                assign_widths_to_outedges(vertex)
        message("Widths assigned to all channels.")

        ''' inputs - green
            outputs - red
            labels of input/output vertices denote channel width of that input
        '''
        input_width = 0
        output_width = 0
        for input in self.inputs:
            input["label"] = str(input["unit"].i)
            input_width += input["unit"].i
        for output in self.outputs:
            output["label"] = str(output["unit"].o)
            output_width += output["unit"].o
        message("Input (green) and Output (red) Channel objects added.")
        message("Random graph constructed!")


        self.i = input_width
        self.o = output_width
        self.immutable_widths = True
        self.g = g
        # Subgraph generation
        # for vertex in subgraph_vertices:
        #     rg = vertex["unit"]
        #     in_w,out_w = get_vertex_io_width(vertex)
        #     rg.build_graph(N=N-5, IN_W=in_w, OUT_W = out_w)
        
        self.save_graph_pdf()
        # for v in g.vs:
        #     print(v["chisel"])

    def get_input_width(self):
        input_width = 0
        for input in self.inputs:
            input_width += input["unit"].i
        self.i = input_width
        return super().get_input_width()
    
    def get_output_width(self):
        output_width = 0
        for output in self.outputs:
            output_width += output["unit"].o
        self.o = output_width
        return super().get_output_width()
    
    def update_channel_widths(self):
        ''' iterate over input vertices
            from these inputs, do Breadth-First Search (BFS)
            to assign output channel widths based on input widths
        '''
        for input in self.inputs:
            assign_widths_to_outedges(input)
            [v_idxs, layers, parents] = g.bfs(input.index) 
            for v_idx in v_idxs[1:]:
                vertex = g.vs[v_idx]
                update_vertex_input_width(vertex)
                # scale_output_from_input(vertex)
                assign_widths_to_outedges(vertex)
        message("Widths assigned to all channels.")
        
    # assigns graph vertex to a Chisel module or a Random Graph object
    # in either case, output width is set
    def instantiate_vertex(self,vertex):
        seed()
        rand_val = randint(0, 3*self.hierarchy_level) #10% chance of getting a subgraph vertex at level 0 and 1
        in_w,out_w = get_vertex_io_width(vertex)
        if Hierarchical:
            if rand_val > 0 or self.hierarchy_level > 3 or in_w < 12: # NOT a subgraph
                vertex["unit"] = Compute(i=vertex["unit"].i,o=0, type=UnitType(randint(2, MaxTypeNum)))
                assign_chisel_module(vertex)
            else : # vertex IS a subgraph
                vertex["unit"] = RandomGraph(L=self.hierarchy_level+1, I=vertex.index)
                vertex["color"] = orange
                vertex["shape"] = "rectangle"
                vertex["chisel"] = {"name":"RandomHardware"}                
                next_N = min(math.floor(math.log(in_w,2)), in_w/2)
                message("Building subgraph for vertex size {} from width {}".format(next_N,in_w))
                vertex["unit"].build_graph(N=next_N, IN_W=in_w, OUT_W=out_w)
                # TODO: maybe wrap this chisel dict in assign_chisel_module?
        else: # not Hierarchical
            vertex["unit"] = Compute(i=vertex["unit"].i,o=0, type=UnitType(randint(2, MaxTypeNum)))
            assign_chisel_module(vertex)
        
    # def attach_memory_unit(self):
    #     while True:
    #         m = randint(0,len(self.g.vs)-1)
    #         vertex_read = self.g.vs[m]
    #         if not vertex_read["unit"].connected_to_mem:
    #             break
    #     while True:
    #         m = randint(0,len(self.g.vs)-1)
    #         vertex_write = self.g.vs[m]
    #         if not vertex_write["unit"].connected_to_mem:
    #             break
    #     g = self.g
    #     g.add_vertex()
    #     memory_vertex = g.vs[len(g.vs)-1]
    #     datawidth = min(vertex_read["unit"].i, vertex_write["unit"].o)
    #     addrwidth = min(randint(1,10), vertex_read["unit"].o, vertex_write["unit"].o)
    #     memory_vertex["unit"] = Memory(datawidth=datawidth,addrwidth=addrwidth)
    #     memory_vertex["label"] = "\n\n\n{a},{d}".format(d=datawidth,a=addrwidth)

    #     #TODO: attach MemoryChannel objects to each edge
    #     g.add_edges([(vertex_read.index,memory_vertex.index)])  # vertex_read   --> memory (addr)
    #     g.add_edges([(memory_vertex.index,vertex_read.index)])  # vertex_read   <-- memory (data)
    #     g.add_edges([(vertex_write.index,memory_vertex.index)]) # vertex_write  --> memory (data+addr)
    #     for new_edge in g.es[(len(g.es)-3):(len(g.es))]:
    #         new_edge["color"] = blue

    #     vertex_read["unit"].i += memory_vertex["unit"].o
    #     memory_vertex["shape"] = "rectangle"
    #     memory_vertex["color"] = blue
    #     vertex_read["unit"].connected_to_mem = True
    #     vertex_write["unit"].connected_to_mem = True

    def save_graph_pdf(self):
        layout = self.g.layout("fr")
        igraph.plot(self.g, "/home/ubuntu/random_graph_{}_{}.pdf".format(self.hierarchy_level, self.level_id), layout=layout,bbox=(1000,1000),margin=50,autocurve=False)

## EXAMPLE USAGE

rg = RandomGraph(L=0)
rg.build_graph(N=30, IN_W = 600)
write_random_graph(rg)