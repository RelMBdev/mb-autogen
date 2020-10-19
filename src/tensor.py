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
   """

   def __init__ (self, spinorbital=False) :
      self.spinorbital      = spinorbital 
      self.name             = "T00"
      self.rank             = 1
      self.indexes          = []    # e.g.: ["m1b","l1b",...], list of the strings 
      self.groups           = []    # e.g.: [[1,2,3],[4,5],[6]] so lists containing the indexes which make up the groups. 
      self.separatrices     = []    # e.g.: ["|", "," ] so a ordered list of symbols separating groups. always 1 element less than self.groups
      self.factor           = 1.0
      self.representation   = ""

   def parse_tensor(self,input_string, verbose=False):
      import re

      tensor_regexp_definition = "([a-zA-Z_0-9]+)\((.+)\)"
      tensor_sep_definition = "([|,])"
      if self.spinorbital :
         stride = 2
         tensor_indexes_definition = "(\w\d)"
      else :
         stride = 3
         tensor_indexes_definition = "(\w\d\w)"

      tensor_re = re.compile (r''+ tensor_regexp_definition+'', re.IGNORECASE)
      tensor_sep_re = re.compile (r''+ tensor_sep_definition+'', re.IGNORECASE)
      tensor_indexes_re = re.compile (r''+ tensor_indexes_definition +'', re.IGNORECASE)
      tensor_groups_re  = re.compile (r''+ tensor_indexes_definition + "*" +'', re.IGNORECASE)

      if verbose :
         print("\nparsing tensor input string:", input_string)

      if tensor_re.match(input_string):
          self.name = tensor_re.match(input_string).group(1)
          targs = tensor_re.match(input_string).group(2)

          if (tensor_sep_re.findall(targs)):        
             self.separatrices = tensor_sep_re.findall(targs)

          if (tensor_groups_re.finditer(targs)):
             for m in tensor_groups_re.finditer(targs):
                start = m.span(0)[0]
                end   = m.span(0)[1]
                if (start != end) :
                   v = targs[start:end]
                   if ((end - start + 1) >= stride ) :
                      group = tensor_indexes_re.findall(v)
                      self.groups.append(group)
                      for index in group :
                         self.indexes.append(index)

          rank = len(self.indexes)
          if (rank != 0) :
             self.rank = rank

          if verbose :
             self.print_tensor_information(targs)
      else :
         print("   failed to indentify a tensor definition from input") 
         raise ValueError

   def print_info(self, targs=""):
      print("   printing tensor information")
      print("      name                     : ",self.name)
      print("      spin-orbital/spinor mode : ",self.spinorbital)
      print("      rank                     : ",self.rank)
      print("      arguments")
      if (targs is not "") :
         print("         at input              :",targs)
      print("         indexes, parsed       :",self.indexes)
      print("         groups, parsed        :",self.groups)
      print("         separatrices, parsed  :", self.separatrices)
      print("   done printing tensor information")

   def get_tensor_class(self) :
      """
      get_tensor_class: from inspection of the indexes, return the class this tensor belongs to

      in our case, the classes refer, for example, to how many occupied or virtuals indexes appear, and on what order these appear 
      so a class could be vvvv, vvov, ooov etc
      """

      tensor_class = ""
#     for index in self.indexes :
#        if index[0] is in ("m", "n", "l") tensor_class += "o"
#        if index[0] is in ("i", "j", "k") tensor_class += "o"
#        if index[0] is in ("e", "f", "d") tensor_class += "v"
#        if index[0] is in ("a", "b", "c") tensor_class += "v"
      return tensor_class
   
   def set_tensor_name(self,name):
      self.name = name

   def get_tensor_name(self) :
      return self.name

   def get_tensor_groups(self) :
      return self.groups

   def get_tensor_indexes(self) :
      return self.indexes

   def get_tensor_rank(self) :
      return self.rank

   def get_tensor_separatrices(self) :
      return self.separatrices

   def get_tensor_representation(self) :
      return self.representation

   def set_tensor_representation(self,split_groups=False,replace_bar=False, remove_bar=False, verbose=False, empty_unit_tensor=True):
      if verbose:
         self.print_info()

      tensor  = self.name
      tensor += "("
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
                  tensor += e 
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
      
      self.representation = tensor
   
   def print_tensor(self,split_groups=False,replace_bar=False,remove_bar=False):
      self.set_tensor_representation(split_groups,replace_bar,remove_bar)
      tensor_string = self.get_tensor_representation()
      print(tensor_string)


