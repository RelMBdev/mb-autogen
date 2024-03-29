#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

###############################################################################
#
# tensor class 
#
class tensor:
   """
   Tensor class : keeps information on the definition of a tensor

   The information kept follows the DiaGen output conventions, that is:

   1. The values of consecutive indices which are not separated by commas are assumed to form an ascending sequence (partially symmetrical storage).
   2. Index groups separated by commas run independently.
   3. Index ranges:
     m,n,l: full occupied orbital range (e.g., [0..99]);
     e,f,d: full virtual orbital range (e.g., [100..999]);
     I,J,K: a small (active) subrange of the occupied orbital range (e.g., [90..99]);
     A,B,C: a small (active) subrange of the virtual orbital range (e.g., [990..999]);
     i,j,k: the occupied orbital range excluding the active subrange (e.g., [0..89]);
     a,b,c: the virtual orbital range excluding the active subrange (e.g., [100..989]).
    4. Despite multiple forms in which S/L/C tensors may appear in contractions, the only unique elements of these tensors are those which have both upper and lower indices ordered in an ascending order (separately).

   """

   def __init__ (self, spinorbital=False, spinor=True, spinorbital_out=False, spinor_out=False, symmetric=False, cmplx=True) :
      self.spinor_in         = spinor
      self.spinorbital_in    = spinorbital
      self.spinor_out        = spinor_out
      self.spinorbital_out   = spinorbital_out
      self.symmetric         = symmetric 
      self.complex           = cmplx 
      self.name              = "T00"
      self.rank              = 1
      self.varnames          = {"O" : "nocc", "V" : "nvir", "Oa" : "nocc_active", "Va" : "nvir_active", "Oi" : "nocc_inactive", "Vi" : "nvir_inactive" }
#     variables to store the values that have been parsed for the first time, useful for consistency checks ? 
#     concatenating the same index of indexes and spin yields the final index as given by e.g. a SIAL statement 
#     the spin variables can also be used to create variable names, concatenating a values 
      self._o_indexes        = []    # e.g.: ["m1b","l1a",...], list of the strings 
      self._o_spin           = []    # e.g.: ["b","a",...], list of the strings containing the alpha/beta label
                                     # can serve for labeling kramers pairs as well 
      self._o_groups         = []    # e.g.: [[1,2,3],[4,5],[6]] so lists containing the indexes which make up the groups. 
      self._o_separatrices   = []    # e.g.: ["|", "," ] so a ordered list of symbols separating groups. always 1 element less than self.groups
      self._o_factor         = 1.0
      self._o_arglist        = ""    # string representing the tensor, of the form: name(indexes/groups and separatrices)
      self._o_representation = ""    # string representing the tensor, of the form: name(indexes/groups and separatrices)
      self._o_indexes_class  = []    # class of each of the indexes of the tensor (V, O etc)
      self._o_saved          = False 
#     variables to keep the current 
#     concatenating the same index of indexes and spin yields the final index as given by e.g. a SIAL statement 
      self.indexes           = []    # e.g.: ["m1","l1",...], list of the strings 
      self.spin              = []    # e.g.: ["b","a",...], list of the strings containing the alpha/beta label, can serve for kramers pairs as well  
      self.groups            = []    # e.g.: [[1,2,3],[4,5],[6]] so lists containing the indexes which make up the groups. 
      self.separatrices      = []    # e.g.: ["|", "," ] so a ordered list of symbols separating groups. always 1 element less than self.groups
