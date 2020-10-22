#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import sial as s

def main():

   print("\nSplitting all groups, replacing all bars")

   sial_input = s.sial()
   sial_input.read("CCSD.1.fac.u.ormo.txt")
   sial_input.parse(verbose=True)

main()

