#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import codegen_exatensor as tcg

def main():

   sial_input = tcg.ExaTENSORcodeGenerator()
   sial_input.read_sial("SIAL_CCSD.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="exatensor_auto_ccsd.F90")

   sial_input = tcg.ExaTENSORcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("SIAL_CCD.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="exatensor_auto_ccd_spinor.F90")

   sial_input = tcg.ExaTENSORcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("SIAL_CCSD.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="exatensor_auto_ccsd_spinor.F90")

   sial_input = tcg.ExaTENSORcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("SIAL_CCSDT.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="exatensor_auto_ccsdt_spinor.F90")

   sial_input = tcg.ExaTENSORcodeGenerator(spinorbital_out=True)
   sial_input.read_sial("SIAL_CCSDTQ.txt",verbose=True)
   sial_input.generate_code()
   sial_input.print_code(filename="exatensor_auto_ccsdtq_spinor.F90")

main()

