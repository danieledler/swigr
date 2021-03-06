# This file was automatically generated by SWIG (http://www.swig.org).
# Version 4.0.2
#
# Do not make changes to this file unless you know what you are doing--modify
# the SWIG interface file instead.

##   Generated via the command line invocation:
##	 swig -c++ -r -o src/swigr.cpp src/Shape.i


#                         srun.swg                            #
#
# This is the basic code that is needed at run time within R to
# provide and define the relevant classes.  It is included
# automatically in the generated code by copying the contents of
# srun.swg into the newly created binding code.


# This could be provided as a separate run-time library but this
# approach allows the code to be included directly into the
# generated bindings and so removes the need to have and install an
# additional library.  We may however end up with multiple copies of
# this and some confusion at run-time as to which class to use. This
# is an issue when we use NAMESPACES as we may need to export certain
# classes.

######################################################################

if(length(getClassDef("RSWIGStruct")) == 0) 
  setClass("RSWIGStruct", representation("VIRTUAL"))



if(length(getClassDef("ExternalReference")) == 0) 
# Should be virtual but this means it loses its slots currently
#representation("VIRTUAL")
  setClass("ExternalReference", representation( ref = "externalptr"))



if(length(getClassDef("NativeRoutinePointer")) == 0) 
  setClass("NativeRoutinePointer", 
              representation(parameterTypes = "character",
                             returnType = "character",
                             "VIRTUAL"), 
              contains = "ExternalReference")

if(length(getClassDef("CRoutinePointer")) == 0) 
  setClass("CRoutinePointer", contains = "NativeRoutinePointer")


if(length(getClassDef("EnumerationValue")) == 0) 
  setClass("EnumerationValue", contains = "integer")


if(!isGeneric("copyToR")) 
 setGeneric("copyToR",
            function(value, obj = new(gsub("Ref$", "", class(value)))) 
               standardGeneric("copyToR"
           ))

setGeneric("delete", function(obj) standardGeneric("delete"))


SWIG_createNewRef = 
function(className, ..., append = TRUE)
{
  f = get(paste("new", className, sep = "_"), mode = "function")

  f(...)
}

if(!isGeneric("copyToC")) 
 setGeneric("copyToC", 
             function(value, obj = SWIG_createNewRef(class(value)))
              standardGeneric("copyToC"
            ))


# 
defineEnumeration =
function(name, .values, where = topenv(parent.frame()), suffix = "Value")
{
   # Mirror the class definitions via the E analogous to .__C__
  defName = paste(".__E__", name, sep = "")
  delayedAssign(defName,  .values, assign.env = where)

  if(nchar(suffix))
    name = paste(name, suffix, sep = "")

  setClass(name, contains = "EnumerationValue", where = where)
}

enumToInteger <- function(name,type)
{
   if (is.character(name)) {
   ans <- as.integer(get(paste(".__E__", type, sep = ""))[name])
   if (is.na(ans)) {warning("enum not found ", name, " ", type)}
   ans
   } 
}

enumFromInteger =
function(i,type)
{
  itemlist <- get(paste(".__E__", type, sep=""))
  names(itemlist)[match(i, itemlist)]
}

coerceIfNotSubclass =
function(obj, type) 
{
    if(!is(obj, type)) {as(obj, type)} else obj
}


setClass("SWIGArray", representation(dims = "integer"), contains = "ExternalReference")

setMethod("length", "SWIGArray", function(x) x@dims[1])


defineEnumeration("SCopyReferences",
                   .values = c( "FALSE" = 0, "TRUE" = 1, "DEEP" = 2))

assert = 
function(condition, message = "")
{
  if(!condition)
    stop(message)

  TRUE
}


if(FALSE) {
print.SWIGFunction =
function(x, ...)
 {
 }
}


#######################################################################

R_SWIG_getCallbackFunctionStack =
function()
{
    # No PACKAGE argument as we don't know what the DLL is.
  .Call("R_SWIG_debug_getCallbackFunctionData")
}

R_SWIG_addCallbackFunctionStack =
function(fun, userData = NULL)
{
    # No PACKAGE argument as we don't know what the DLL is.
  .Call("R_SWIG_R_pushCallbackFunctionData", fun, userData)
}


