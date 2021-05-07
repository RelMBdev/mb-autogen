#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import codegen_talsh as tcg

def main():

   print("! Outputting sample TAL-SH (fortran) code\n!")

   sial_input = tcg.TALSHcodeGenerator()
   sial_input.read_sial("CCSD.1.fac.u.ormo.txt")
   sial_input.generate_code()
   sial_input.print_code()

main()

