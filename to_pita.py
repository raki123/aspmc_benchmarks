import sys

from aspmc.programs.problogprogram import ProblogProgram

program = ProblogProgram(program_files = [sys.argv[1]], program_str = "")
queries = program.queries
program.queries = []
out_name = sys.argv[2]
if not out_name.endswith(".pl"):
    if out_name.endswith(".lp"):
        out_name[-1] = 'l'
        out_name[-2] = 'p'
        out_name[-3] = '.'
    else:
        out_name += ".pl"
with open(sys.argv[2], 'w') as out_file:
    out_file.write(""":- use_module(library(pita)).
:- pita.
:- begin_lpad.
""")
    out_file.write(program._prog_string(program._program))
    for query in queries:
        out_file.write(f"query({query}) :- {query}.\n")
    out_file.write(":- end_lpad.")

