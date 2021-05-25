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

class sial_tensor_instance :
   def __init__ (self) :
      self.name         = None
      self.tensor       = None
      self.is_pure_beta = False
      self.create_at    = None  # line we have a create  for a tensor with this name  
      self.destroy_at   = None  # line we have a destroy for a tensor with this name
      self.assign_at    = []    # empty list indicates it's an input tensor; otherwise we store data in the following format
                                # [ [linenumber, instance x, instance y], [linenumber, instance z], ... ] meaning
                                #  list w/ 2 instances is a contraction, 
                                #  list w/1 instance is an addition/assignment 
                                #  instance is an integer
      self.use_at       = []    # emply list indicates it's an output tensor; otherwise we store data in the following format 
                                # [[linenumber, instance z], ... ], in which instance is an integer 

   def set_name (self, name):
      self.name = name

   def get_name (self) :
      return self.name 

   def set_tensor (self, tensor):
      self.tensor = tensor

   def get_tensor (self):
      return self.tensor

   def set_pure_beta(self, is_pure_beta):
      self.is_pure_beta = is_pure_beta

   def get_pure_beta(self):
      return self.is_pure_beta

   def set_create(self, create_at_line=None):
      if create_at_line is not None:
         self.create_at = create_at_line
      else :
         print("   invalid input at set_create")
         raise ValueError

   def get_create(self):
      return self.create_at

   def set_destroy(self, destroy_at_line=None):
      if destroy_at_line is not None:
         self.destroy_at = destroy_at_line
      else :
         print("   invalid input at set_create")
         raise ValueError

   def get_destroy(self):
      return self.destroy_at

   def set_assign(self, assign_at_line=None, dependencies=None): 
      if assign_at_line is not None and dependencies is not None: 
         assign = [assign_at_line]
         assign = assign +  dependencies   
         self.assign_at.append(assign)
      else:
        print("   invalid input at set_create")
        raise ValueError

   def get_assign(self):
      return self.assign_at



class sial :
   """
   sial class : parses sial input into instruction and tensors 
   """

   def __init__ (self, spinorbital=False, spinorbital_out=False) :
      self.spinorbital      = spinorbital 
      self.spinorbital_out  = spinorbital_out 
      self.input_lines      = None 
      self.parsed_lines     = None 
      self.input_tensors    = {}
      self.output_tensors   = {}
      self.interm_tensors   = {}
      self.is_parsed        = False
      self.is_validated     = True

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
         contr = c.binary_contraction(expr=contr_string,spinorbital_out=self.spinorbital_out)
         #print("prior instruction",instruction,"t.op:",contr_string)
         contr.parse_contraction(contr_string, verbose=[False,False])
         contr.process_contraction(split_groups=[True,True,True],replace_bar=[True,True,True], verbose=[False,False])

         event_c = contr.get_event
         print("registering event:",event_c)

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
# if instruction is not valid, we don't add it to the list of parsed lines 
         if instruction != {}:
            if verbose:
               self.print_parsed_instruction(i,instruction)
            self.parsed_lines.append(instruction)
      self.is_parsed = True

      for i in enumerate(self.parsed_lines):
         self._register_events(instruction,i)

      self.is_parsed = True

   def _register_events(self,instruction,i):
