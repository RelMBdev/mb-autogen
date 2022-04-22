#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import codegen_talsh as tcg

def main():

   sial_input = tcg.TALSHcodeGenerator()
   sial_input.read_sial("CCSD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="auto_ccsd.F")

   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="auto_ccd_spinor.F")

   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCSD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="auto_ccsd_spinor.F")

   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCSDT.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="auto_ccsdt_spinor.F")

#   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
#   sial_input.read_sial("CCSDTQ.1.fac.u.ormo.txt",verbose=True)
#   sial_input.generate_code()
#   sial_input.print_code(filename="auto_ccsdtq_spinor.F")
#
#   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
#   sial_input.read_sial("CCSDTQ5.1.fac.u.ormo.txt",verbose=True)
#   sial_input.generate_code()
#   sial_input.print_code(filename="auto_ccsdtq5_spinor.F")

main()

