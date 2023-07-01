## mb-autogen: a processing tool to generate code for many-body (electronic structure) methods

Copyright the authors of mb-autogen, 2020-2023.

# Aims and scope

**mb-autogen** is a python tool to process a SIAL (Super Instruction Architecture Language, see documentation at the [ACES](http://qtp.ufl.edu/ACES/docs.shtml) site) specification for a particular
electronic structure approach (kernels from residue equations etc) and generate code for (non-)relativistic electronic
structure.

**mb-autogen** has been developed as part of a collaboration with Dmitry Liakh (then at Oak Rigde Leadership Computing facility) on a simple 
toolchain to go from a the definition of a many-body problem to code that can be executed on different architectures.

**mb-autogen** currently supports the generation of code for the TAL-SH and ExaTENSOR libraries,  and has been used to obtain code for the  [Exacorr module](https://doi.org/10.1021/acs.jctc.1c00260) from the [DIRAC](https://diracprogram.org) code.

# License

**mb-diag-autogen** is licensed under version 2.1 of the GNU Lesser General Public License [(LGPLv2.1)](https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html), see [LICENSE](LICENSE)

# How to cite

Please use the following DOI below, see section "how to cite this repository" for a bibtex entry.

[![DOI](https://zenodo.org/badge/647753867.svg)](https://zenodo.org/badge/latestdoi/647753867)

