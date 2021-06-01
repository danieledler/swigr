CXXFLAGS=-std=c++14 -O0 -g

.PHONY: build create document build-binary repackage install test-R demo docker-build-rstudio docker-run-rstudio clean

# swigr: src/Shape.cpp src/utils/math.cpp
# 	g++ -std=c++11 $^ -o $@ 

swigr: src/Shape.o src/utils/math.o
	# g++ $(LDFLAGS) -o swigr src/Shape.o src/utils/math.o
	@true

src/Shape.o: src/Shape.cpp src/Shape.h
	g++ $(CXXFLAGS) -c src/Shape.cpp -o $@

src/utils/math.o: src/utils/math.cpp src/utils/math.h
	g++ $(CXXFLAGS) -c src/utils/math.cpp -o $@

build: src/swigr.cpp
	R CMD SHLIB -o src/swigr.so src/swigr.cpp src/Shape.cpp src/utils/math.cpp

src/swigr.cpp:
	swig -c++ -r -o src/swigr.cpp src/Shape.i
	@mv src/swigr.R R/

init-R:
	R --no-save -e 'install.packages("devtools", repos = "https://ftp.acc.umu.se/mirror/CRAN/"); install.packages("rmarkdown", repos = "https://ftp.acc.umu.se/mirror/CRAN/");'

create:
	cd .. && R --no-save -e 'devtools::create("swigr")'

document:
	R --no-save -e 'library(devtools); library(roxygen2); document()'

build-binary:
	mkdir -p dist
	R --no-save < build.R

repackage:
	tar -xzvf dist/swigr_0.0.2.tgz -C dist
	cp -r man dist/swigr/
	cd dist && tar -czvf swigr_0.0.2.tgz swigr

test-remote-binary:
	R --no-save < test.R

install:
	cd .. && R --no-save -e 'devtools::install("swigr")'

test-R:
	pwd
	cd $(R_PACKAGE) && R --no-save -e 'library(devtools); library(roxygen2); load_all(); test()'

demo:
	Rscript demo/runme.R

docker-build-rstudio: Makefile Dockerfile
	DOCKER_BUILDKIT=0 COMPOSE_DOCKER_CLI_BUILD=0 docker build -f Dockerfile -t danieledler/swigr:rstudio .

docker-run-rstudio: Makefile
	docker run -e PASSWORD=1234 -p 8787:8787 --rm danieledler/swigr:rstudio

clean-binary:
	$(RM) -r src/*.o dist

clean:
	$(RM) -r src/*.so src/*.o src/utils/*.o src/*.R src/*_wrap.cpp dist