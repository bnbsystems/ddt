#' Run single test under given location
#'
#' @param ddtDir (characters) path where tests inputs and outputs should be stored
#' @param preload (function) loading function
#' @param compare (function) compared of actual and expected objects
#' @param expectedFileName (character) generated file
#' @param readSaveObj (list of functions ) 
#' @family ddtRun
#' @seealso  \code{\link{ddtRun}} \code{\link{getReadSaveObj}}
#' @export
#' @examples
#' ddtDir <- './tests/example_in_doc/testCase_1'  #location where single DDT is
#' x <- 1:20
#' y <- x*2 + rnorm(20)
#' preload <- function(){ return(lm(y~x)) }
#' compare <- function(expected, actual){
#'  if(all(abs(expected$coefficients - actual$coefficients) < 0.001) ){
#'    print("Same")
#'  } else {
#'    stop("wrong coefficents. Expected ", expected$coefficients, " but is ",  actual$coefficients)
#'  }}
#' # ddtRunSingle(ddtDir, preload, compare) # will create required files
ddtRunSingle <- function(ddtDir, preload, compare, expectedFileName='data.txt', readSaveObj = NULL) {
  if (is.null(readSaveObj)) {
    readSaveObj <- getReadSaveObj()
  }
  
  if (!dir.exists(ddtDir)) {
      dir.create(ddtDir)
  }

  oldwd <- getwd()
  
  ddtDirIn <- file.path(ddtDir, "in")

  if (!dir.exists(ddtDirIn)) {
      dir.create(ddtDirIn)
  }

  
  e1 <- new.env( parent = baseenv())
  assign( "res", preload(), envir = e1)
  setwd(oldwd)
  
  if(!dir.exists(file.path(ddtDir, "actual"))){
    dir.create(file.path(ddtDir, "actual"))
  }
  
  readSaveObj$save(e1$res, filePath  = file.path(ddtDir, "actual", expectedFileName))
  
  
  
  if(!dir.exists(file.path(ddtDir, "expected"))){
    dir.create(file.path(ddtDir, "expected"))
  }
  expectedFilePath <- file.path(ddtDir, "expected", expectedFileName)
  
  if(!file.exists( expectedFilePath)) {
    warning("No expected file in ", expectedFilePath, ".\n It will create from actual file located under actual folder.")
    readSaveObj$save(e1$res, expectedFilePath)
  }
  
  expected <- readSaveObj$read(expectedFilePath)
  compare(expected, e1$res )
}
