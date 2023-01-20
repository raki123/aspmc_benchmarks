#!/usr/bin/env python3

import sys
import networkx as nx
import random

base_smoker_prob = '''
0.5::pToS(X) :- person(X).
smokes(X) :- pToS(X).
0.5::influences(X,Y) :- friend_of(X,Y,P).
smokes(X) :- smokes(Y), influences(X,Y).
query(smokes(X)).
'''
def gen_smoker(n, k):
    fp = open(f"smokers_{n}_{k}_prob.lp", 'w')
    for i in range(1, n + 1):
        fp.write(f"person({i}).\n")
    graph = nx.generators.random_graphs.barabasi_albert_graph(n, k)
    for i in range(1, n + 1):
        for j in range(1, n + 1):
            if graph.has_edge(i,j):# and i < j:
            #if True:
                prob = random.random()
                fp.write(f"friend_of({i},{j},{prob}).\n")
    fp.write(base_smoker_prob)
    fp.close()

base_viral = '''
0.1::buys(X) :- person(X), \+ advertise(X).
0.3::buys(X) :- person(X), advertise(X).
0.5::advertise(X) :- person(X).
0.6::buys(X) :- buys(Y), friend(X,Y).
'''
def gen_viral(n, k):
    fp = open(f"viral/viral_{n}_{k}.lp", 'w')
    for i in range(1, n + 1):
        fp.write(f"person({i}).\n")
    graph = nx.generators.random_graphs.barabasi_albert_graph(n, k)
    for i in range(1, n + 1):
        for j in range(1, n + 1):
            if graph.has_edge(i,j):
                fp.write(f"friend({i},{j}).\n")
    fp.write(base_viral)
    fp.close()

def gen_cycle(n):
    fp = open(f"cyc_{n}_prob.lp", 'w')
    for i in range(1, n + 1):
        fp.write(f"person({i}).\n")
    for i in range(1, n + 1):
        prob = random.random()
        fp.write(f"friend_of({i},{1+(i%n)},{prob}).\n")
        fp.write(f"friend_of({1+(i%n)},{i},{prob}).\n")
    fp.write(base_smoker_prob)
    fp.close()

def gen_grid(k,l):
    fp = open(f"grid_{k}x{l}_prob.lp", 'w')
    for i in range(1, k*l + 1):
        fp.write(f"person({i}).\n")
    for i in range(0, k):
        for j in range(1, l + 1):
            prob = random.random()
            if j < l:
                fp.write(f"friend_of({i*l + j},{i*l + j+1},{prob}).\n")
            if j > 1:
                fp.write(f"friend_of({i*l + j},{i*l + j-1},{prob}).\n")
            if i < k - 1:
                fp.write(f"friend_of({i*l + j},{(i+1)*l + j},{prob}).\n")
            if i > 0:
                fp.write(f"friend_of({i*l + j},{(i-1)*l + j},{prob}).\n")
    fp.write(base_smoker_prob)
    fp.close()


def gen_gh(n, format ="problog"):
    if format == "pita":
        fp = open(f"gh_pita/gh_{n}_prob.lp", 'w')
        fp.write(""":- use_module(library(pita)).
:- pita.
:- begin_lpad.
""")
        fp.write("query(a0):-a0.\n")
    else:
        fp = open(f"gh_problog/gh_{n}_prob.lp", 'w')
        fp.write("query(a0).\n")
    for i in range(1, n):
        fp.write(f"0.5::a{i}.\n")
        prob = 1.0/i
        fp.write(f"{';'.join(f'{prob}::a{j}' for j in range(i))}:-a{i}.\n")
    if format == "pita":
        fp.write(":- end_lpad.")
    fp.close()

def gen_gnb(n, format ="problog"):
    bs = '\\'
    if format == "pita":
        fp = open(f"gnb_pita/gnb_{n}_prob.lp", 'w')
        fp.write(""":- use_module(library(pita)).
:- pita.
:- begin_lpad.
""")
        fp.write("query(a0):-a0.\n")
    else:
        fp = open(f"gnb_problog/gnb_{n}_prob.lp", 'w')
        fp.write("query(a0).\n")
    for i in range(n):
        for j in range(i+1,n):
            fp.write(f"0.5::a{i} :- {','.join(f'{bs}+ a{k}' if k < j else f'a{k}' for k in range(i+1,j+1))}.\n")
    fp.write(f"0.5::a{n-1}.\n")
    if format == "pita":
        fp.write(":- end_lpad.")
    fp.close()

def gen_tree(n, k, format ="problog"):
    tree = nx.random_tree(n, create_using=nx.DiGraph)
    network = nx.DiGraph() 
    extra_nodes = list(range(n, n + k))
    final_node = n + k
    for node in tree.nodes():
        network.add_edges_from( (node,v) for v in extra_nodes)
        network.add_edges_from( (w,v) for w, v in tree.out_edges(node))
        network.add_edges_from( (v,node) for v in extra_nodes)
        network.add_edges_from( (v,w) for w, v in tree.out_edges(node))

    for node in extra_nodes:
        network.add_edge(node, final_node)

    bs = '\\'
    if format == "pita":
        fp = open(f"tree_pita/tree_{n}_{k}.lp", 'w')
        fp.write(""":- use_module(library(pita)).
:- pita.
:- begin_lpad.
""")
        fp.write(f"query(reach({final_node})):-reach({final_node}).\n")
    else:
        fp = open(f"tree_problog/tree_{n}_{k}.lp", 'w')
        fp.write(f"query(reach({final_node})).\n")
    fp.write(f"reach(0).\n")
    for v in network.nodes():
        fp.write(f"0.1::delayed({v}).\n")
        children = [ u for _, u in network.out_edges(v) if u != v ]
        if len(children) > 0:
            prob = 1.0/len(children)
            fp.write(";".join( f"{prob}::reach({u})" for u in children ))
            fp.write(f":- reach({v})")
            fp.write(f", \+ delayed({v})")
            fp.write(".\n")
    if format == "pita":
        fp.write(":- end_lpad.")
    fp.close()

if sys.argv[1] == "social":
    gen_smoker(int(sys.argv[2]), int(sys.argv[3]))
elif sys.argv[1] == "viral":
    gen_viral(int(sys.argv[2]), int(sys.argv[3]))
elif sys.argv[1] == "cycle":
    gen_cycle(int(sys.argv[2]))
elif sys.argv[1] == "grid":
    gen_grid(int(sys.argv[2]), int(sys.argv[3]))
elif sys.argv[1] == "gh":
    gen_gh(int(sys.argv[2]), format=sys.argv[-1])
elif sys.argv[1] == "gnb":
    gen_gnb(int(sys.argv[2]), format=sys.argv[-1])
elif sys.argv[1] == "tree":
    gen_tree(int(sys.argv[2]), int(sys.argv[3]), format=sys.argv[-1])
elif sys.argv[1].isnumeric():
    x = int(sys.argv[1])
    for i in range(3, x):
        gen_smoker(i, 1)
        gen_smoker(i, 2)
        gen_cycle(i)
        gen_grid(i, i)
