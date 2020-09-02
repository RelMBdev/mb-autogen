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

      tensor_regexp_definition = "([a-zA-Z]+_?[0-9]+)\((.+)\)"
      tensor_sep_definition = "([|,])"
      if self.spinorbital :
         stride = 2
         tensor_indexes_definition = "(\w\d)"
      else :
         stride = 3
         tensor_indexes_definition = "(\w\d\w)"
      sensor_sep_definition = "([|,])"

      tensor_re = re.compile (r''+ tensor_regexp_definition+'', re.IGNORECASE)
      tensor_sep_re = re.compile (r''+ tensor_sep_definition+'', re.IGNORECASE)
      tensor_indexes_re = re.compile (r''+ tensor_indexes_definition +'', re.IGNORECASE)
      tensor_groups_re  = re.compile (r''+ tensor_indexes_definition + "*" +'', re.IGNORECASE)

      if (verbose) :
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
                   v = targs[m.span(0)[0]:m.span(0)[1]]
                   if ((end - start + 1) >= stride ) :
                      group = tensor_indexes_re.findall(v)
                      self.groups.append(group)
                      for index in group :
                         self.indexes.append(index)

          rank = len(self.indexes)
          if (rank != 0) :
             self.rank = rank

          if (verbose) :
             self.print_tensor_information(targs)
      else :
         print("   failed to indentify a tensor definition from input") 
         raise ValueError

   def print_tensor_information(self, targs=""):
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

   def set_tensor_representation(self,split_groups=False,remove_bar=False, verbose=False):
      if (verbose):
         self.print_tensor_information()

      tensor  = self.name
      tensor += "("
      k = -1
      for i in self.groups :
         if (k >= 0 ) :
            sep = self.separatrices[k]
            if (remove_bar and (sep is "|")) :
               sep = ","
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
      tensor += ")"
      return tensor
   
   def print_tensor(self,split_groups=False,remove_bar=False):
      tensor_string = self.set_tensor_representation(split_groups,remove_bar)
      print(tensor_string)


def main():

   print("\ninput : ",None)
   t0 = tensor()
   print("output : ")
   t0.print_tensor(split_groups=True)

   t1 = tensor()
   string = "S44(d1bd2b|l1bl2b)"
   print("\ninput  : ",string)
   t1.parse_tensor(string)
   print("output : ")
   t1.print_tensor(split_groups=True)

   t2 = tensor()
   string = "S46(d1ad1b|m1b,l1a)"
   print("\ninput : ",string)
   t2.parse_tensor(string)
   print("output : ")
   t2.print_tensor()

   t3 = tensor()
   string = "S99(|)"
   print("\ninput : ",string)
   t3.parse_tensor(string)
   print("output : ")
   t3.print_tensor()

   t4 = tensor(spinorbital=True)
   string = "S14(e1,d1|l1l2)"
   print("\ninput : ",string)
   t4.parse_tensor(string)
   print("output : ")
   t4.print_tensor(remove_bar=True)

   t5 = tensor()
   string = "S46(d1ad1bd2ad2b|m1b,l1an1a,i1b)"
   print("\ninput : ",string)
   t5.parse_tensor(string)
   print("output : ")
   t5.print_tensor(split_groups=True,remove_bar=True)

main()

