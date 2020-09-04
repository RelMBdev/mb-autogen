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

   def parse_contraction(self,input_string, verbose=[False, False]) :
      """
      Parses a definition of a binary contraction, breaking it down into the tensors, operators and any prefactors
      """
      import re

      # verbose_c controls printout for the parsinf of the contraction, and verbose_t for the indidual tensors 
      verbose_c = verbose[0]
      verbose_t = verbose[1]


      operator_regexp_definition = "(\+\=|\*\=|\*|\+|\/|\-)"
      tensor_regexp_definition   = "([a-zA-z0-9_\(\)\|\,]+)" 
      factor_regexp_definition   = "(-?\d\.)"
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

      if verbose_c :
         print("\nparsing tensor contraction input string:", input_string)

      contraction_b = contraction_b_re.match(input_string)
      contraction_bf = contraction_bf_re.match(input_string)

      if contraction_bf :
          if verbose_c :
             print("Parsing binary contraction with factor")

          self.A = t.tensor(self.spinorbital)
          self.B = t.tensor(self.spinorbital)
          self.C = t.tensor(self.spinorbital)

          tensor_C_string = contraction_bf.group(1)
          tensor_A_string = contraction_bf.group(3)
          tensor_B_string = contraction_bf.group(5)

          if verbose_c :
             print("C string:",tensor_C_string)
             print("A string:",tensor_A_string)
             print("B string:",tensor_B_string)

          self.operations.append(contraction_bf.group(2))
          self.operations.append(contraction_bf.group(4))
          self.operations.append(contraction_bf.group(6))

          self.factor  = float(contraction_bf.group(7))
          if verbose_c : 
             print("Operations found :",self.operations)
             print("Factor     found :",self.factor)

          self.A.parse_tensor(tensor_A_string, verbose=verbose_t)
          self.B.parse_tensor(tensor_B_string, verbose=verbose_t)
          self.C.parse_tensor(tensor_C_string, verbose=verbose_t)

          if verbose_c :
             self.print_contraction_information()

      elif contraction_b : 
          if verbose_c :
             print("Parsing binary contraction without factor")

          self.A = t.tensor(self.spinorbital)
          self.B = t.tensor(self.spinorbital)
          self.C = t.tensor(self.spinorbital)

          tensor_C_string = contraction_b.group(1)
          tensor_A_string = contraction_b.group(3)
          tensor_B_string = contraction_b.group(5)

          self.operations.append(contraction_b.group(2))
          self.operations.append(contraction_b.group(4))

          if verbose_c :
             print("Operations found :",self.operations,len(self.operations))

          self.A.parse_tensor(tensor_A_string, verbose=verbose_t)
          self.B.parse_tensor(tensor_B_string, verbose=verbose_t)
          self.C.parse_tensor(tensor_C_string, verbose=verbose_t)

          if verbose_c :
             self.print_contraction_information()

      else :
         print("   Failed to indentify a tensor contraction")
         raise ValueError

   def print_contraction_information(self) :
      print("   Printing tensor contraction information")
      print("      spin-orbital/spinor mode : ",self.spinorbital)
      print("      tensor information")
      print("         C :")
      self.C.print_tensor_information()
      print("         A :")
      self.A.print_tensor_information()
      print("         B :")
      self.B.print_tensor_information()

   def process_contraction(self,split_groups=[False,False,False],replace_bar=[False,False,False],remove_lhs_bar=False,verbose=[False, False]) :

      # verbose_c controls printout for the parsinf of the contraction, and verbose_t for the indidual tensors 
      verbose_c = verbose[0]
      verbose_t = verbose[1]

      split_groups_C = split_groups[0]
      split_groups_A = split_groups[1]
      split_groups_B = split_groups[2]
      split_groups = split_groups_C and split_groups_A and split_groups_B

      replace_bar_C  = replace_bar[0]
      replace_bar_A  = replace_bar[1]
      replace_bar_B  = replace_bar[2]
      replace_bar = replace_bar_C and replace_bar_A and replace_bar_B

      common_AB = self.find_common_groups(self.A,self.B)
      common_AC = self.find_common_groups(self.A,self.C)
      common_BC = self.find_common_groups(self.B,self.C)
      if verbose_c :
         print("Common groups to tensors A and B",common_AB)
         print("Common groups to tensors A and C",common_AC)
         print("Common groups to tensors B and C",common_BC)

      tA = self.A.set_tensor_representation(split_groups=split_groups_A,replace_bar=replace_bar_A,verbose=verbose_t)
      tB = self.B.set_tensor_representation(split_groups=split_groups_B,replace_bar=replace_bar_B,verbose=verbose_t)
      tC = self.C.set_tensor_representation(split_groups=split_groups_C,replace_bar=replace_bar_C,verbose=verbose_t,remove_bar=remove_lhs_bar)
      if verbose_c :
         print("Tensor A : ",tA)
         print("Tensor B : ",tB)
         print("Tensor C : ",tC)

      expression = tC + self.operations[0] + tA + self.operations[1] + tB 
      if len(self.operations) > 2 :
         expression = expression + self.operations[2] + str(self.factor)

      if split_groups and replace_bar :
         factor_from_split_groups = 1
         if common_AB not in common_AC and common_AB not in common_BC :
            f1 = 1
            fact= 1
            for g in common_AB :
               f1 *= len(g)
            if verbose_c :
               print("   Number of repeated groups in left-hand side of contraction : ",f1)

            for i in range(1,f1+1): 
               fact = fact * i 
            factor_from_split_groups = (1.0/fact)
            if verbose_c :
               print("   New factor for tensor contraction : ",factor_from_split_groups)

         expression = tC + self.operations[0] + tA + self.operations[1] + tB 
         if len(self.operations) is 2 :
            if factor_from_split_groups != 1 :
               expression = expression + "*" + str(self.factor*factor_from_split_groups)
         elif len(self.operations) is 3 :
            expression = expression + self.operations[2] + str(self.factor*factor_from_split_groups)

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
