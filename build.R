install.packages("devtools")
install.packages("roxygen2")

vignette("namespace")

# Create repo
setwd("~/dev/R/swig")
devtools::create("swigr")

usethis::use_vignette("introduction")

devtools::document()

devtools::build()

devtools::build(binary = T)

# Install local repo
setwd("~/dev/R/swig")
devtools::install("swigr")
setwd("~/dev/R/swig/swigr")

# Test package
swigr::test_r()
swigr::test_example()

devtools::load_all()
