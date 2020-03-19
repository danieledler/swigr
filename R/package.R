#' swigr
#' 
#' R package to test SWIG
#' 
#' @docType package
#' @author you
#' @useDynLib swigr, .registration=TRUE
#' @exportPattern "^[[:alpha:]]+"
#' @name swigr
#' @include swigr.R
NULL


#' @export
test_r <- function() {
  print("test_r works!")
  42
}

#' Test example shapes
#' @param r Circle radius
#' @export
test_example <- function(r=10) {
  print("Creating some objects:")
  circle <- Circle(r)
  print ("    Created circle")
  square <- Square(20)
  print ("    Created square")

  # ----- Access a static member -----

  sprintf("A total of %d shapes were created", Shape_nshapes())

  # ----- Member data access -----

  # Set the location of the object

  circle$x <- 20
  circle$y <- 30

  square$x <- -10
  square$y <- 5

  print("Here is their current position:")
  sprintf("    Circle = (%f, %f)", circle$x,circle$y)
  sprintf("    Square = (%f, %f)", square$x,square$y)

  # ----- Call some methods -----

  circle$move(10, 20)
  sprintf("Cicle moved to (%f, %f)", circle$x,circle$y)
}
