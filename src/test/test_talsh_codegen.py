#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import codegen_talsh as tcg

def main():

   sial_input = tcg.TALSHcodeGenerator()
   sial_input.read_sial("CCSD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="talsh_auto_ccsd.F90")

   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="talsh_auto_ccd_spinor.F90")

   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCSD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="talsh_auto_ccsd_spinor.F90")

   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCSDT.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="talsh_auto_ccsdt_spinor.F90")

   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCSDTQ.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="talsh_auto_ccsdtq_spinor.F90")

   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCSDTQP.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="talsh_auto_ccsdtqp_spinor.F90")

main()