#######################################################################



setClass('C++Reference', contains = 'ExternalReference')
setClass('_p_Shape', contains = 'C++Reference')
setClass('_p_Circle', contains = c('_p_Shape'))
setClass('_p_Square', contains = c('_p_Shape'))



setMethod('[', "ExternalReference",
function(x,i,j, ..., drop=TRUE) 
if (!is.null(x$"__getitem__")) 
sapply(i, function(n) x$"__getitem__"(i=as.integer(n-1))))

setMethod('[<-' , "ExternalReference",
function(x,i,j, ..., value) 
if (!is.null(x$"__setitem__")) {
sapply(1:length(i), function(n) 
x$"__setitem__"(i=as.integer(i[n]-1), x=value[n]))
x
})

setAs('ExternalReference', 'character',
function(from) {if (!is.null(from$"__str__")) from$"__str__"()})

suppressMessages(suppressWarnings(setMethod('print', 'ExternalReference',
function(x) {print(as(x, "character"))})))

# Start of circle_area

`circle_area` = function(r, .copy = FALSE)
{
  ;.Call('R_swig_circle_area', r, as.logical(.copy), PACKAGE='swigr');
  
}

attr(`circle_area`, 'returnType') = 'numeric'
attr(`circle_area`, "inputTypes") = c('numeric')
class(`circle_area`) = c("SWIGFunction", class('circle_area'))

# Start of circle_perimeter

`circle_perimeter` = function(r, .copy = FALSE)
{
  ;.Call('R_swig_circle_perimeter', r, as.logical(.copy), PACKAGE='swigr');
  
}

attr(`circle_perimeter`, 'returnType') = 'numeric'
attr(`circle_perimeter`, "inputTypes") = c('numeric')
class(`circle_perimeter`) = c("SWIGFunction", class('circle_perimeter'))

# Start of delete_Shape

`delete_Shape` = function(self)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  ;.Call('R_swig_delete_Shape', self, PACKAGE='swigr');
  
}

attr(`delete_Shape`, 'returnType') = 'void'
attr(`delete_Shape`, "inputTypes") = c('_p_Shape')
class(`delete_Shape`) = c("SWIGFunction", class('delete_Shape'))

# Start of Shape_x_set

`Shape_x_set` = function(self, s_x)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  
  ;.Call('R_swig_Shape_x_set', self, s_x, PACKAGE='swigr');
  
}

attr(`Shape_x_set`, 'returnType') = 'void'
attr(`Shape_x_set`, "inputTypes") = c('_p_Shape', 'numeric')
class(`Shape_x_set`) = c("SWIGFunction", class('Shape_x_set'))

# Start of Shape_x_get

`Shape_x_get` = function(self, .copy = FALSE)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  ;.Call('R_swig_Shape_x_get', self, as.logical(.copy), PACKAGE='swigr');
  
}

attr(`Shape_x_get`, 'returnType') = 'numeric'
attr(`Shape_x_get`, "inputTypes") = c('_p_Shape')
class(`Shape_x_get`) = c("SWIGFunction", class('Shape_x_get'))

# Start of Shape_y_set

`Shape_y_set` = function(self, s_y)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  
  ;.Call('R_swig_Shape_y_set', self, s_y, PACKAGE='swigr');
  
}

attr(`Shape_y_set`, 'returnType') = 'void'
attr(`Shape_y_set`, "inputTypes") = c('_p_Shape', 'numeric')
class(`Shape_y_set`) = c("SWIGFunction", class('Shape_y_set'))

# Start of Shape_y_get

`Shape_y_get` = function(self, .copy = FALSE)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  ;.Call('R_swig_Shape_y_get', self, as.logical(.copy), PACKAGE='swigr');
  
}

attr(`Shape_y_get`, 'returnType') = 'numeric'
attr(`Shape_y_get`, "inputTypes") = c('_p_Shape')
class(`Shape_y_get`) = c("SWIGFunction", class('Shape_y_get'))

# Start of Shape_move

`Shape_move` = function(self, dx, dy)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  
  
  ;.Call('R_swig_Shape_move', self, dx, dy, PACKAGE='swigr');
  
}

