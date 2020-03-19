install.packages("devtools")
install.packages("roxygen2")

vignette("namespace")

setwd("~/dev/projects/icelab/code/test/swig")
devtools::create("swigr")

usethis::use_vignette("introduction")

devtools::document()

devtools::build()

devtools::build(binary = T)

setwd("~/dev/projects/icelab/code/test/swig")
devtools::install("swigr")
setwd("~/dev/projects/icelab/code/test/swig/swigr")
# test:
swigr::test_r()

swigr::test_example()

devtools::load_all()
