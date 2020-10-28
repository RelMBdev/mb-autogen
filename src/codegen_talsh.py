#!/usr/bin/env python
  
# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

###############################################################################
#
# code generation base class
#
import sial as p
#from .codegen_base import codeGenerator

#class TALSHcodeGenerator(codeGenerator):
class TALSHcodeGenerator:
   """
   codeGenerator class : defines generic directives for generating code from SIAL
   input, which has been processed into a list of dictionaries
   """

   def __init__ (self, spinorbital=False, spinor=True, available_H_classes = ["OO", "VV", "OV", "OOOO", "OOVV", "VOVO", "VOVV", "VVVV" ], available_S_classes = ["VO", "VVOO", "VVVOOO" ]) :
      self.spinor           = spinor     
      self.spinorbital      = spinorbital
      self.sial             = None
      # the one body and two body hamiltonian/integral classes available are listed, any other will require the tensor is e.g. complex conjugated when writing the code 
      self.available_H_classes = available_H_classes
      self.available_S_classes = available_S_classes

   def read_sial(self, file_name, verbose=False):
      self.sial = p.sial()
      self.sial.read(file_name)
      self.sial.parse(verbose=verbose)

   def print_info(self):
      pass 

   def generate_contraction(self, contraction):
      if contraction is not None:
         expression = contraction.get_expression()
         scaling = contraction.get_factor() 
         C = contraction.get_tensor("C")
         A = contraction.get_tensor("A")
         B = contraction.get_tensor("B")

         nameC = C.get_tensor_name()
         nameA = A.get_tensor_name()
         if B is not None:
            nameB = B.get_tensor_name()
            code = "ierr=talsh_tensor_contract(\""+expression+"\","+nameC+","+nameA+","+nameB
         else:
            code = "ierr=talsh_tensor_contract(\""+expression+"*K()\","+nameC+","+nameA+",one_tensor"

         if scaling is not 1:
            code = code+",scale=("+str(scaling)+"d0,0.0d0))"

         print("   "+code)
      else:
         print("   warning, tensors found as None in generate_contraction")

   def generate_create(self, tensor, initialize=True, initialize_to=None):
      if tensor is not None :
         nameT = tensor.get_tensor_name()
         a = "FIXME"
         b = "nvir"
         dimensions = "/("+a+","+a+")/" 
         if initialize_to is not None:
            code = "err=talsh_tensor_construct("+nameT+",C8,"+dimensions+",init_val="+initialize_to+")"
         else:
            code = "err=talsh_tensor_construct("+nameT+",C8,"+dimensions+")"

         print("   "+code)
      else:
         print("   warning, tensors found as None in generate_create")

   def generate_destroy(self, tensor):
      if tensor is not None :

         nameT = tensor.get_tensor_name()
         code = "err=talsh_tensor_destruct("+nameT+")"

         print("   "+code)
      else:
         print("   warning, tensors found as None in generate_destroy")


   def generate_variables_declaration(self):
      pass

   def print_code(self):
      instructions = self.sial.get_instructions()
      for i in instructions:
#        print(i)
         for k in i.keys() :
            if k == "BARRIER" :
               pass
            elif k == "FOR_WRITE" : 
               pass
            elif k == "READ_ARRAYS" : 
               pass
            elif k == "FOR_READ" : 
               pass
            elif k == "CONTRACTION" :
               c = i.get(k)
               self.generate_contraction(c)
            elif k == "DELETE_ARRAY" :
               t = i.get(k)
               self.generate_destroy(t)
            elif k == "CREATE_ARRAY":
               t = i.get(k)
               self.generate_create(t, initialize_to="ZERO")