attr(`Shape_move`, 'returnType') = 'void'
attr(`Shape_move`, "inputTypes") = c('_p_Shape', 'numeric', 'numeric')
class(`Shape_move`) = c("SWIGFunction", class('Shape_move'))

# Start of Shape_area

`Shape_area` = function(self, .copy = FALSE)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  ;.Call('R_swig_Shape_area', self, as.logical(.copy), PACKAGE='swigr');
  
}

attr(`Shape_area`, 'returnType') = 'numeric'
attr(`Shape_area`, "inputTypes") = c('_p_Shape')
class(`Shape_area`) = c("SWIGFunction", class('Shape_area'))

# Start of Shape_perimeter

`Shape_perimeter` = function(self, .copy = FALSE)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  ;.Call('R_swig_Shape_perimeter', self, as.logical(.copy), PACKAGE='swigr');
  
}

attr(`Shape_perimeter`, 'returnType') = 'numeric'
attr(`Shape_perimeter`, "inputTypes") = c('_p_Shape')
class(`Shape_perimeter`) = c("SWIGFunction", class('Shape_perimeter'))

# Start of Shape_nshapes_set

`Shape_nshapes_set` = function(s_nshapes)
{
  s_nshapes = as.integer(s_nshapes);
  
  if(length(s_nshapes) > 1) {
    warning("using only the first element of s_nshapes");
  };
  
  ;.Call('R_swig_Shape_nshapes_set', s_nshapes, PACKAGE='swigr');
  
}

attr(`Shape_nshapes_set`, 'returnType') = 'void'
attr(`Shape_nshapes_set`, "inputTypes") = c('integer')
class(`Shape_nshapes_set`) = c("SWIGFunction", class('Shape_nshapes_set'))

# Start of Shape_nshapes_get

`Shape_nshapes_get` = function(.copy = FALSE)
{
  ;.Call('R_swig_Shape_nshapes_get', as.logical(.copy), PACKAGE='swigr');
  
}

attr(`Shape_nshapes_get`, 'returnType') = 'integer'
class(`Shape_nshapes_get`) = c("SWIGFunction", class('Shape_nshapes_get'))

Shape_nshapes = 
function(value, .copy = FALSE)
{
  if(missing(value)) {
    Shape_nshapes_get(.copy)
  } else {
    Shape_nshapes_set(value)
  }
}

# Start of accessor method for Shape
setMethod('$', '_p_Shape', function(x, name)

{
  accessorFuns = list('x' = Shape_x_get, 'y' = Shape_y_get, 'move' = Shape_move, 'area' = Shape_area, 'perimeter' = Shape_perimeter);
  vaccessors = c('x', 'y');
  ;        idx = pmatch(name, names(accessorFuns));
  if(is.na(idx)) 
  return(callNextMethod(x, name));
  f = accessorFuns[[idx]];
  if (is.na(match(name, vaccessors))) function(...){
    f(x, ...)
  } else f(x);
}


);
# end of accessor method for Shape
# Start of accessor method for Shape
setMethod('$<-', '_p_Shape', function(x, name, value)

{
  accessorFuns = list('x' = Shape_x_set, 'y' = Shape_y_set);
  ;        idx = pmatch(name, names(accessorFuns));
  if(is.na(idx)) 
  return(callNextMethod(x, name, value));
  f = accessorFuns[[idx]];
  f(x, value);
  x;
}


);
setMethod('[[<-', c('_p_Shape', 'character'),function(x, i, j, ..., value)

{
  name = i;
  accessorFuns = list('x' = Shape_x_set, 'y' = Shape_y_set);
  ;        idx = pmatch(name, names(accessorFuns));
  if(is.na(idx)) 
  return(callNextMethod(x, name, value));
  f = accessorFuns[[idx]];
  f(x, value);
  x;
}


);
# end of accessor method for Shape
setMethod('delete', '_p_Shape', function(obj) {delete_Shape(obj)})
# Start of new_Circle

`Circle` = function(r)
{
  ;ans = .Call('R_swig_new_Circle', r, PACKAGE='swigr');
  ans <- if (is.null(ans)) ans
  else new("_p_Circle", ref=ans);
  
  reg.finalizer(ans@ref, delete_Circle);
  ans
  
}

