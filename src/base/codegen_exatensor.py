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
class ExaTENSORcodeGenerator:
   """
   codeGenerator class : defines generic directives for generating code from SIAL
   input, which has been processed into a list of dictionaries
   """

   def __init__ (self, lang="Fortran", spinorbital=False, spinorbital_out=False, spinor=True, available_H_classes = None, available_S_classes = None):
      self.spinor           = spinor     
      self.spinorbital      = spinorbital
      self.spinorbital_out  = spinorbital_out
      self.sial             = None
      self.lang             = lang
      self.generated_code   = []

      # the one body and two body hamiltonian/integral classes available are listed 
      # any other will require the tensor is e.g. complex conjugated when writing the code 
      if available_H_classes is None :
         available_H_classes = ["OO", "VV", "OV", "OOOO", "OOVV", "VOVO", "VOVV", "VVVV" ]
      if available_S_classes is None :
         available_S_classes = ["VO", "VVOO", "VVVOOO" ]

      if self.lang is not "Fortran" :
         self.error_handler("Unsupported target language")

      self.available_H_classes = available_H_classes
      self.available_S_classes = available_S_classes

      # variables to handle printout
      self.indentation     = " "*4
      if self.lang is "Fortran" : 
         self.comment         = "!" + " "*3
      elif self.lang is "C" :
         self.comment         = "//" + " "*2
      self.return_var_name = "ierr"
      self.assign_var      = "="
      self.newline         = "\n"

      self.variables_args  = { 'nocc_id' : 'integer(INTD), intent(in)', \
                               'nvir_id' : 'integer(INTD), intent(in)', \
                               'nocc_root' : 'integer(INTL), intent(in)', \
                               'nvir_root' : 'integer(INTL), intent(in)', \
                               'dim_id_type' : 'integer(INTD), allocatable', \
                               'dim_root_type' : 'integer(INTL), allocatable', \
                               'exatensor_tensor' : 'type(tens_rcrsv_t), intent(inout)' }

      self.variables_local = { 'exatensor_tensor' : 'type(tens_rcrsv_t)' }

      self.call_name = { 'add'      : "exatns_tensor_add", \
                         'contract' : "exatns_tensor_contract", \
                         'create'   : "exatns_tensor_create", \
                         'init'     : "exatns_tensor_init", \
                         'destroy'  : "exatns_tensor_destroy" }

   def read_sial(self, file_name, verbose=False):
      self.sial = p.sial(spinorbital_out=self.spinorbital_out)
      self.sial.read(file_name)
      self.sial.parse(verbose=verbose)
      self.sial.validate(verbose=verbose)

   def print_info(self):
      pass 

   def generate_common_declarations(self):
      common_declarations = []

      common_declarations.append(self.newline)
      common_declarations.append(self.indentation+"use exatensor")
      common_declarations.append(self.indentation+"use, intrinsic:: ISO_C_BINDING")
      common_declarations.append(self.newline)
      common_declarations.append(self.indentation+"implicit none")
      common_declarations.append(self.newline)
      common_declarations.append(self.indentation+"complex(8), parameter :: ZERO=(0.D0,0.D0),ONE_HALF=(0.5D0,0.D0), &")
      common_declarations.append(self.indentation+"                         MINUS_ONE=(-1.D0,0.D0),ONE=(1.0D0,0.D0), MINUS_ONE_HALF=(-0.5D0,0.D0), &")
      common_declarations.append(self.indentation+"                         MINUS_ONE_QUARTER=(-0.25D0,0.D0), ONE_QUARTER=(0.25D0,0.D0), &")
      common_declarations.append(self.indentation+"                         MINUS_ONE_EIGHT=(-0.125D0,0.D0)")
      common_declarations.append(self.newline)
      common_declarations.append(self.indentation+"integer :: ierr")
      common_declarations.append(self.indentation+"type(tens_rcrsv_t) :: one_tensor")

      return common_declarations

   def generate_contraction(self, contraction):
      # here is where we need to check, for each element of the contraction, 
      # whether it conforms to one of the classes we have, and if not see if the complex conjugate does
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
#           code = self.call_name['contract']+"(\""+expression+"\","+nameC+","+nameA+","+nameB
            code = self.call_name['contract']+"(\""+expression+"\", &"+self.newline
            code = code + 2*self.indentation + nameC+","+nameA+","+nameB
         else:
