#!/usr/bin/env python

# toolset to parse diagen output
# Andre Gomes <andre.gomes@univ-lille.fr>

import tensor as t 
import contraction as c
###############################################################################
#
# diagram_info class
#
class diagram_info:
   """
   diagram_info: keeps information on the relationship betwen individual contractions 
                 and the diagrams they contribute to 
   """

   def __init__ (self, contraction=None):
      self.contraction      = None
      self.ormo_number      = None
      self.diagram_number   = None
      self.contraction_number = None
      self.treelevel_number = None
      self.scaling_info     = None
      self.ressize_info     = None

   def set_contraction(self, contraction):
      self.contraction = contraction

   def get_contraction(self, contraction):
      return self.contraction

   def set_ormo_number(self,number):
      self.ormo_number = number

   def get_ormo_number(self):
      return self.ormo_number

   def set_diagram_number(self,number):
      self.diagram_number = number

   def get_diagram_number(self):
      return self.diagram_number

   def set_contraction_number(self,number):
      self.contraction_number = number

   def get_contraction_number(self):
      return self.contraction_number

   def set_treelevel_number(self,number):
      self.treelevel_number = number

   def get_treelevel_number(self):
      return self.treelevel_number

   def set_scaling_info(self,info_string):
      self.scaling_info = info_string 

   def get_scaling_info(self):
      return self.scaling_info

   def set_ressize_info(self,info_string):
      self.ressize_info = info_string 

   def get_ressize_info(self):
      return self.ressize_info

   def print_info(self) :
      print("   Printing diagram information for contraction")
      if self.ormo_number is None:
         print("      ORMO number              :  not defined")
      else :
         print("      ORMO number              : ",self.ormo_number)

      if self.diagram_number is None:
         print("      diagram number           :  not defined")
      else :
         print("      diagram number           : ",self.diagram_number)

      if self.contraction_number is None:
         print("      contraction number       :  not defined")
      else :
         print("      contraction number           : ",self.contraction_number)

      if self.contraction is not None:
         self.contraction.print_processed_contraction()
      else:
         print("      Contraction              : not defined")

