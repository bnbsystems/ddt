## Test environments
* local OS X install, 3.3.0 (2016-05-03)

## R CMD check results

* checking for file ‘ddt/DESCRIPTION’ ... OK
* preparing ‘ddt’:
* checking DESCRIPTION meta-information ... OK
* installing the package to build vignettes
* creating vignettes ... OK
* checking for LF line-endings in source and make files
* checking for empty or unneeded directories
Removed empty directory ‘ddt/.github’
Removed empty directory ‘ddt/Example/1_simple/tests/testCase_1/expected’
Removed empty directory ‘ddt/Example/1_simple/tests/testCase_1/in’
Removed empty directory ‘ddt/Example/1_simple/tests/testCase_1’
Removed empty directory ‘ddt/Example/1_simple/tests/testCase_2’
Removed empty directory ‘ddt/Example/1_simple/tests/testCase_3’
Removed empty directory ‘ddt/Example/1_simple/tests’
Removed empty directory ‘ddt/Example/2_RUnit/tests/testCase_1’
Removed empty directory ‘ddt/Example/2_RUnit/tests/testCase_2’
Removed empty directory ‘ddt/Example/2_RUnit/tests/testCase_3’
Removed empty directory ‘ddt/Example/2_RUnit/tests’
Removed empty directory ‘ddt/Example/5_data.table’
Removed empty directory ‘ddt/packrat/lib-ext’
Removed empty directory ‘ddt/tests/example_in_doc/testCase_1’
Removed empty directory ‘ddt/tests/example_in_doc’
* building ‘ddt_0.0.1.tar.gz’

* using log directory ‘/Users/arekbee/Code/ddt/ddt.Rcheck’
* using R version 3.3.0 (2016-05-03)
* using platform: x86_64-apple-darwin13.4.0 (64-bit)
* using session charset: UTF-8
* checking for file ‘ddt/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ddt’ version ‘0.0.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
* checking if this is a source package ... NOTE
Found the following apparent object files/libraries:
  packrat/lib-R/class/libs/class.so
  packrat/lib-R/cluster/libs/cluster.so
  packrat/lib-R/foreign/libs/foreign.so
  packrat/lib-R/graphics/libs/graphics.so
  packrat/lib-R/grDevices/libs/cairo.so
  packrat/lib-R/grDevices/libs/grDevices.so
  packrat/lib-R/grid/libs/grid.so
  packrat/lib-R/KernSmooth/libs/KernSmooth.so
  packrat/lib-R/lattice/libs/lattice.so packrat/lib-R/MASS/libs/MASS.so
  packrat/lib-R/Matrix/libs/Matrix.so
  packrat/lib-R/methods/libs/methods.so packrat/lib-R/mgcv/libs/mgcv.so
  packrat/lib-R/nlme/libs/nlme.so packrat/lib-R/nnet/libs/nnet.so
  packrat/lib-R/parallel/libs/parallel.so
  packrat/lib-R/rpart/libs/rpart.so
  packrat/lib-R/spatial/libs/spatial.so
  packrat/lib-R/splines/libs/splines.so
  packrat/lib-R/stats/libs/stats.so
  packrat/lib-R/survival/libs/survival.so
  packrat/lib-R/tcltk/libs/tcltk.so packrat/lib-R/tools/libs/tools.so
  packrat/lib-R/utils/libs/utils.so
Object files/libraries should not be included in a source package.

Subdirectory ‘packrat/lib-R/base’ seems to contain an installed version of the package.
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ddt’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... NOTE
Found the following CITATION files in a non-standard place:
  packrat/lib-R/base/CITATION
  packrat/lib-R/boot/CITATION
  packrat/lib-R/class/CITATION
  packrat/lib-R/cluster/CITATION
  packrat/lib-R/lattice/CITATION
  packrat/lib-R/MASS/CITATION
  packrat/lib-R/mgcv/CITATION
  packrat/lib-R/nlme/CITATION
  packrat/lib-R/nnet/CITATION
  packrat/lib-R/spatial/CITATION
  packrat/lib-R/survival/CITATION
Most likely ‘inst/CITATION’ should be used instead.
* checking R files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking dependencies in R code ... NOTE
Namespace in Imports field not imported from: ‘magrittr’
  All declared Imports should be used.
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... WARNING
Missing link or links in documentation object 'ddtRun.Rd':
  ‘getReadSaveObj.Default’

Missing link or links in documentation object 'ddtRunSingle.Rd':
  ‘getReadSaveObj.Default’

See section 'Cross-references' in the 'Writing R Extensions' manual.

* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... ERROR
Running examples in ‘ddt-Ex.R’ failed
The error most likely occurred in:

> ### Name: ddtRunSingle
> ### Title: Run singple test under given location
> ### Aliases: ddtRunSingle
> 
> ### ** Examples
> 
> ddtDir <- './test/ddt/testCase1'  #location where single DDT is
> x <- 1:20
> y <- x*2 + rnorm(20)
> preload <- function(){ return(lm(y~x)) }
> compare <- function(expected, actual){
+  if(all(abs(expected$coefficients - actual$coefficients) < 0.001) ){
+    print("Same")
+  } else {
+    stop("wrong coefficents. Expected ", print(expected$coefficients) , " but is ",  print(actual$coefficients))
+  }}
> ddtRunSingle(ddtDir, preload, compare) # run single test
Warning in dir.create(ddtDirIn) :
  cannot create dir './test/ddt/testCase1/in', reason 'No such file or directory'
Error in setwd(ddtDirIn) : cannot change working directory
Calls: ddtRunSingle -> setwd
Execution halted
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ...
  Running ‘testthat.R’
 OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ...
   ‘ddt-vignette.Rmd’ using ‘UTF-8’ ... OK
 NONE
* checking re-building of vignette outputs ... OK
* checking PDF version of manual ... WARNING
LaTeX errors when creating PDF version.
This typically indicates Rd problems.
LaTeX errors found:
! LaTeX Error: File `inconsolata.sty' not found.

Type X to quit or <RETURN> to proceed,
or enter new name. (Default extension: sty)

! Emergency stop.
<read *> 
         
l.276 ^^M
         
!  ==> Fatal error occurred, no output PDF file produced!
* checking PDF version of manual without hyperrefs or index ... ERROR
* DONE

Status: 2 ERRORs, 2 WARNINGs, 3 NOTEs
See
  ‘/Users/arekbee/Code/ddt/ddt.Rcheck/00check.log’
for details.