## mb-autogen: a processing tool to generate code for many-body (electronic structure) methods

**mb-autogen** is a python tool to process a SIAL (Super Instruction Architecture Language) specification for a particular
electronic structure approach (kernels from residue equations etc) and generate code for (non-)relativistic electronic
structure.

**mb-autogen** has been inspired by discussions with Dmitry Liakh (then at Oak Rigde Leadership Computing facility) on a simple 
toolchain to go from a the definition of a many-body problem to code that can be executed on different architectures.

**mb-autogen** currently supports the generation of code for the TAL-SH and ExaTENSOR libraries.