#        event_c = self.contr.get_event
#        print("registering event:",event_c)
         pass


   def _check_validity(self,instruction, verbose=False) :
      if verbose :
         print("   ->  for instruction ",instruction)
         print("   ->                  ",instruction.items())
      retval = True
      if self.spinorbital_out :
         for k in instruction.keys() :
            value = instruction[k] 
            retval = False 
            if (isinstance(value,t.tensor)):
               if value.is_pure_beta():
                  if verbose :
                     print("      -> we have a tensor that is pure beta")
                  retval = True 
               else:
                  if verbose :
                     print("      -> we have a tensor that is not pure beta")
                  retval = False
            if (isinstance(value,c.binary_contraction)):
               if value.is_pure_beta:
                  if verbose :
                     print("      -> we have a contraction that is pure beta")
                  retval = True 
               else:
                  if verbose :
                     print("      -> we have a contraction that is not pure beta")
                  retval = False 
            break
      if verbose :
         print("      -> returning ",retval)

      return retval


   def validate(self, verbose=True):
      self.valid_lines = []

      for (l,instruction) in enumerate(self.parsed_lines) :
         if verbose:
            event_t = tensor.get_event(instruction)
            print("registering event:",event_t)

      for (l,instruction) in enumerate(self.parsed_lines) :
         if verbose:
            print("   validating instruction :",instruction)
         is_valid = self._check_validity(instruction)
         if is_valid :
            self.valid_lines.append(instruction)
            self._classify_contraction_tensors_by_name(instruction)
            if verbose:
               print("  -> instruction at line ",l," retained")
         else:
            if verbose:
               print("  -> instruction dropped")

      if verbose:
         total = len(self.parsed_lines)
         retained = len(self.valid_lines)
         print("After applying constraits, ",retained," lines retained out of ",total)
      self._sort_tensors_by_class()
      self.is_validated = True

   def get_instructions(self):
      return self.valid_lines

   def print_parsed_instruction(self, lineno, instruction_dict):
      print("** At line ",lineno,":")
      for k in instruction_dict.keys() :
         print("   SIAL operation:",k)
         val = instruction_dict.get(k)
         if val is not None:
            print("   Operand:",val)
            print("   Operand characteristics")
            val.print_info()
         
   def _classify_contraction_tensors_by_name(self, instruction):
      for k in instruction.keys() :
         if k is "CONTRACTION" : 
            val = instruction.get(k)
            A = val.get_tensor("A")
            B = val.get_tensor("B")
            C = val.get_tensor("C")

            lhs_names = self.output_tensors.keys()
            rhs_names = self.input_tensors.keys()
    
            nameC = C.get_tensor_name() 
            if nameC not in lhs_names :
               self.output_tensors[nameC] = [ C ]
            else:
               self.output_tensors[nameC].append(C)

            nameA = A.get_tensor_name() 
            if nameA not in rhs_names :
               self.input_tensors[nameA] = [ A ]
            else:
               self.input_tensors[nameA].append(A)

            if B is not None :
               nameB = B.get_tensor_name() 
               if nameB not in rhs_names :
                  self.input_tensors[nameB] = [ B ]
               else:
                  self.input_tensors[nameB].append(B)

   def _sort_tensors_by_class(self) :
      lhs_names = self.output_tensors.keys()
      rhs_names = self.input_tensors.keys()
      intm_names = self.interm_tensors.keys() 

      for l in lhs_names:
         val_lhs = self.output_tensors[l]
         if l in rhs_names :
            val_rhs = self.input_tensors[l]
            if l not in intm_names :
               self.interm_tensors[l] = val_lhs + val_rhs
            else :
               self.interm_tensors[l] = self.interm_tensors[l] + val_lhs
               self.interm_tensors[l] = self.interm_tensors[l] + val_rhs

      updated_intm_names = self.interm_tensors.keys()
      for l in updated_intm_names :
         self.output_tensors.pop(l)
         self.input_tensors.pop(l)

   def _print_tensor_classification(self):
      print("   Input tensors:")
      for i, k in enumerate(self.input_tensors.keys()) :
         val = self.input_tensors[k]
         for j, t in enumerate(val):
            print("     name(",i,"):",k,"    tensor(",j,"):",t,t.get_tensor_representation())

      print("   Output tensors:")
      for i, k in enumerate(self.output_tensors.keys()) :
         val = self.output_tensors[k]
         for j, t in enumerate(val):
            print("     name(",i,"):",k,"    tensor(",j,"):",t,t.get_tensor_representation())

      print("   Intermediate tensors:")
      for i, k in enumerate(self.interm_tensors.keys()) :
         val = self.interm_tensors[k]
         for j, t in enumerate(val):
            print("     name(",i,"):",k,"    tensor(",j,"):",t,t.get_tensor_representation())

   def get_input_tensor_names(self):
      return self.input_tensors.keys()

   def get_output_tensor_names(self):
      return self.output_tensors.keys()

   def get_interm_tensor_names(self):
      return self.interm_tensors.keys()

   def print_info(self):
      self._print_tensor_classification()
