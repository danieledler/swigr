CXXFLAGS=-std=c++14 -O0 -g

.PHONY: build create document build-binary repackage install test-R clean

# swigr: src/Shape.cpp src/utils/math.cpp
# 	g++ -std=c++11 $^ -o $@ 

swigr: src/Shape.o src/utils/math.o
	g++ $(LDFLAGS) -o swigr src/Shape.o src/utils/math.o

src/Shape.o: src/Shape.cpp src/Shape.h
	g++ $(CXXFLAGS) -c src/Shape.cpp -o $@

src/utils/math.o: src/utils/math.cpp src/utils/math.h
	g++ $(CXXFLAGS) -c src/utils/math.cpp -o $@

build: src/Shape_wrap.cpp
	R CMD SHLIB -o src/Shape.so src/swigr_wrap.cpp src/Shape.cpp

src/Shape_wrap.cpp:
	swig -c++ -r -o src/swigr_wrap.cpp src/Shape.i
	@mv src/swigr.R R/

create:
	cd .. && R --no-save -e 'devtools::create("swigr")'

document:
	R --no-save -e 'library(devtools); library(roxygen2); document()'

build-binary:
	mkdir -p tmp/binary
	R --no-save -e 'library(devtools); devtools::build(pkg = ".", path = "./tmp/binary", binary = T)'
	
repackage:
	tar -xzvf tmp/binary/swigr_0.0.1.tgz -C tmp/binary
	cp -r man tmp/binary/swigr/
	tar -czvf tmp/binary/swigr_0.0.1_man.tgz tmp/binary/swigr

install:
	cd .. && R --no-save -e 'devtools::install("swigr")'

test-R:
	pwd
	cd $(R_PACKAGE) && R --no-save -e 'library(devtools); library(roxygen2); load_all(); test()'

clean:
	$(RM) src/*.so src/*.o src/*.R src/*_wrap.cpp