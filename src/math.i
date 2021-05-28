%module swigr

%{
/* Includes the header in the wrapper code */
#include "utils/math.h"
%}

/* Parse the header file to generate wrappers */
%include "utils/math.h"