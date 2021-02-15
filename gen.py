#!/usr/bin/env python3

import sys
import networkx as nx
import random

base_smoker = '''
{pToS(X)} :- person(X).
smokes(X) :- pToS(X).
smokes(X) :- smokes(Y), influences(X,Y).
{influences(X,Y)} :- friend_of(X,Y).
'''

base_smoker_prob = '''
0.5::pToS(X) :- person(X).
smokes(X) :- pToS(X).
0.5::influences(X,Y) :- friend_of(X,Y,P).
smokes(X) :- smokes(Y), influences(X,Y).
query(smokes(X)).
'''
def gen_smoker(n, k):
    wf = "#(1)"
    f = open(f"smokers_{n},{k}.lp", 'w')
    fp = open(f"smokers_{n},{k}_prob.lp", 'w')
    f.write(f"person(1..{n}).\n")
    for i in range(1, n + 1):
        wf += f"*(pToS({i})*#(0.3) + npToS({i})*#(0.7))"
        fp.write(f"person({i}).\n")
    graph = nx.generators.random_graphs.barabasi_albert_graph(n, k)
    for i in range(1, n + 1):
        for j in range(1, n + 1):
            if graph.has_edge(i,j):# and i < j:
            #if True:
                f.write(f"friend_of({i},{j}).\n")
                prob = random.random()
                fp.write(f"friend_of({i},{j},{prob}).\n")
                wf += f"*(fToI({i},{j})*#({prob}) + nfToI({i},{j})*#({1 - prob}))"
    f.write(base_smoker)
    f.close()
    fp.write(base_smoker_prob)
    fp.close()
    #print(wf)

def gen_cycle(n):
    wf = "#(1)"
    f = open(f"cyc_{n}.lp", 'w')
    fp = open(f"cyc_{n}_prob.lp", 'w')
    f.write(f"person(1..{n}).\n")
    for i in range(1, n + 1):
        wf += f"*(pToS({i})*#(0.3) + npToS({i})*#(0.7))"
        fp.write(f"person({i}).\n")
        f.write(f":-not smokes({i}).\n")
    for i in range(1, n + 1):
        f.write(f"friend_of({i},{1+(i%n)}).\n")
        f.write(f"friend_of({1+(i%n)},{i}).\n")
        prob = random.random()
        fp.write(f"friend_of({i},{1+(i%n)},{prob}).\n")
        fp.write(f"friend_of({1+(i%n)},{i},{prob}).\n")
    f.write(base_smoker)
    f.close()
    fp.write(base_smoker_prob)
    fp.close()

def gen_grid(k,l):
    wf = "#(1)"
    f = open(f"grid_{k}x{l}.lp", 'w')
    fp = open(f"grid_{k}x{l}_prob.lp", 'w')
    f.write(f"person(1..{k*l}).\n")
    for i in range(1, k*l + 1):
        wf += f"*(pToS({i})*#(0.3) + npToS({i})*#(0.7))"
        fp.write(f"person({i}).\n")
        f.write(f":-not smokes({i}).\n")
    for i in range(0, k):
        for j in range(1, l + 1):
            prob = random.random()
            if j < l:
                f.write(f"friend_of({i*l + j},{i*l + j+1}).\n")
                fp.write(f"friend_of({i*l + j},{i*l + j+1},{prob}).\n")
            if j > 1:
                f.write(f"friend_of({i*l + j},{i*l + j-1}).\n")
                fp.write(f"friend_of({i*l + j},{i*l + j-1},{prob}).\n")
            if i < k - 1:
                f.write(f"friend_of({i*l + j},{(i+1)*l + j}).\n")
                fp.write(f"friend_of({i*l + j},{(i+1)*l + j},{prob}).\n")
            if i > 0:
                f.write(f"friend_of({i*l + j},{(i-1)*l + j}).\n")
                fp.write(f"friend_of({i*l + j},{(i-1)*l + j},{prob}).\n")
    f.write(base_smoker)
    f.close()
    fp.write(base_smoker_prob)
    fp.close()


if sys.argv[1] == "social":
    gen_smoker(int(sys.argv[2]), int(sys.argv[3]))
elif sys.argv[1] == "cycle":
    gen_cycle(int(sys.argv[2]))
elif sys.argv[1] == "grid":
    gen_grid(int(sys.argv[2]), int(sys.argv[3]))
elif sys.argv[1].isnumeric():
    x = int(sys.argv[1])
    for i in range(3, x):
        gen_smoker(i, 1)
        gen_smoker(i, 2)
        gen_cycle(i)
        gen_grid(i, i)
