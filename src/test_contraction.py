#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import contraction as c

def main():

   c1 = c.binary_contraction()
   string = "Z49(e1b|m1b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1b,l1b)"
   print("\ninput  : ",string)
   c1.parse_contraction(string, verbose=True)
   expr = c1.process_contraction(split_groups=True,remove_bar=True,verbose=True)
   print("output : ",expr)
#  c1.print_contraction()

   c2 = c.binary_contraction()
   string = "Z48(|)+=S44(d1bd2b|l1bl2b)*H24(l1bl2b|d1bd2b)"
   print("\ninput  : ",string)
   c2.parse_contraction(string, verbose=True)
   expr = c2.process_contraction(split_groups=True,remove_bar=True,verbose=True)
   print("output : ",expr)

   c3 = c.binary_contraction()
   string = "Z56_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1."
   print("\ninput  : ",string)
   c3.parse_contraction(string, verbose=True)
   expr = c3.process_contraction(split_groups=True,remove_bar=True,verbose=True)
   print("output : ",expr)
main()

