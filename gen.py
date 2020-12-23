import sys
import random

base_smoker = '''
{pToS(X)} :- person(X).
smokes(X) :- pToS(X).
smokes(X) :- smokes(Y), influences(X,Y).
{influences(X,Y)} :- friend_of(X,Y).
:- not smokes(1).
'''

base_smoker_prob = '''
0.5::pToS(X) :- person(X).
smokes(X) :- pToS(X).
0.5::influences(X,Y) :- friend_of(X,Y,P).
smokes(X) :- smokes(Y), influences(X,Y).
query(smokes(1)).
'''
def gen_smoker(n):
    wf = "#(1)"
    f = open(f"smokers_{n}.lp", 'w')
    fp = open(f"smokers_{n}_prob.lp", 'w')
    f.write(f"person(1..{n}).\n")
    for i in range(1, n + 1):
        wf += f"*(pToS({i})*#(0.3) + npToS({i})*#(0.7))"
        fp.write(f"person({i}).\n")
    for i in range(1, n + 1):
        for j in range(1, n + 1):
            if i != j and random.random() < 0.5:
                f.write(f"friend_of({i},{j}).\n")
                prob = random.random()
                fp.write(f"friend_of({i},{j},{prob}).\n")
                wf += f"*(fToI({i},{j})*#({prob}) + nfToI({i},{j})*#({1 - prob}))"
    f.write(base_smoker)
    f.close()
    fp.write(base_smoker_prob)
    fp.close()
    #print(wf)

gen_smoker(int(sys.argv[1]))
