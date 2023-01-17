import sys

from aspmc.programs.problogprogram import ProblogProgram

program = ProblogProgram(program_files = [sys.argv[1]], program_str = "")
with open(sys.argv[2], 'w') as out_file:
    out_file.write(program.to_lpmln())
