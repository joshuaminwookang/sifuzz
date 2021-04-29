from random import randint, seed

import igraph
from Units import *
from graph_helpers import *
from Translate2Chisel import *

M = 2  # number of memory units
red   = (1,.5,.5,1)
green = (.5,1,.5,1)
blue  = (.5,.8,1,1)
yellow = (1,1,.5,1)
orange = (1,.65,0)

# class objects:
#   - from Unit:
#       - i, o, type
#   - g: igraph object
#   - hierarchy_level: current depth in the hierarchy
#   - inputs: list of input vertices of graph g
#   - outputs: list of output vertices of graph g

class RandomGraph(Unit):
    def __init__(self,L=0,I=0, IN_W=0, OUT_W=0):
        self.g = igraph.Graph()
        self.inputs = []
        self.outputs = []
        self.hierarchy_level = L
        self.level_id = I
        self.in_wire_width = IN_W
        self.out_wire_width = OUT_W
        # allowed igraph shapes:
        # [1] "circle"     "square"     "csquare"    "rectangle"  "crectangle"
        # [6] "vrectangle" "none"

    def build_graph(self, N=30,IN_W=0, OUT_W=0):
        # List of vertices that are themselves subgraphs
        subgraph_vertices = []

        # Update wire widths coming in and out of graph (from higher hierachy level graph)
        self.in_wire_width = IN_W
        self.out_wire_width = OUT_W

        # generate random DAG
        #   loop until DAG successfully generated (always happens on first try for me)
        #   do this because feedback_arc_set() uses a heuristic, so it might fail with complex graph
        while True:
            g = igraph.Graph.Erdos_Renyi(n=N, p=0.03,directed=True,loops=False)
            extra_edges = g.feedback_arc_set()
            g.delete_edges(extra_edges)
            # only keep largest connected graph (remove unconnected vertices/edges)
            g = g.clusters(mode='weak').giant()
            if g.is_dag():
                message('Random DAG created!')
                break
        # simpler method:
        # g = igraph.Graph.Erdos_Renyi(n=N, p=0.05,directed=True,loops=False)
        # g.simplify() # remove multiedges and loops
        # layout =largest.layout("fr")
        # igraph.plot(largest,layout=layout,bbox=(1000,1000),margin=100,autocurve=False)

        # iterate over edges and create channel object
        for edge in g.es:
            edge["unit"] = Channel(width=0)

        # iterate over vertices
        # initialize all "unit" attributes randomly!
        # store input and output vertices (for later)
        for vertex in g.vs:
            seed()
            rand_val = randint(self.hierarchy_level //2 , 4) #20% chance of getting a subgraph vertex at level 0 and 1
            
            vertex["color"] = yellow
            if vertex.indegree() == 0:
                vertex["color"] = green
                self.inputs.append(vertex)
            if vertex.outdegree() == 0:
                vertex["color"] = red
                self.outputs.append(vertex)

            # NOT a subgraph
            if rand_val > 0: 
                vertex["unit"] = Compute(i=0,o=0, type=UnitType(randint(2, 5)))
            # vertex IS a subgraph
            else : 
                subgraph_vertices.append(vertex)
                rg = RandomGraph(L=self.hierarchy_level+1, I=vertex.index)
                vertex["unit"] = rg
                vertex["color"] = orange

        # iterate over input vertices
        # randomly initialize input channel width
        # from these inputs, do Breadth-First Search (BFS)
        #   to assign output channel widths based on input widths
        for input in self.inputs:
            in_width = 4*randint(6,10)
            input["unit"].i = in_width
            input["unit"].o = in_width
            assign_widths_to_outedges(input)
            vertex_iter = g.bfsiter(input.index)
            [v_idxs, layers, parents] = g.bfs(input.index) 
            # print(str(v_idxs))
            # for v_idx in v_idxs[1:]:
            next(vertex_iter) # advance iterator past input vertex
            for vertex in vertex_iter:
                # vertex = g.vs[v_idx]
                # vertex = g.vs[v.index]
                update_vertex_input_width(vertex)
                scale_output_from_input(vertex)
                assign_widths_to_outedges(vertex)
        for input in self.inputs:
            in_width = 4*randint(6,10)
            input["unit"].i = in_width
            input["unit"].o = in_width
            assign_widths_to_outedges(input)
            vertex_iter = g.bfsiter(input.index)
            [v_idxs, layers, parents] = g.bfs(input.index) 
            # print(str(v_idxs))
            # for v_idx in v_idxs[1:]:
            next(vertex_iter) # advance iterator past input vertex
            for vertex in vertex_iter:
                # vertex = g.vs[v_idx]
                # vertex = g.vs[v.index]
                update_vertex_input_width(vertex)
                scale_output_from_input(vertex)
                assign_widths_to_outedges(vertex)
        message("Widths assigned to all channels.")

        # check for width 0 channels
        for edge in g.es:
            assert(edge["unit"].width > 0)

        # inputs - green
        # outputs - red
        # labels of input/output vertices denote channel width of that input
        input_width = 0
        output_width = 0
        for input in self.inputs:
            # print(input["unit"].i)
            input["label"] = str(input["unit"].i)
            input_width += input["unit"].i
        for output in self.outputs:
            output["label"] = str(output["unit"].o)
            output_width += output["unit"].o
        message("Input (green) and Output (red) Channel objects added.")
        message("Random graph constructed!")

        # DEBUGGING
        # for vertex in g.vs:
        #     vertex["label"] = str(vertex.index) # for debugging

        super().__init__(i=input_width,o=output_width,type=UnitType.GRAPH)
        self.immutable_widths = True
        self.g = g
        
        # Add Memory Units
        # for i in range(0,M) :
        #     self.attach_memory_unit()

        # Subgraph generation
        for vertex in subgraph_vertices:
            rg = vertex["unit"]
            in_w,out_w = get_vertex_io_width(vertex)
            rg.build_graph(N=rg.i//2, IN_W= in_w, OUT_W = out_w)

        self.save_graph_pdf()

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
        # iterate over input vertices
        # from these inputs, do Breadth-First Search (BFS)
        #   to assign output channel widths based on input widths
        for input in self.inputs:
            assign_widths_to_outedges(input)
            [v_idxs, layers, parents] = g.bfs(input.index) 
            for v_idx in v_idxs[1:]:
                vertex = g.vs[v_idx]
                update_vertex_input_width(vertex)
                scale_output_from_input(vertex)
                assign_widths_to_outedges(vertex)
        message("Widths assigned to all channels.")
        
    def attach_memory_unit(self):
        while True:
            m = randint(0,len(self.g.vs)-1)
            vertex_read = self.g.vs[m]
            if not vertex_read["unit"].connected_to_mem:
                break
        while True:
            m = randint(0,len(self.g.vs)-1)
            vertex_write = self.g.vs[m]
            if not vertex_write["unit"].connected_to_mem:
                break
        g = self.g
        g.add_vertex()
        memory_vertex = g.vs[len(g.vs)-1]
        datawidth = min(vertex_read["unit"].i, vertex_write["unit"].o)
        addrwidth = min(randint(1,10), vertex_read["unit"].o, vertex_write["unit"].o)
        memory_vertex["unit"] = Memory(datawidth=datawidth,addrwidth=addrwidth)
        memory_vertex["label"] = "\n\n\n{a},{d}".format(d=datawidth,a=addrwidth)

        #TODO: attach MemoryChannel objects to each edge
        g.add_edges([(vertex_read.index,memory_vertex.index)])  # vertex_read   --> memory (addr)
        g.add_edges([(memory_vertex.index,vertex_read.index)])  # vertex_read   <-- memory (data)
        g.add_edges([(vertex_write.index,memory_vertex.index)]) # vertex_write  --> memory (data+addr)
        for new_edge in g.es[(len(g.es)-3):(len(g.es))]:
            new_edge["color"] = blue

        vertex_read["unit"].i += memory_vertex["unit"].o
        memory_vertex["shape"] = "rectangle"
        memory_vertex["color"] = blue
        vertex_read["unit"].connected_to_mem = True
        vertex_write["unit"].connected_to_mem = True

    def save_graph_pdf(self):
        layout = self.g.layout("fr")
        igraph.plot(self.g, "/home/ubuntu/random_graph_{}_{}.pdf".format(self.hierarchy_level, self.level_id), layout=layout,bbox=(1000,1000),margin=50,autocurve=False)

## EXAMPLE USAGE

rg = RandomGraph(L=0)
try:
    rg.build_graph()
except AssertionError as error:
    message(error)
    # rg.build_graph()

# # Add some memory units
# rg.attach_memory_unit()
# rg.attach_memory_unit()
# rg.attach_memory_unit()

# visualize_graph(rg.g)
# save_graph_pdf(rg.g)

# Generate Chisel code
write_random_graph(rg)

# # Make a vertex of the graph into a graph itself
# vertex0 = rg.g.vs[0]
# rg.make_hierarchical_vertex(vertex0)
# visualize_graph(vertex0["unit"].g)