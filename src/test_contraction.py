#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import contraction as c
import tensor as t

def main():

   print("\nSplitting all groups, replacing all bars")

   c1 = c.binary_contraction()
   string = "Z49(e1b|m1b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1b,l1b)"
   print("\ninput  : ",string)
   c1.parse_contraction(string, verbose=[False,False])
   c1.process_contraction(split_groups=[True,True,True],replace_bar=[True,True,True],verbose=[False,False])
   expr = c1.get_expression()
   print("output : ",expr)

   c2 = c.binary_contraction()
   string = "Z48(|)+=S44(d1bd2b|l1bl2b)*H24(l1bl2b|d1bd2b)*-1."
   print("\ninput  : ",string)
   c2.parse_contraction(string, verbose=[False,False])
   c2.process_contraction(split_groups=[True,True,True],replace_bar=[True,True,True], verbose=[False,False])
   expr = c2.get_expression()
   print("output : ",expr)

   c8 = c.binary_contraction()
   string = "Z448(|)+=S44(d1bd2bd3b|l1bl2b)*H24(l1bl2b|d1bd2bd3b)*-0.25"
   print("\ninput  : ",string)
   c8.parse_contraction(string, verbose=[False,False])
   c8.process_contraction(split_groups=[True,True,True],replace_bar=[True,True,True], verbose=[False,False])
   expr = c8.get_expression()
   print("output : ",expr)

   c3 = c.binary_contraction()
   string = "Z56_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1."
   print("\ninput  : ",string)
   c3.parse_contraction(string, verbose=[False,False])
   c3.process_contraction(split_groups=[True,True,True],replace_bar=[True,True,True], verbose=[False,False])
   expr = c3.get_expression()
   print("output : ",expr)

   print("\nSplitting groups and replacing bars only on selected elements")

   c4 = c.binary_contraction()
   string = "Z48(|)+=S44(d1bd2b|l1bl2b)*H24(l1bl2b|d1bd2b)"
   print("\ninput  : ",string)
   c4.parse_contraction(string, verbose=[False,False])
   c4.process_contraction(split_groups=[True,True,True],replace_bar=[False,True,True], verbose=[False,False])
   expr = c4.get_expression()
   print("output : ",expr)

   c5 = c.binary_contraction(expr="Z56_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.")
   string = c5.get_expression()
   print("\ninput : ",string)
   c5.parse_contraction(verbose=[False,False])
   c5.process_contraction(split_groups=[True,True,True],replace_bar=[True,True,False], verbose=[False,False])
   expr = c5.get_expression()
   print("output : ",expr)

   print("\nRemoving bar on left-hand side tensor")

   c7 = c.binary_contraction()
   string = "Z48(|)+=S44(d1bd2b|l1bl2b)*H24(l1bl2b|d1bd2b)"
   print("\ninput  : ",string)
   c7.set_expression(string)
   c7.parse_contraction(verbose=[False,False])
   c7.process_contraction(split_groups=[True,True,True],replace_bar=[False,True,True], remove_lhs_bar=True,verbose=[False,False])
   expr = c7.get_expression()
   print("output : ",expr)
   tA = c7.get_tensor("A")
   print ("tensor A",tA)
   print ("       name    : ",tA.get_tensor_name())
   print ("       rank    : ",tA.get_tensor_rank())
   print ("       groups  : ",tA.get_tensor_groups())
   print ("       indexes : ",tA.get_tensor_indexes())
   print ("       separat : ",tA.get_tensor_separatrices())
   print ("       repr    : ",tA.get_tensor_representation())


main()

