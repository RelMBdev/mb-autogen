#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import codegen_talsh as tcg

def main():

   sial_input = tcg.TALSHcodeGenerator()
   sial_input.read_sial("SIAL_small_I4.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="talsh_sial-brandejs.F90")

main()

