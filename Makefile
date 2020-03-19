
build: src/Shape_wrap.cpp
	R CMD SHLIB -o src/Shape.so src/swigr_wrap.cpp src/Shape.cpp

src/Shape_wrap.cpp:
	swig -c++ -r -o src/swigr_wrap.cpp src/Shape.i
	@mv src/swigr.R R/

.PHONY: create document install test-R clean
create:
	cd .. && R --no-save -e 'devtools::create("swigr")'

document:
	R --no-save -e 'library(devtools); library(roxygen2); document()'

install:
	cd .. && R --no-save -e 'devtools::install("swigr")'

test-R:
	pwd
	cd $(R_PACKAGE) && R --no-save -e 'library(devtools); library(roxygen2); load_all(); test()'

clean:
	$(RM) src/*.so src/*.o src/*.R src/*_wrap.cpp