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

if sys.argv[1] == "social":
    gen_smoker(int(sys.argv[2]), int(sys.argv[3]))
elif sys.argv[1] == "cycle":
    gen_cycle(int(sys.argv[2]))
elif sys.argv[1] == "grid":
    gen_grid(int(sys.argv[2]), int(sys.argv[3]))
elif sys.argv[1] == "gh":
    gen_gh(int(sys.argv[2]), format=sys.argv[-1])
elif sys.argv[1] == "gnb":
    gen_gnb(int(sys.argv[2]), format=sys.argv[-1])
elif sys.argv[1].isnumeric():
    x = int(sys.argv[1])
    for i in range(3, x):
        gen_smoker(i, 1)
        gen_smoker(i, 2)
        gen_cycle(i)
        gen_grid(i, i)
