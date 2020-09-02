#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import tensor as t

def main():

   print("\ninput : ",None)
   t0 = t.tensor()
   print("output : ")
   t0.print_tensor(split_groups=True)

   t1 = t.tensor()
   string = "S44(d1bd2b|l1bl2b)"
   print("\ninput  : ",string)
   t1.parse_tensor(string)
   print("output : ")
   t1.print_tensor(split_groups=True)

   t2 = t.tensor()
   string = "S46(d1ad1b|m1b,l1a)"
   print("\ninput : ",string)
   t2.parse_tensor(string)
   print("output : ")
   t2.print_tensor()

   t3 = t.tensor()
   string = "S99(|)"
   print("\ninput : ",string)
   t3.parse_tensor(string)
   print("output : ")
   t3.print_tensor()

   t4 = t.tensor(spinorbital=True)
   string = "S14(e1,d1|l1l2)"
   print("\ninput : ",string)
   t4.parse_tensor(string)
   print("output : ")
   t4.print_tensor(remove_bar=True)

   t5 = t.tensor()
   string = "S46(d1ad1bd2ad2b|m1b,l1an1a,i1b)"
   print("\ninput : ",string)
   t5.parse_tensor(string)
   print("output : ")
   t5.print_tensor(split_groups=True,remove_bar=True)

main()

