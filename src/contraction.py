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

   def __init__ (self, spinorbital=False, expr=None) :
      self.spinorbital      = spinorbital 
      self.A                = None
      self.B                = None
      self.C                = None
      self.operations       = []
      self.factor           = 1.0
      self.processed_expr   = None
      self.original_expr    = expr

   def get_tensor(self,T) :
      if T is "A" :
         return self.A
      elif T is "B" : 
         return self.B
      elif T is "C" : 
         return self.C
      else :
         print("   Unknown tensor from contraction expression")
         raise ValueError

   def set_expression(self, input_string) :
      self.original_expr = input_string

   def get_expression(self) :
      if self.processed_expr is not None:
         return self.processed_expr
      elif self.original_expr is not None :
         return self.original_expr
      else :
         print("   Unknown tensor contraction expression")
         raise ValueError

   def parse_contraction(self, input_string=None, verbose=[False, False]) :
      """
      Parses a definition of a binary contraction, breaking it down into the tensors, operators and any prefactors
      """
      import re

      if input_string is None and self.original_expr is not None:
         input_string = self.original_expr
         
      # verbose_c controls printout for the parsinf of the contraction, and verbose_t for the indidual tensors 
      verbose_c = verbose[0]
      verbose_t = verbose[1]


      operator_regexp_definition = "(\+\=|\*\=|\*|\+|\/|\-)"
      tensor_regexp_definition   = "([a-zA-z0-9_\(\)\|\,]+)" 
      factor_regexp_definition   = "(-?\d+\.\d*)"

# definition of binary contractions
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

# definition of unary contractions, special case of the binary contractions above 
      contraction_regexp_definition_u = tensor_regexp_definition \
                                      + operator_regexp_definition \
                                      + tensor_regexp_definition 

      contraction_regexp_definition_uf = contraction_regexp_definition_u \
                                       + operator_regexp_definition \
                                       + factor_regexp_definition 

      contraction_u_re = re.compile (r''+ contraction_regexp_definition_u+'', re.IGNORECASE)
      contraction_uf_re = re.compile (r''+ contraction_regexp_definition_uf+'', re.IGNORECASE)

      if verbose_c :
         print("\nparsing tensor contraction input string:", input_string)

      contraction_b = contraction_b_re.match(input_string)
      contraction_bf = contraction_bf_re.match(input_string)

      contraction_u = contraction_u_re.match(input_string)
      contraction_uf = contraction_uf_re.match(input_string)

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
             self.print_info()

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
             self.print_info()

      elif contraction_uf :
          if verbose_c :
             print("Parsing unary contraction with factor")

          self.A = t.tensor(self.spinorbital)
          self.C = t.tensor(self.spinorbital)

          tensor_C_string = contraction_uf.group(1)
          tensor_A_string = contraction_uf.group(3)

          if verbose_c :
             print("C string:",tensor_C_string)
             print("A string:",tensor_A_string)

          self.operations.append(contraction_uf.group(2))
          self.operations.append(contraction_uf.group(4))

          self.factor  = float(contraction_uf.group(5))
          if verbose_c :
             print("Operations found :",self.operations)
             print("Factor     found :",self.factor)

          self.A.parse_tensor(tensor_A_string, verbose=verbose_t)
          self.C.parse_tensor(tensor_C_string, verbose=verbose_t)

          if verbose_c :
             self.print_info()

      elif contraction_u :
          if verbose_c :
             print("Parsing unary contraction without factor")

          self.A = t.tensor(self.spinorbital)
          self.C = t.tensor(self.spinorbital)

          tensor_C_string = contraction_u.group(1)
          tensor_A_string = contraction_u.group(3)

          self.operations.append(contraction_u.group(2))

          if verbose_c :
             print("Operations found :",self.operations,len(self.operations))

          self.A.parse_tensor(tensor_A_string, verbose=verbose_t)
          self.C.parse_tensor(tensor_C_string, verbose=verbose_t)

          if verbose_c :
             self.print_info()

      else :
         print("   Failed to indentify a tensor contraction")
         raise ValueError

   def print_info(self) :
      print("   Printing tensor contraction information")
      print("      spin-orbital/spinor mode : ",self.spinorbital)
      print("      original expression      : ",self.original_expr)
      print("      processed expression     : ",self.processed_expr)
      print("      tensor information")
      print("         C :")
      self.C.print_info()
      print("         A :")
      self.A.print_info()
      if self.B is not None:
         print("         B :")
         self.B.print_info()

   def print_processed_contraction(self):
      if self.processed_expr is not None:
         print("Processed expression: ",self.processed_expr)
      else :
         print("Binary/unary contraction has not been processed")
 
   def process_contraction(self,split_groups=[False,False,False],replace_bar=[False,False,False],remove_lhs_bar=False,verbose=[False, False]) :

      # verbose_c controls printout for the parsinf of the contraction, and verbose_t for the indidual tensors 
      verbose_c = verbose[0]
      verbose_t = verbose[1]

      split_groups_C = split_groups[0]
      split_groups_A = split_groups[1]
      split_groups_B = split_groups[2]

      split_groups_lhs = split_groups_C 
      split_groups_rhs = split_groups_A and split_groups_B
      split_groups = split_groups_lhs and split_groups_rhs

      replace_bar_C  = replace_bar[0]
      replace_bar_A  = replace_bar[1]
      replace_bar_B  = replace_bar[2]

      replace_bar_rhs = replace_bar_C 
      replace_bar_lhs = replace_bar_A and replace_bar_B
      replace_bar = replace_bar_lhs and replace_bar_rhs

      common_AC = self.find_common_groups(self.A,self.C)
      if verbose_c :
         print("Common groups to tensors A and C",common_AC)
      self.A.set_tensor_representation(split_groups=split_groups_A,replace_bar=replace_bar_A,verbose=verbose_t)
      self.C.set_tensor_representation(split_groups=split_groups_C,replace_bar=replace_bar_C,verbose=verbose_t,remove_bar=remove_lhs_bar)

      tA = self.A.get_tensor_representation()
      tC = self.C.get_tensor_representation()

      if self.B is not None :
         common_AB = self.find_common_groups(self.A,self.B)
         common_BC = self.find_common_groups(self.B,self.C)
         if verbose_c :
            print("Common groups to tensors A and B",common_AB)
            print("Common groups to tensors B and C",common_BC)

         self.B.set_tensor_representation(split_groups=split_groups_B,replace_bar=replace_bar_B,verbose=verbose_t)
         tB = self.B.get_tensor_representation()

      if verbose_c :
         print("Tensor A : ",tA)
         if self.B is not None :
            print("Tensor B : ",tB)
         print("Tensor C : ",tC)

      if self.B is None :
         expression = tC + self.operations[0] + tA 
         if len(self.operations) > 1 :
            expression = expression + self.operations[1] + str(self.factor)

      else :
         expression = tC + self.operations[0] + tA + self.operations[1] + tB 
         if len(self.operations) > 2 :
            expression = expression + self.operations[2] + str(self.factor)

         # here we should not add a prefactor for a group twice
