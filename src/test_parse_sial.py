#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import parse_sial as p

def main():

   print("\nSplitting all groups, replacing all bars")

   ps1 = p.sial()
   ps1.read_file("CCSD.1.fac.u.ormo.txt")
   ps1.parse()
   ps1.print_

parse_input
   c7 = c.binary_contraction()
   string = "Z48(|)+=S44(d1bd2b|l1bl2b)*H24(l1bl2b|d1bd2b)"
   print("\ninput  : ",string)
   c7.parse_contraction(string, verbose=[False,False])
   expr = c7.process_contraction(split_groups=[True,True,True],replace_bar=[False,True,True], remove_lhs_bar=True,verbose=[False,False])
   print("output : ",expr)



main()

