install.packages("devtools")
install.packages("roxygen2")

#vignette("namespace")

# Create repo
#setwd("~/dev/R/swig")
#devtools::create("swigr")

#setwd("~/dev/R/projects/swigr")
#usethis::use_vignette("introduction")

#devtools::document()

#devtools::build()

#devtools::build(binary = T)

# Install local repo
#setwd("~/dev/R/swig")
#devtools::install("swigr")
#setwd("~/dev/R/swig/swigr")

# Install local binary bundle
#devtools::install_url("file:///Users/Daniel/dev/R/swig/swigr_bin_man.tgz")


devtools::document(roclets = c('rd', 'collate', 'namespace', 'vignette'))
devtools::build(pkg = ".", path = "./dist", binary = TRUE, args = c('--preclean'))
install.packages("./dist/swigr_0.0.2.tgz", repos = NULL, type = .Platform$pkgType)

devtools::check()

# Test package
swigr::test_r()
swigr::test_example()

devtools::load_all()