#           code = self.call_name['add']+"(\""+expression+"\","+nameC+","+nameA
            code = self.call_name['contract']+"(\""+expression+"*K()"+"\", &"+self.newline
            code = code + 2*self.indentation +nameC+","+nameA+",one_tensor"
         if scaling is not 1:
            code = code+",prefactor=("+str(scaling)+"d0,0.0d0)"
         code = code + ")"
         code = self.indentation+self.return_var_name+self.assign_var+code
      else:
         self.error_handler("tensors found as None")
      return code

   def generate_create(self, tensor, initialize=True, initialize_to=None):
      if tensor is not None :
         nameT = tensor.get_tensor_name()
         varList = tensor.get_tensor_indexes_dimensions()
         varListSep = ","

         dimensions = "(/"
         rootvars   = "(/"
         for i, v in enumerate(varList):
            if i != (len(varList)-1) :
               dimensions  += v + "_id" + varListSep
               rootvars    += v + "_root" + varListSep
            else:
               dimensions  += v + "_id"
               rootvars    += v + "_root"
         dimensions += "/)"
         rootvars   += "/)"
         dim =  tensor.get_tensor_rank()
         spaces_declaration = self.indentation + self.newline \
                            + self.indentation + "allocate(tens_id("+str(dim)+"), tens_root("+str(dim)+"))" + self.newline \
                            + self.indentation + "tens_id   = " + dimensions + self.newline \
                            + self.indentation + "tens_root = " + rootvars   + self.newline  
         code = self.call_name['create']+"("+nameT+",\""+nameT+"\",tens_id, tens_root"
         code = code +",EXA_DATA_KIND_C8)"
         code = spaces_declaration + self.indentation+self.return_var_name+"="+code
         code = code + self.newline + self.indentation + "deallocate(tens_id,tens_root)"
         if initialize_to is not None:
            init_code = self.generate_init(tensor,value=initialize_to)
         code = code + self.newline + init_code
      else:
         self.error_handler("tensors found as None")
      return code

   def generate_init(self, tensor, value='ONE'):
      if tensor is not None :
         nameT = tensor.get_tensor_name()
         code = self.call_name['init']+"("+nameT+",\'"+value+"\')"

         code = self.indentation+self.return_var_name+self.assign_var+code
      else:
         self.error_handler("tensors found as None")
      return code

   def generate_destroy(self, tensor):
      if tensor is not None :
         nameT = tensor.get_tensor_name()
         code = self.call_name['destroy']+"("+nameT+")"

         code = self.indentation+self.return_var_name+self.assign_var+code
      else:
         self.error_handler("tensors found as None")
      return code

   def error_handler(self,message):
#     raise RuntimeError("   Warning : ",message).with_traceback(tracebackobj)
      raise RuntimeError("   Warning : "+message)

   def generate_variables_declaration(self):
      pass

   def generate_variables_args(self,varnames,tensor_classes):
      call_variable_block = []

      code = self.indentation+self.variables_args['nocc_id']+" :: nocc_id"
      call_variable_block.append(code)
      code = self.indentation+self.variables_args['nvir_id']+" :: nvir_id"
      call_variable_block.append(code)
      code = self.indentation+self.variables_args['nocc_root']+" :: nocc_root"
      call_variable_block.append(code)
      code = self.indentation+self.variables_args['nvir_root']+" :: nvir_root"
      call_variable_block.append(code)
      code = self.indentation+self.variables_args['dim_id_type']+" :: tens_id(:)"
      call_variable_block.append(code)
      code = self.indentation+self.variables_args['dim_root_type']+" :: tens_root(:)"
      call_variable_block.append(code)
      for v in varnames:
         code = self.indentation+self.variables_args['exatensor_tensor']+ " :: "+v \
              + self.indentation+self.comment+self.indentation+tensor_classes[v]
         call_variable_block.append(code)
      return call_variable_block

   def generate_variables_local(self,varnames,tensor_classes):
      local_variable_block = []
      for v in varnames:
         code = self.indentation+self.variables_local['exatensor_tensor']+ " :: "+v \
              + self.indentation+self.comment+self.indentation+tensor_classes[v]
         local_variable_block.append(code)
      return local_variable_block

   def generate_code(self, function_name="generic_exatensor_codegen_call", remove_Z_tensors=False):
      instructions = self.sial.get_instructions()

      classes_tensors = self.generate_tensor_class_dict(instructions) 

      local_tensors = list(self.sial.get_interm_tensor_names())
      lhs_tensors = list(self.sial.get_output_tensor_names())
      rhs_tensors = list(self.sial.get_input_tensor_names())
      call_tensors = rhs_tensors + lhs_tensors

      if remove_Z_tensors :
         for e in call_tensors:
            if e[0] == "Z":
               print("Removed tensor "+e+" from list of arguments")
               call_tensors.remove(e)