#     depending on whether the tensor is symmetric or antisymmetric, self.factor will change sign accordingly, if indices are interchanged 
      self.factor            = 1.0
      self.arglist           = ""    # string representing the tensor, of the form: name(indexes/groups and separatrices)
      self.representation    = ""    # string representing the tensor, of the form: name(indexes/groups and separatrices)
      self.indexes_class     = []    # class of each of the indexes of the tensor (V, O etc)
      self.already_parsed    = False


   def get_event(self, line, event) :

      T_name = self.get_tensor_name()
      T_value = [ ]
      for each in event.keys() :
         T_value.append([line, each,event[each]])
      T_key   = T_name

      return { T_key : T_value } 

   def set_tensor_indexes_class(self):
      for i in self.indexes:
         if i[0] == "m" or i[0] == "n" or i[0] == "l" :
            self.indexes_class.append("O")
         elif i[0] == "e" or i[0] == "f" or i[0] == "d" :
            self.indexes_class.append("V")
         elif i[0] == "I" or i[0] == "J" or i[0] == "K" :
            self.indexes_class.append("Oa")
         elif i[0] == "A" or i[0] == "B" or i[0] == "C" :
            self.indexes_class.append("Va")
         elif i[0] == "i" or i[0] == "j" or i[0] == "k" :
            self.indexes_class.append("Oi")
         elif i[0] == "a" or i[0] == "b" or i[0] == "c" :
            self.indexes_class.append("Vi")

   def set_tensor_indexes_dimensions(self) :
      pass

   def get_tensor_indexes_dimensions(self) :
      t = [] 
      for i in self.indexes_class: 
         for k in self.varnames.keys(): 
            val = self.varnames[k]
            if (k == i) :
               t.append(val)
      
      return t

   def get_tensor_indexes_class(self):
      return self.indexes_class

   def get_tensor_class(self):
      if self.indexes_class == [] : # this is a unit tensor, since it has no indices
         return "UnitTensor"
      else:
         tensor_class = ""
         for c in self.indexes_class :
            tensor_class += c 
         return tensor_class

   def get_transposed_tensor_class(self):
      if self.indexes_class == [] : # this is a unit tensor, since it has no indices
         return "UnitTensor"
      else:
         tensor_class = ""
         for c in reversed(self.indexes_class) :
            tensor_class += c
         return tensor_class


   def get_indexes_class(self):
      return self.indexes_class

   def exchange_indexes(self, index_pairs=None):
      if index_pairs is None:
         print("warning: requested index exchange but no index given")

   def conj_transpose(self):
      pass
