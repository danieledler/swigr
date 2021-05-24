install.packages("devtools")
install.packages("roxygen2")

vignette("namespace")

# Create repo
setwd("~/dev/R/swig")
devtools::create("swigr")

setwd("~/dev/R/projects/swigr")
usethis::use_vignette("introduction")

devtools::document()

devtools::build()

devtools::build(binary = T)

# Install local repo
setwd("~/dev/R/swig")
devtools::install("swigr")
setwd("~/dev/R/swig/swigr")

# Install local binary bundle
devtools::install_url("file:///Users/Daniel/dev/R/swig/swigr_bin_man.tgz")

# Test package
swigr::test_r()
swigr::test_example()

devtools::load_all()
