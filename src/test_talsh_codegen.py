#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import codegen_talsh as tcg

def main():

   print("\nOutputting sample TAL-SH code")

   sial_input = tcg.TALSHcodeGenerator()
   sial_input.read_sial("CCSD.1.fac.u.ormo.txt")
   sial_input.print_code()

main()

