#!/usr/bin/env python
  
# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

###############################################################################
#
# code generation base class
#
import sial as p

class codeGenerator(object):
   """
   codeGenerator class : defines generic directives for generating code from SIAL
   input, which has been processed into a list of dictionaries
   """

   def __init__ (self, spinorbital=False) :
      self.spinorbital      = spinorbital
      self.sial             = None


   def read_sial(self, file_name, verbose=False):
      self.sial = p.sial()
      self.sial.read_input(file_name)
      self.sial.parse_input(verbose=verbose)

   def print_info(self):
      pass 

   def generate_contraction(self, contraction):
      pass

   def generate_create(self, telsor, initialize=True, intialize_to=None):
      pass

   def generate_destroy(self, tensor):
      pass

   def generate_variables_declaration(self):
      pass

   def print_contraction_code(self):
      instructions = self.sial.get_instructions()
      for i in instructions: 
         for k in i.keys() :
            if k is "CONTRACTION" :
               c = instruction.get(k)
               self.generate_contraction(c)
