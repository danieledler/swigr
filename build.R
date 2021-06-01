#install.packages("devtools")
#install.packages("roxygen2")

devtools::document(roclets = c('rd', 'collate', 'namespace', 'vignette'))
devtools::build(pkg = ".", path = "./dist", binary = TRUE, args = c('--preclean'))