#        if split_groups and replace_bar :
         if split_groups_rhs and replace_bar_rhs :
            factor_from_split_groups = 1
            if common_AB not in common_AC and common_AB not in common_BC :
            # calculating new prefactor when there are common groups in the binary contraction : 
            # 1. for each repeating group, we set as prefactor (1/(n!)), with n the number of indices in a group
            # 2. the final prefactor is the product of the prefactors in #1 
               for g in common_AB :
                  f1 = len(g)
                  if verbose_c :
                     print("   group : ",g,", Number of repetitions in RHS of contraction : ",f1)
                  fact = 1
                  for i in range(1,f1+1): 
                     fact = fact * i 
                  factor_from_split_groups *= (1.0/fact)
               if verbose_c :
                  print("   Additional factor for tensor contraction : ",factor_from_split_groups)
            self.factor = self.round_value(self.factor*factor_from_split_groups,20)
         
            expression = tC + self.operations[0] + tA + self.operations[1] + tB 
            if len(self.operations) is 2 :
               if factor_from_split_groups != 1 :
                  expression = expression + "*" + str(self.factor)
            elif len(self.operations) is 3 :
               expression = expression + self.operations[2] + str(self.factor)

      self.processed_expr = expression
      
   def find_common_groups(self, A, B):
      gA = A.get_tensor_groups()
      gB = B.get_tensor_groups()

      common_groups = []

      for i in gA :
        for j in gB :
           if i == j : 
              common_groups.append(i)

      return common_groups

   def round_value(self, value, digits) :
      factor = 10.0 ** digits
      return round(value * factor) / factor

   def print_contraction(self) :
      pass