#     if self.complex = True:
#        pass
#     else:
#        pass

   def transpose(self):
      pass

   def _save_tensor_information(self):
      if not self._o_saved :
         self._o_indexes        = self.indexes
         self._o_spin           = self.spin
         self._o_groups         = self.groups
         self._o_separatrices   = self.separatrices
         self._o_factor         = self.factor
         self._o_arglist        = self.arglist
         self._o_representation = self.representation
         self._o_indexes_class  = self.indexes_class
         self._o_saved = True

   def _reset_tensor_information(self):
      self.indexes           = []    
      self.spin              = []    
      self.groups            = []    
      self.separatrices      = []    
      self.factor            = 1.0
      self.arglist           = "" 
      self.representation    = ""   
      self.indexes_class     = []   



   def parse_tensor(self,input_string, verbose=False):
      if self.already_parsed :
         print (">>>> Warning, parsing previously parsed tensor <<<\n Original state")
         self.print_info()
         print (" Resetting information")
         self._reset_tensor_information()
         self.print_info()

      self._parse_tensor(input_string, verbose)
      if self.already_parsed :
         print (" New state")
         self.print_info()
      self._save_tensor_information() 
      self.already_parsed = True

   def _parse_tensor(self,input_string, verbose=False):
      import re

      tensor_regexp_definition = "([a-zA-Z_0-9]+)\((.+)\)"
      tensor_sep_definition = "([|,])"
      if self.spinorbital_in :
         stride = 2
         tensor_indexes_definition = "(\w\d)"
      else :
         stride = 3
         tensor_indexes_definition = "(\w\d\w)"
         tensor_indexes_spin_definition = "(\w\d)(\w)"

      tensor_re = re.compile (r''+ tensor_regexp_definition+'', re.IGNORECASE)
      tensor_sep_re = re.compile (r''+ tensor_sep_definition+'', re.IGNORECASE)
      tensor_indexes_re = re.compile (r''+ tensor_indexes_definition +'', re.IGNORECASE)
      tensor_groups_re  = re.compile (r''+ tensor_indexes_definition + "*" +'', re.IGNORECASE)

      if not self.spinorbital_in :
         tensor_indexes_spin_re = re.compile (r''+ tensor_indexes_spin_definition +'', re.IGNORECASE)

      if verbose :
         print("\nparsing tensor input string:", input_string)

      if tensor_re.match(input_string):
          self.name = tensor_re.match(input_string).group(1)
          targs = tensor_re.match(input_string).group(2)

          if (tensor_sep_re.findall(targs)):        
             self.separatrices = tensor_sep_re.findall(targs)

          if (tensor_groups_re.finditer(targs)):
             idx = 0
             for m in tensor_groups_re.finditer(targs):
                start = m.span(0)[0]
                end   = m.span(0)[1]
                if (start != end) :
                   v = targs[start:end]
                   if ((end - start + 1) >= stride ) :
                      group = tensor_indexes_re.findall(v)
                      # information on the groups of indices is kept through the index denoting the position of
                      # of a given many-body index in the string defining the tensor. this way it is easier to
                      # control permutations and also get rid of a spin label if needed
                      gidx = []
                      for index in group :
                         gidx.append(idx)
                         if not self.spinorbital_in :
                            index_spin = tensor_indexes_spin_re.findall(index)[0]
                            self.indexes.append(index_spin[0])
                            self.spin.append(index_spin[1])
                         else : 
                            self.indexes.append(index)
                            self.spin.append("")
                         idx = idx + 1
                      self.groups.append(gidx)

          rank = len(self.indexes)
          if (rank != 0) :
             self.rank = rank

          self.set_tensor_indexes_class()
          if verbose :
             self.print_info(targs)

      else :
         print("   failed to indentify a tensor definition from input") 
         raise ValueError

   def print_info(self, targs=""):
      print("   printing tensor information")
      print("      object type              : ",self)
      print("      name                     : ",self.name)
      print("      spin-orbital mode (in)   : ",self.spinorbital_in)
      print("      spin-orbital mode (out)  : ",self.spinorbital_out)
      print("      spinor mode       (in)   : ",self.spinor_in)
      print("      spinor mode       (out)  : ",self.spinor_out)
      print("      rank                     : ",self.rank)
      print("      factor                   : ",self.factor)
      print("      class                    : ",self.get_tensor_class())
      print("      class, transposed        : ",self.get_transposed_tensor_class())
      print("      arguments")
      if (targs is not "") :
         print("         at input              :",targs)
      print("         indexes, parsed       :",self.get_indexes())
      print("            spatial/spinorbital:",self.get_indexes_only())
      print("            spin               :",self.get_spin())
      print("         indexes, parsed, trans:",self.get_transposed_indexes())
      print("         indexes, class        :",self.get_indexes_class())
      print("         groups, parsed        :",self.get_tensor_groups())
      print("         groups, parsed, trans :",self.get_transposed_tensor_groups())
      print("         separatrices, parsed  :", self.get_separatrices())
      print("   done printing tensor information")

   def get_indexes(self):
      if not self.spinorbital_in : 
         indexes = []
         for i,s in zip(self.indexes,self.spin):
            indexes.append(i+s)
         return indexes
      else :
         return self.indexes

   def get_spin(self):
      return self.spin

   def get_indexes_only(self):
      return self.indexes

   def get_transposed_indexes(self):
      transposed = []
      for t in reversed(self.indexes):
         transposed.append(t)
      return transposed

   def get_separatrices(self):
      return self.separatrices

   def get_tensor_name(self):
      return self.name

   def set_tensor_name(self,name):
      self.name = name

   def is_spinor(self):
      return self.spinor

   def is_allowed_tensor_class(self, targets):
      this_class = self.get_tensor_class()
      if this_class not in targets :
         return False
      else:
         return True

   def is_allowed_transposed_tensor_class(self, targets):
      this_transposed_class = self.get_transposed_tensor_class()
      if this_class not in targets :
         return False
      else:
         return True


   def is_spinorbital(self):
      return self.spinorbital_in

   def get_tensor_name(self, conjugate=False) :
      if conjugate :
         return self.name + "+"
      return self.name

   def get_tensor_groups(self, manybody_indexes=True) :
      # we reconstruct the groups in terms of the many-body indexes, from the list indexes
      if manybody_indexes : 
         groups = []
         for g in self.groups:
            if not isinstance(g,list) :
               raise ValueError
            else :
               subgroup = []
               for l in g :
                  if not isinstance(l,int) :
                     raise ValueError
                  else :
                     if self.spinorbital_out or self.spinor_out: 
                        mb_index = self.indexes[l]
                     else :
                        mb_index = self.indexes[l]+self.spin[l]
                     subgroup.append(mb_index)
               groups.append(subgroup)
         return groups
      else :
         return self.groups

   def get_transposed_tensor_groups(self, manybody_indexes=True) :
      transposed = []
      groups = self.get_tensor_groups(manybody_indexes) 
      for t in reversed(groups):
         transposed.append(t)
      return transposed 

   def is_pure_beta(self):
      for s in self.spin :
         if s is not "b" :
            return False 
      return True

   def get_tensor_indexes(self) :
      return self.indexes

   def get_transposed_tensor_indexes(self) :
      transposed = []
      for t in reversed(self.indexes):
         transposed.append(t)
      return transposed 

   def get_tensor_rank(self) :
      return self.rank

   def get_tensor_separatrices(self) :
      return self.separatrices

   def get_tensor_representation(self, conjugate=False) :
      if conjugate:
         representation = self.name + "+" + self.arglist
      else :
         representation = self.name + self.arglist
      return representation

   def set_tensor_arglist(self,split_groups=False,replace_bar=False, remove_bar=False, verbose=False, empty_unit_tensor=True):
      self._old_set_tensor_arglist(split_groups,replace_bar,remove_bar,verbose,empty_unit_tensor)

