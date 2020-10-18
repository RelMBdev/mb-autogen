#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

###############################################################################
#
# sial class 
#
import tensor as t
import contraction as c

class sial :
   """
   sial class : parses sial input into instruction and tensors 
   """

   def __init__ (self, spinorbital=False) :
      self.spinorbital      = spinorbital 
      self.input_lines      = []
      self.parsed_lines     = []

   def parse_sial_instruction(self,input_string, verbose=False):
      import re

      sial_marker_regexp_definition = "^\$SIAL"
      sial_instruction_regexp_definition = "([A-Z_]+)" 
      sial_comment_regexp_definition = "^\#.+$"
      sial_tensor_expression_regexp_definition = "(.+)"

      sial_instruction_regexp_definition = sial_marker_regexp_definition \
                                         + " " \
                                         + sial_instruction_regexp_definition \
                                         + "$"

      sial_instruction_tensor_regexp_definition = sial_instruction_regexp_definition \
                                         + " " \
                                         + sial_instruction_regexp_definition \
                                         + " " \
                                         + sial_tensor_expression_regexp_definition \
                                         + "$"

      sial_tensor_operation_expression_regexp_definition = "^" \
                                         + sial_tensor_expression_regexp_definition \
                                         + "$"
 
      sial_instruction_re = re.compile (r''+ sial_instruction_regexp_definition +'', re.IGNORECASE)
      sial_instruction_tensor_re = re.compile (r''+ sial_instruction_tensor_regexp_definition +'', re.IGNORECASE)
      sial_ignoreline_re = re.compile (r''+ sial_comment_regexp_definition +'', re.IGNORECASE)
      sial_tensor_operation_expression_re = re.compile (r''+ sial_tensor_operation_expression_regexp_definition +'', re.IGNORECASE)

      if verbose :
         print("\nparsing SIAL input string:", input_string)

      output = {}

      if sial_instruction_re.match(input_string):
         instruction = sial_instruction_re.match(input_string).group(1)
         tensor      = None
         output[instruction] = tensor

      else if sial_instruction_tensor_re.match(input_string):
         tensor = t.tensor()
         instruction = sial_ionstruction_tensor_re.match(input_string).group(1)
         tensor_string = sial_ionstruction_tensor_re.match(input_string).group(2)
         tensor.parse_tensor(tensor_string)
         # we parse the tensor expression, but defer from outputting it for now  
         # if we were to print, we'd 
         # parsed_string = tensor.print_tensor(split_groups=True,remove_bar=True,replace_bar=True)
         output[instruction] = tensor 

      else if sial_tensor_operation_expression_re.match(input_string):
         contr = c.binary_contraction()
         contr_string = sial_tensor_operation_expression_re.match(input_string).group(1)
         contr.parse_contraction(contr_string, verbose=[False,False])
         # parsed the contraction expression, but  defer from outputting it for now 
         # if we were to print, we'd 
         # expr = contr.process_contraction(split_groups=[True,True,True],replace_bar=[True,True,True], verbose=[False,False])
         # print("output : ",expr)
         if output[instruction] is None or output[instruction] is "" :
            output[instruction] = contraction 
         else :
            print("   failed to handle split line instruction")
            raise ValueError
 
      else if sial_ignoreline_re.match(input_string):
         pass 

      else :
         print("   failed to indentify valid input line")
         raise ValueError

      return [instruction, tensor]

   def read_input(self, file_name) :
      pass

   def parse_input(self) :
      pass

   def print_parsed_instruction(self, instruction_dict):
      pass
