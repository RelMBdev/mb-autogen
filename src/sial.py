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

# instance[1].label = 'Z57_1'
# instance[1].object = 0x7f98f018ce50 (can inquire pure beta)
# instance[1].created_at  = 103
# instance[1].deleted_at  = 109
# instance[1].read_at     = None
# instance[1].written_at  = None 
# instance[1].assigned_at = [ [105, contraction.binary_contraction object at 0x7f98f0193350, {'H24': <tensor.tensor object at 0x7f98f0181050>}, {'S43': <tensor.tensor object at 0x7f98f018c750>}] ]
# instance[1].used_at     = [ [107, contraction.binary_contraction object at 0x7f9910050790, {'Z48': <tensor.tensor object at 0x7f98f01858d0>}, {'S43': <tensor.tensor object at 0x7f98f018c750>}] ]

class sial_tensor_instance :
   def __init__ (self) :
      self.name            = None  # string with the label for the tensor. is it a bit redundant as it can be obtained from  
      self.tensor_instance = None  # keeping the tensor instance lets one query its attributes
      self.tensor_memaddr  = None  # keeping the tensor instance lets one query its attributes
      self.created_at_line = None  # line we have a create  for a tensor with this name  
      self.deleted_at_line = None  # line we have a destroy for a tensor with this name
      self.read_at_line    = None
      self.written_at_line = None
      self.assigned_at     = [] # empty list indicates it's an input tensor; otherwise we store data in the following format
                                # [ [linenumber, instance x, instance y], [linenumber, instance z], ... ] meaning
                                #  list w/ 2 instances is a contraction, 
                                #  list w/1 instance is an addition/assignment vi
                                #  instance is an integer
      self.used_at       = []   # emply list indicates it's an output tensor; otherwise we store data in the following format 
                                # [[linenumber, instance z], ... ], in which instance is an integer 

   def get_name (self) :
      return self.name

   def set_tensor (self, tensor):
      self.tensor_instance = tensor
      self.tensor_memaddr = hex(id(self.tensor_instance))
      self.name = self.tensor_instance.get_tensor_name()

#     print("tensor, address, name",self.tensor_instance,self.tensor_memaddr,self.name)

   def get_tensor (self):
      return self.tensor_instance

   def get_tensor_address (self):
      return self.tensor_memaddr

   def is_pure_beta(self):
      return self.tensor_instance.is_pure_beta()

   def get_created_at(self):
      return self.created_at_line

   def get_deleted_at(self):
      return self.deleted_at_line

   def get_read_at(self):
      return self.read_at_line

   def get_written_at(self):
      return self.written_at_line

   def get_assigned_at(self):
      return self.assigned_at

   def get_used_at(self):
      return self.used_at

   def set_created_at(self, line=None):
      if self.created_at_line is not None:
         print("   trying to assign creation line more than once")
         raise ValueError

      if line is not None:
         self.created_at_line = line
      else :
         print("   invalid input at set_created_at")
         raise ValueError

   def set_deleted_at(self, line=None):
      if self.deleted_at_line is not None:    
         print("   trying to assign deletion line more than once")
         raise ValueError

      if line is not None:
         self.deleted_at = line
      else :
         print("   invalid input at set_deleted_at")
         raise ValueError

   def set_read_at(self, line=None):
      if self.read_at_line is not None:    
         print("   trying to assign read in line more than once")
         raise ValueError

      if line is not None:
         self.read_at_line = line
      else :
         print("   invalid input at set_read_at")
         raise ValueError

   def set_written_at(self, line=None):
      if self.written_at_line is not None:    
         print("   trying to assign written at line more than once")
         raise ValueError

      if line is not None:
         self.written_at_line = line
      else :
         print("   invalid input at set_written_at")
         raise ValueError

   def set_assigned_at(self, entry=None): 
      if entry is not None :
         if entry not in self.assigned_at : 
            self.assigned_at.append(entry)
      else:
        print("   invalid input at set_assign_at")
        raise ValueError

   def set_used_at(self, entry=None): 
      if entry is not None :
         if entry not in self.used_at : 
            self.used_at.append(entry)
      else:
        print("   invalid input at set_used_at")

   def print_info(self):
      print("Information for instance:")
      print("   tensor label       :",self.get_name())
      print("   associated object  :",self.get_tensor())
      print("   memory address     :",self.get_tensor_address())
      print("   created  at line   :",self.get_created_at())
      print("   deleted  at line   :",self.get_deleted_at())
      print("   written  at line   :",self.get_written_at())
      print("   read     at line   :",self.get_read_at())
      print("   assigned at line(s):")
      for (index, e) in enumerate(self.get_assigned_at()) :
         print(e)
      print("   used     at line(s):")
      for (index, e) in enumerate(self.get_used_at()) :
         print(e)

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
      self.active_labels = {}
      self.reuse_tensor_instances = True

      self.instances_all = []
      self.instances_kept = []
      self.instances_dropped = []

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
         print("\nparsing sial input string:", input_string)

      output = {}

      if sial_ignoreline_re.match(input_string):
         pass

      elif sial_instruction_tensor_re.match(input_string):
         tensor = t.tensor(spinorbital=self.spinorbital,spinorbital_out=self.spinorbital_out)
         instruction = sial_instruction_tensor_re.match(input_string).group(1)
         tensor_string = sial_instruction_tensor_re.match(input_string).group(2)
         #print("t.ins:",instruction,"t.str:",tensor_string)
         tensor.parse_tensor(tensor_string)
         label = tensor.get_tensor_name()

         if label in self.active_labels:
