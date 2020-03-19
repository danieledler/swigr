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
devtools::install_url("https://github.com/danieledler/swigr/releases/download/v0.0.1/swigr_0.0.1.tgz")
```


## TODO

* Add `zzz.R` with `.onUnload()` to clean SWIG?