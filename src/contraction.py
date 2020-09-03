#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import tensor as t 
###############################################################################
#
# contraction class
#
class binary_contraction: 
   """
   binary_contraction class : keeps information on the definition of a binary tensor contraction
   C = A*B
   """

   def __init__ (self, spinorbital=False) :
      self.spinorbital      = spinorbital 
      self.A                = None
      self.B                = None
      self.C                = None
      self.operations       = []
      self.factor           = 1.0

   def parse_contraction(self,input_string, verbose=False):
      import re

      operator_regexp_definition = "(\+\=|\*\=|\*|\+|\/|\-)"
#     tensor_regexp_definition   = "(.+)" 
      tensor_regexp_definition   = "([a-zA-z0-9_\(\)\|\,]+)" 
      factor_regexp_definition   = "(-?\d\.)"
#     contraction_regexp_definition = "(.+)\+\=(.+)\*(.+)\*?([0-9.-+])?"
#     contraction_regexp_definition = "(.*)\+\=(.+)\*(.+)"
      contraction_regexp_definition_b = tensor_regexp_definition \
                                      + operator_regexp_definition \
                                      + tensor_regexp_definition \
                                      + operator_regexp_definition \
                                      + tensor_regexp_definition 

      contraction_regexp_definition_bf = contraction_regexp_definition_b \
                                       + operator_regexp_definition \
                                       + factor_regexp_definition 

      contraction_b_re = re.compile (r''+ contraction_regexp_definition_b+'', re.IGNORECASE)
      contraction_bf_re = re.compile (r''+ contraction_regexp_definition_bf+'', re.IGNORECASE)

      if (verbose) :
         print("\nparsing tensor contraction input string:", input_string)

      contraction_b = contraction_b_re.match(input_string)
      contraction_bf = contraction_bf_re.match(input_string)

      if contraction_bf :
          print("contraction_bf")
          self.A = t.tensor(self.spinorbital)
          self.B = t.tensor(self.spinorbital)
          self.C = t.tensor(self.spinorbital)

          tensor_C_string = contraction_bf.group(1)
          print("C string:",tensor_C_string)
          tensor_A_string = contraction_bf.group(3)
          print("A string:",tensor_A_string)
          tensor_B_string = contraction_bf.group(5)
          print("B string:",tensor_B_string)

          self.operations.append(contraction_bf.group(2))
          self.operations.append(contraction_bf.group(4))
          self.operations.append(contraction_bf.group(6))

          print(self.operations)
          self.factor  = float(contraction_bf.group(7))
          print(self.factor)

          self.A.parse_tensor(tensor_A_string)
          self.B.parse_tensor(tensor_B_string)
          self.C.parse_tensor(tensor_C_string)

          if verbose :
             self.print_contraction_information()

      elif contraction_b : 
          print("contraction_b")
          self.A = t.tensor(self.spinorbital)
          self.B = t.tensor(self.spinorbital)
          self.C = t.tensor(self.spinorbital)

          tensor_C_string = contraction_b.group(1)
          tensor_A_string = contraction_b.group(3)
          tensor_B_string = contraction_b.group(5)

          self.operations.append(contraction_b.group(2))
          self.operations.append(contraction_b.group(4))

          print(self.operations)
#         if contraction.group(4) :
#            self.factor  = contraction.group(4)

          self.A.parse_tensor(tensor_A_string) #, verbose=verbose)
          self.B.parse_tensor(tensor_B_string) #, verbose=verbose)
          self.C.parse_tensor(tensor_C_string) #, verbose=verbose)

          if verbose :
             self.print_contraction_information()

      else :
         print("   failed to indentify a tensor contraction")
         raise ValueError

   def print_contraction_information(self) :
      print("   printing tensor contraction information")
      print("      spin-orbital/spinor mode : ",self.spinorbital)
      print("      tensor information")
      print("         C :")
      self.C.print_tensor_information()
      print("         A :")
      self.A.print_tensor_information()
      print("         B :")
      self.B.print_tensor_information()

   def process_contraction(self,split_groups=False,remove_bar=False,verbose=False) :
      common_AB = self.find_common_groups(self.A,self.B)
      common_AC = self.find_common_groups(self.A,self.C)
      common_BC = self.find_common_groups(self.B,self.C)
      if verbose :
         print("Common groups to tensors A and B",common_AB)
         print("Common groups to tensors A and C",common_AC)
         print("Common groups to tensors B and C",common_BC)

      tA = self.A.set_tensor_representation(split_groups=split_groups,remove_bar=remove_bar,verbose=verbose)
      tB = self.B.set_tensor_representation(split_groups=split_groups,remove_bar=remove_bar,verbose=verbose)
      tC = self.C.set_tensor_representation(split_groups=split_groups,remove_bar=remove_bar,verbose=verbose)
      if verbose :
         print("Tensor A : ",tA)
         print("Tensor B : ",tB)
         print("Tensor C : ",tC)

      expression = tC + "+=" + tA + "*" + tB + "*" + str(self.factor)
      if split_groups and remove_bar :

         if common_AB not in common_AC and common_AB not in common_BC :
            f1 = 1
            fact= 1
            for g in common_AB :
               f1 *= len(g)
            print("factor: ",f1)

            for i in range(1,f1+1): 
               fact = fact * i 
            factor = 1.0/fact
            print("factor: ",factor)

            expression = tC + "+=" + tA + "*" + tB + "*" + str(self.factor * factor) 
         else :
            expression = tC + "+=" + tA + "*" + tB + "*" + str(self.factor)

      return expression
      
   def find_common_groups(self, A, B):
      gA = A.get_tensor_groups()
      gB = B.get_tensor_groups()

      common_groups = []

      for i in gA :
        for j in gB :
           if i == j : 
              common_groups.append(i)

      return common_groups

   def print_contraction(self) :
      pass