#           print("   active label, tensor",label,self.active_labels[label])
            output[instruction] = self.active_labels[label]
         else :
         # we parse the tensor expression, but defer from outputting it for now  
         # if we were to print, we'd 
         # parsed_string = tensor.print_tensor(split_groups=True,remove_bar=True,replace_bar=True)
            self.active_labels[label] = tensor
#           print(" + active label, tensor",label,self.active_labels[label])
            output[instruction] = tensor 

#        print(" ->active label, tensor, instruction:",label,self.active_labels[label],instruction)

         if instruction == "DELETE_ARRAY":
            self.active_labels.pop(label)

      elif sial_instruction_re.match(input_string):
         instruction = sial_instruction_re.match(input_string).group(1)
         tensor      = None
         output[instruction] = tensor

      elif sial_tensor_operation_expression_re.match(input_string):
         instruction = "CONTRACTION"
         contr_string = sial_tensor_operation_expression_re.match(input_string).group(1)
         contr = c.binary_contraction(expr=contr_string,spinorbital_out=self.spinorbital_out)
         #print("prior instruction",instruction,"t.op:",contr_string)
         contr.parse_contraction(contr_string, verbose=[False,False], active_labels=self.active_labels)
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

   def _register_all_events(self,verbose=True):
      self.events_all = []
      for (l,instruction) in enumerate(self.parsed_lines) :
         for k in instruction.keys() :
            value = instruction[k]
            retval = False
            if (isinstance(value,t.tensor)):
               event_t = value.get_event(l,instruction)
               print("registering event:",event_t)
               self.events_all.append(event_t)
            elif (isinstance(value,c.binary_contraction)):
               event_t = value.get_event(l,instruction)
               print("registering event:",event_t)
               self.events_all.append(event_t)
  
      if verbose :
         print("\nDone registering events. Now gather information on tensor instances")
      self._from_events_to_instances()

   def _from_events_to_instances(self):
      self.instances_all = []
      for index, event in enumerate(self.events_all):
         self._event_to_instances(event,self.instances_all)
          

   def validate(self, verbose=True):
      self.valid_lines = []

      self._register_all_events(verbose=verbose)

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

   def _event_to_instances(self,event,instances):
      for k in event.keys() :
         e = event[k][0]
         el = len(e)
#     print(k,e,el)
      event_name = k

      if (el < 3) :
         event_line = None
         event_type = None
         event_object = None
         event_object_address = None
      else:
         event_line = e[0]
         event_type = e[1]
         event_object = e[2]
         event_object_address = hex(id(event_object)) 


#     print("event_line  :_%d_"%(event_line))
#     print("event_type:_",event_type,"_")
#     print("event_object:",event_object)
#     print("event_objectid:",event_object_address)

      if instances == [] :
         print("bla 1")
         this_instance = sial_tensor_instance()
         instances.append(this_instance)

#        this_instance.print_info()
      else :

         if  event_type == 'CONTRACTION' :
            print ("fo5a")
            name = []
            obj  = []
            for d in e[3:] :
               for i in d:
                  name.append(i)
                  obj.append(d[i])
                  if i == event_name :
                     target_name = i
                     target_object = d[i]
                     target_object_addr = hex(id(d[i]))
            print(name,obj)

            lhs_name = e[3]
            assign_tensor = False
            if target_name is lhs_name :
               assign_tensor = True
         else :
            target_name = event_name
            target_object = event_object
            target_object_addr = hex(id(target_object))
            
         print("targeting name, object, obj address ",target_name,target_object,target_object_addr)
           
         for (index,this_instance) in enumerate(instances) :
#           print("index in instances:",index)
            address = this_instance.get_tensor_address()
            name    = this_instance.get_name()
             
            if (address == target_object_addr) and (name == target_name):
               print("instance memory, event memory",address,target_object_addr)
               print("memory is a match, index",index)
               break
            else :
               print("instance memory, event memory",address,target_object_addr)
               print("memory is not a match, index",index,len(instances))

         print("bla 2aa",index, this_instance)
         if index >= (len(instances)-1) :
            print("bla 2ab",index, this_instance)
            this_instance = sial_tensor_instance()
            instances.append(this_instance)

#        print("bla 2",index,instances)
#        this_instance.print_info()

#     print("bla 3")
#     this_instance.print_info()
# now we have the instance we have to deal with

      if event_type == 'CREATE_ARRAY' :
         print ("fo1")
         this_instance.set_created_at(event_line)
         this_instance.set_tensor(event_object)
      elif  event_type == 'DELETE_ARRAY' :
         print ("fo2")
         this_instance.set_deleted_at(event_line)
      elif  event_type == 'FOR_READ' :
         print ("fo3")
         this_instance.set_read_at(event_line)
      elif  event_type == 'FOR_WRITE' :
         print ("fo4")
         this_instance.set_written_at(event_line)
      elif  event_type == 'CONTRACTION' :
         print ("fo5b")
         assignment = [event_line, event_object ]
         if assign_tensor :
            this_instance.set_assigned_at(assignment)
         else :
            this_instance.set_used_at(assignment)

      print("bla 4")
      this_instance.print_info()