# WIP, make the code more compact compared to _old_set_tensor_arglist
   def _new_set_tensor_arglist(self,split_groups=False,replace_bar=False, remove_bar=False, verbose=False, empty_unit_tensor=True):
      import itertools

      if verbose:
         self.print_info()

      tensor = "("
      # unit tensor
      if len(self.groups) == 0 :
         if empty_unit_tensor :
            tensor += ")"
         else :
            if replace_bar :
               tensor += ",)"
            elif remove_bar :
               tensor += " )"
            else :
               tensor += self.separatrices[0]+")" 
      # any other tensor
      else :
         # spitting first group/element
         if split_groups and replace_bar:
            flat_group_list = list(itertools.chain.from_iterable(self.groups))
            tensor += self.indexes[flat_group_list[0]]
            if not self.spinorbital_out or self.spinor_out :
               tensor += self.spin[flat_group_list[0]]
            for i in flat_group_list[0:] :
               tensor += ","+self.indexes[i]
               if not self.spinorbital_out or self.spinor_out :
                  tensor += self.spin[i]
         else :
            pass

      tensor += ")"

      self.arglist = tensor

   def _old_set_tensor_arglist(self,split_groups=False,replace_bar=False, remove_bar=False, verbose=False, empty_unit_tensor=True):
      if verbose:
         self.print_info()

      tensor = "("
      if len(self.groups) != 0:
         k = -1
         for i in self.groups :
            if (k >= 0 ) :
               sep = self.separatrices[k]
               if sep is "|" :
                  if replace_bar :
                     sep = ","
                  elif remove_bar :
                     sep = " "
               tensor += sep
            if isinstance(i, list): 
               l = 0
               for e in i :
                  if self.spinorbital_out or self.spinor_out :
                     tensor += self.indexes[e] 
                  else :
                     tensor += self.indexes[e]+self.spin[e] 
                  if (split_groups and ((len(i)-1) > l)) :
                     tensor += ","
                     l += 1
            else :
               tensor += i 
            k = k + 1
      else : # handling a unit tensor, here we should have no indexes or groups so the only action is to replaes
         if empty_unit_tensor :
            tensor += ""
         else :
            if replace_bar :
               tensor += ","
            elif remove_bar : 
               tensor += " "
            else :
               tensor += "|"

      tensor += ")"
      
      self.arglist = tensor

   def set_tensor_representation(self,split_groups=False,replace_bar=False, remove_bar=False, verbose=False, empty_unit_tensor=True, conjugate=False, reset_representation=False):
      if self.arglist == "" or reset_representation:
         self.set_tensor_arglist(split_groups,replace_bar,remove_bar,verbose, empty_unit_tensor)

      if conjugate:
         self.representation = self.name + "+" + self.arglist
      else :
         self.representation = self.name + self.arglist
   
   def print_tensor(self,split_groups=False,replace_bar=False,remove_bar=False):
      self.set_tensor_arglist(split_groups,replace_bar,remove_bar)
      tensor_string = self.get_tensor_representation()
      print(tensor_string)