#              local_tensors.append(e)
#        for e in local_tensors:
#           if e[0] == "Z":
#              print("Removed tensor "+e+" from list of local variables")
#              local_tensors.remove(e)

      if function_name is not None :
         function_declaration = "subroutine "+function_name 
         function_declaration = function_declaration + "(nocc_id,nvir_id,nocc_root,nvir_root"
         for t in call_tensors:
            function_declaration = function_declaration \
                                 + ", &"+self.newline+self.indentation + t 
         function_declaration = function_declaration + ")"
         self.generated_code.append(function_declaration) 

         common_variables = self.generate_common_declarations()
         call_variables  = self.generate_variables_args(call_tensors,classes_tensors)
         local_variables = self.generate_variables_local(local_tensors,classes_tensors)

         self.generated_code.extend(common_variables)
         self.generated_code.extend(call_variables)
         self.generated_code.extend(local_variables)
         self.generated_code.append(self.newline)

      function_calls = self.generate_function_calls(instructions,local_tensors,remove_Z_tensors)
      self.generated_code.extend(function_calls)
      self.generated_code.append(self.newline)

      if function_name is not None :
         function_end = self.newline + self.indentation \
                      + "ierr=exatns_tensor_destroy(one_tensor)" \
                      + self.newline + "end subroutine "+function_name
      self.generated_code.append(function_end)

   def generate_tensor_class_dict(self, instructions):
      classes = {}
      for i in instructions:
         for k in i.keys() :
            if k == "CREATE_ARRAY":
               t = i.get(k)
               tname = t.get_tensor_name()
               tclass = t.get_tensor_class() 
               classes[tname] = tclass
      return classes

   def generate_function_calls(self,instructions,local_tensors,remove_Z_tensors=False):
      function_calls = []

      function_calls.append("! always define one_tensor to use in additions via calls to contraction")
      function_calls.append(self.indentation+"ierr=exatns_tensor_create(one_tensor,\"autokern_one_tensor\",EXA_DATA_KIND_C8)")
      function_calls.append(self.indentation+"ierr=exatns_tensor_init(one_tensor,ONE)")

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
               if remove_Z_tensors :
                  t = c.get_tensor("C")
                  expr = c.get_expression()
                  name = t.get_tensor_name()
                  if name[0] == "Z" and name not in local_tensors:  
                     print("Removed contraction "+expr+" from code generation")
                     break
               code = self.comment+"original expression: "+c.get_expression(expr="original")
               function_calls.append(code)
               code = self.generate_contraction(c)
               function_calls.append(code)
            elif k == "DELETE_ARRAY" :
               t = i.get(k)
               name = t.get_tensor_name()
               if name in local_tensors : 
                  code = self.generate_destroy(t)
                  function_calls.append(code)
            elif k == "CREATE_ARRAY":
               t = i.get(k)
               name = t.get_tensor_name()
               if name in local_tensors : 
                  code = self.generate_create(t, initialize_to="ZERO")
                  function_calls.append(code)
      return function_calls

   def print_code(self, filename=None):

      comment = self.comment+self.newline+self.comment+" Outputting ExaTensor-based "+self.lang+" code generated with :"
      comment = comment+self.newline+self.comment+"   Codegen, a toolset to process tensor contraction DSLs (SIAL etc)"
      comment = comment+self.newline+self.comment+"   Andre Gomes (CNRS UMR8523, Lille) and Dmitry Lyakh (OLCF/Oak Ridge, NVIDIA)"
      comment = comment+self.newline+self.comment

      if filename is not None :
         f  = open(filename,'w')
         print(comment, file=f)
         for l in self.generated_code:
            print(l, file=f)
      else :
         print(comment)
         for l in self.generated_code:
            print(l)
