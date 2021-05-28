# SwigR - An example R package using SWIG to wrap C++

A simple example repo to test making an R package
from C++ code using SWIG to generate wrapper code. The goal is
to make it easy to install for both Linux, MacOS and Windows
users. Windows users should be able to install a binary package
to not require tools to compile the C++ code.

## Install

Swigr can be installed as a source package from R by running

```R
devtools::install_github("danieledler/swigr")
```

Binary bundle can be installed from R by running

```R
devtools::install_url("https://github.com/danieledler/swigr/releases/download/v0.0.1/swigr_0.0.1b.tgz")
```

## Issues

R packages can be in [five different states](https://r-pkgs.org/package-structure-state.html):
* source
* bundled
* binary
* installed
* in-memory

`devtools::build()` creates a bundled package and can be installed with `devtools::install_github("danieledler/swigr")`. However, the C++ source code is included in a `src` directory and will be compiled on the user's computer, which creates problems for many Windows users.

`devtools::build(binary = T)` creates a binary package that instead of a `src` folder has a `libs` folder with the C++ code compiled to a shared library. This is required for `devtools::install_url("...")` to work, but `install_url` also require a `man` folder which is not present when building a binary package.

CRAN makes binaries available from bundles and includes a man folder.

### Cheat sheet
[Package Development:: CHEAT SHEET](https://rawgit.com/rstudio/cheatsheets/master/package-development.pdf)
## TODO

* Add `zzz.R` with `.onUnload()` to clean SWIG?
* Use Github Actions to build R package
    * https://docs.github.com/en/actions/using-github-hosted-runners/customizing-github-hosted-runners
    * https://blog--simonpcouch.netlify.app/blog/r-github-actions-commit/
    