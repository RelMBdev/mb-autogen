#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

###############################################################################
#
# sial class 
#
import tensor as t
import contraction as c
import sys, copy

class sial :
   """
   sial class : parses sial input into instruction and tensors 
   """

   def __init__ (self, spinorbital=False) :
      self.spinorbital      = spinorbital 
      self.input_lines      = None 
      self.parsed_lines     = None 
      self.input_tensors    = []
      self.output_tensors   = []
      self.interm_tensors   = []

   def parse_instruction(self,input_string, verbose=False):
      import re

      sial_marker_regexp_definition = "\$SIAL"
      sial_instruction_regexp_definition = "\s*([a-zA-Z_0-9]+)" 
      sial_comment_regexp_definition = "^\#.+$"
      sial_tensor_expression_regexp_definition = "\s*([a-zA-Z_0-9]+\(.+\))"
      sial_tensor_contraction_expression_regexp_definition = "(.+)"

      sial_instruction_regexp_definition = sial_marker_regexp_definition \
                                         + sial_instruction_regexp_definition 

      sial_instruction_tensor_regexp_definition = sial_instruction_regexp_definition \
                                         + sial_tensor_expression_regexp_definition 

      sial_tensor_operation_expression_regexp_definition = "^" \
                                         + sial_tensor_contraction_expression_regexp_definition 
 
      sial_instruction_re = re.compile (r''+ sial_instruction_regexp_definition +'', re.IGNORECASE)
      sial_instruction_tensor_re = re.compile (r''+ sial_instruction_tensor_regexp_definition +'', re.IGNORECASE)
      sial_ignoreline_re = re.compile (r''+ sial_comment_regexp_definition +'', re.IGNORECASE)
      sial_tensor_operation_expression_re = re.compile (r''+ sial_tensor_operation_expression_regexp_definition +'', re.IGNORECASE)

      if verbose :
         print("\nparsing SIAL input string:", input_string)

      output = {}

      if sial_ignoreline_re.match(input_string):
         pass

      elif sial_instruction_tensor_re.match(input_string):
         tensor = t.tensor()
         instruction = sial_instruction_tensor_re.match(input_string).group(1)
         tensor_string = sial_instruction_tensor_re.match(input_string).group(2)
         #print("t.ins:",instruction,"t.str:",tensor_string)
         tensor.parse_tensor(tensor_string)
         # we parse the tensor expression, but defer from outputting it for now  
         # if we were to print, we'd 
         # parsed_string = tensor.print_tensor(split_groups=True,remove_bar=True,replace_bar=True)
         output[instruction] = tensor 

      elif sial_instruction_re.match(input_string):
         instruction = sial_instruction_re.match(input_string).group(1)
         tensor      = None
         output[instruction] = tensor

      elif sial_tensor_operation_expression_re.match(input_string):
         instruction = "CONTRACTION"
         contr_string = sial_tensor_operation_expression_re.match(input_string).group(1)
         contr = c.binary_contraction(expr=contr_string)
         #print("prior instruction",instruction,"t.op:",contr_string)
         contr.parse_contraction(contr_string, verbose=[False,False])
         contr.process_contraction(split_groups=[True,True,True],replace_bar=[True,True,True], verbose=[False,False])
         output[instruction] = contr
 
      else :
         print("   failed to indentify valid input line")
         raise ValueError

      return output

   def read(self, file_name) :
      f = open(file_name,'r')
      self.input_lines = f.readlines()

   def parse(self, verbose=False) :
      self.parsed_lines = []
      for i, l in enumerate(self.input_lines) :
         instruction = self.parse_instruction(l.rstrip(), verbose=False)
         if instruction is not {}:
            if verbose:
               self.print_parsed_instruction(i,instruction)
            self.parsed_lines.append(instruction)

   def print_parsed_instruction(self, lineno, instruction_dict):
      print("** At line ",lineno,":")
      for k in instruction_dict.keys() :
         print("   SIAL operation:",k)
         val = instruction_dict.get(k)
         if val is not None:
            print("   Operand:",val)
            print("   Operand characteristics")
            val.print_info()
         
   def _classify_tensors(self):
      for i, l in enumerate(self.parsed_lines) :
         for k in l.keys() :
            if k is "CONTRACTION" : 
               val = l.get(k)
               A = val.get_tensor("A")
               B = val.get_tensor("B")
               C = val.get_tensor("C")

               if C not in self.output_tensors : 
                  self.output_tensors.append(C)

               if A not in self.input_tensors:
                  self.input_tensors.append(A)

               if B is not None and B not in self.input_tensors:
                  self.input_tensors.append(B)

      for t in self.output_tensors:
         if t in self.input_tensors:
            intm_t = self.input_tensors.pop(t)
            if intm_t not in  self.interm_tensors:
               self.interm_tensors.append(intm_t)

   def _print_tensor_classification(self):
      print("   Input tensors:")
      for i, t in enumerate(self.input_tensors):
         print("     ",i,":",t.get_tensor_name())

      print("   Output tensors:")
      for i, t in enumerate(self.output_tensors):
         print("     ",i,":",t.get_tensor_name())

      print("   Interm. tensors:")
      for i, t in enumerate(self.interm_tensors):
         print("     ",i,":",t.get_tensor_name())

   def print_info(self):
      self._classify_tensors()
      self._print_tensor_classification()
