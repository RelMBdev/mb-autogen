#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import contraction as c

def main():

   c1 = c.binary_contraction()
   string = "Z49(e1b|m1b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1b,l1b)"
   print("\ninput  : ",string)
   c1.parse_contraction(string, verbose=True)
   c1.process_contraction(split_groups=True,remove_bar=True,verbose=True)
   print("output : ")
#  c1.print_contraction()


main()

