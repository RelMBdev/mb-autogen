#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import codegen_talsh as tcg

def main():

   sial_input = tcg.TALSHcodeGenerator()
   sial_input.read_sial("CCSD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="talsh_auto_ccsd_diagram_info.F90")

   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="talsh_auto_ccd_diagram_info_spinor.F90")

   sial_input = tcg.TALSHcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCSD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="talsh_auto_ccsd_diagram_info_spinor.F90")

main()

