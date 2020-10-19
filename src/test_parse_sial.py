#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import parse_sial as p

def main():

   print("\nSplitting all groups, replacing all bars")

   ps1 = p.sial()
   ps1.read_input("CCSD.1.fac.u.ormo.txt")
   ps1.parse_input(verbose=True)

main()