attr(`Circle`, 'returnType') = '_p_Circle'
attr(`Circle`, "inputTypes") = c('numeric')
class(`Circle`) = c("SWIGFunction", class('Circle'))

# Start of Circle_area

`Circle_area` = function(self, .copy = FALSE)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  ;.Call('R_swig_Circle_area', self, as.logical(.copy), PACKAGE='swigr');
  
}

attr(`Circle_area`, 'returnType') = 'numeric'
attr(`Circle_area`, "inputTypes") = c('_p_Circle')
class(`Circle_area`) = c("SWIGFunction", class('Circle_area'))

# Start of Circle_perimeter

`Circle_perimeter` = function(self, .copy = FALSE)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  ;.Call('R_swig_Circle_perimeter', self, as.logical(.copy), PACKAGE='swigr');
  
}

attr(`Circle_perimeter`, 'returnType') = 'numeric'
attr(`Circle_perimeter`, "inputTypes") = c('_p_Circle')
class(`Circle_perimeter`) = c("SWIGFunction", class('Circle_perimeter'))

# Start of delete_Circle

`delete_Circle` = function(self)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  ;.Call('R_swig_delete_Circle', self, PACKAGE='swigr');
  
}

attr(`delete_Circle`, 'returnType') = 'void'
attr(`delete_Circle`, "inputTypes") = c('_p_Circle')
class(`delete_Circle`) = c("SWIGFunction", class('delete_Circle'))

# Start of accessor method for Circle
setMethod('$', '_p_Circle', function(x, name)

{
  accessorFuns = list('area' = Circle_area, 'perimeter' = Circle_perimeter);
  ;        idx = pmatch(name, names(accessorFuns));
  if(is.na(idx)) 
  return(callNextMethod(x, name));
  f = accessorFuns[[idx]];
  function(...){
    f(x, ...)
  };
}


);
# end of accessor method for Circle
setMethod('delete', '_p_Circle', function(obj) {delete_Circle(obj)})
# Start of new_Square

`Square` = function(w)
{
  ;ans = .Call('R_swig_new_Square', w, PACKAGE='swigr');
  ans <- if (is.null(ans)) ans
  else new("_p_Square", ref=ans);
  
  reg.finalizer(ans@ref, delete_Square);
  ans
  
}

attr(`Square`, 'returnType') = '_p_Square'
attr(`Square`, "inputTypes") = c('numeric')
class(`Square`) = c("SWIGFunction", class('Square'))

# Start of Square_area

`Square_area` = function(self, .copy = FALSE)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  ;.Call('R_swig_Square_area', self, as.logical(.copy), PACKAGE='swigr');
  
}

attr(`Square_area`, 'returnType') = 'numeric'
attr(`Square_area`, "inputTypes") = c('_p_Square')
class(`Square_area`) = c("SWIGFunction", class('Square_area'))

# Start of Square_perimeter

`Square_perimeter` = function(self, .copy = FALSE)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  ;.Call('R_swig_Square_perimeter', self, as.logical(.copy), PACKAGE='swigr');
  
}

attr(`Square_perimeter`, 'returnType') = 'numeric'
attr(`Square_perimeter`, "inputTypes") = c('_p_Square')
class(`Square_perimeter`) = c("SWIGFunction", class('Square_perimeter'))

# Start of delete_Square

`delete_Square` = function(self)
{
  if (inherits(self, "ExternalReference")) self = slot(self,"ref"); 
  ;.Call('R_swig_delete_Square', self, PACKAGE='swigr');
  
}

attr(`delete_Square`, 'returnType') = 'void'
attr(`delete_Square`, "inputTypes") = c('_p_Square')
class(`delete_Square`) = c("SWIGFunction", class('delete_Square'))

# Start of accessor method for Square
setMethod('$', '_p_Square', function(x, name)

{
  accessorFuns = list('area' = Square_area, 'perimeter' = Square_perimeter);
  ;        idx = pmatch(name, names(accessorFuns));
  if(is.na(idx)) 
  return(callNextMethod(x, name));
  f = accessorFuns[[idx]];
  function(...){
    f(x, ...)
  };
}


);
# end of accessor method for Square
setMethod('delete', '_p_Square', function(obj) {delete_Square(obj)})


