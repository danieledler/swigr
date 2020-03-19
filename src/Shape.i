%module swigr

%{
#include "Shape.h"
%}

/* Let's just grab the original header file here */
%include "Shape.h"

/* CRAN checks (R 3.5+) now require that locally compiled calls are 'registered' (see 
https://cran.r-project.org/doc/manuals/R-exts.html#Registering-native-routines). The
following 'init' block will be inserted into the 'R_init_Redland' function which is 
called when the redland.so shared object is loaded.  */

// %insert("sinitroutine") %{
//     R_useDynamicSymbols(dll, FALSE);
// %