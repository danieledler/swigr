# This file illustrates the proxy class C++ interface generated
# by SWIG, with some additional R functions added to the package

# dyn.load(paste("example", .Platform$dynlib.ext, sep=""))
# source("example.R")
# cacheMetaData(1)

install.packages("devtools")
devtools::install_github("danieledler/swigr")

swigr::test_example()

# ----- Object creation -----

print("Creating some objects:")
circle <- swigr::Circle(10)
print ("    Created circle")
square <- swigr::Square(10)
print ("    Created square")

# ----- Access a static member -----

sprintf("A total of %d shapes were created", swigr::Shape_nshapes())

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

print ("Here are some properties of the shapes:")

sapply(c(circle, square), 
		 function(o) {
sprintf("       area = %f perimeter = %f", o$area(),  o$perimeter())
})

print("Guess I'll clean up now")
swigr::delete(circle)
swigr::delete(square)

sprintf("%d shapes remain", swigr::Shape_nshapes())
print ("Goodbye")
