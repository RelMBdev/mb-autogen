#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import codegen_exatensor as tcg

def main():

   sial_input = tcg.ExaTENSORcodeGenerator()
   sial_input.read_sial("CCSD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="exatensor_auto_ccsd_diagram_info.F90")

   sial_input = tcg.ExaTENSORcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="exatensor_auto_ccd_diagram_info_spinor.F90")

   sial_input = tcg.ExaTENSORcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCSD.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="exatensor_auto_ccsd_diagram_info_spinor.F90")

   sial_input = tcg.ExaTENSORcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCSDT.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="exatensor_auto_ccsdt_diagram_info_spinor.F90")

   sial_input = tcg.ExaTENSORcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCSDTQ.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="exatensor_auto_ccsdtq_diagram_info_spinor.F90")

   sial_input = tcg.ExaTENSORcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("CCSDTQP.1.fac.u.ormo.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="exatensor_auto_ccsdtqp_diagram_info_spinor.F90")

main()

