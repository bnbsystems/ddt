#' Run singple test under given location
#'
#' @param ddtDir (characters) path where tests inputs and outputs should be stored
#' @param preload (function) loading function
#' @param compare (function) compared of actual and expected objects
#' @param expectedFileName (character) generated file
#' @param readSaveObj (list of functions ) please look at \code{\link{getReadSaveObj.default}}
#' @family ddtRun
#' @seealso  \code{\link{ddtRun}}
#' @export
#' @examples
#' ddtDir <- './test/ddt/testCase1'  #location where single DDT is
#' preload <- function(){ return(lm(y~x, data=read.csv("example_input.csv")))  }
#' compare <- function(expected, actual){
#'  if(all(abs(expected$coefficients - actual$coefficients) < 0.001) ){
#'    print("Same")
#'  } else {
#'    stop("wrong coefficents. Expected ", print(expected$coefficients) , " but is ",  print(actual$coefficients))
#'  }}
#' ddtRunSingle(ddtDir, preload, compare) # run single test
ddtRunSingle <- function(ddtDir, preload, compare, expectedFileName, readSaveObj = NULL) {
    if (is.null(readSaveObj)) {
        readSaveObj <- getReadSaveObj.Default()
    }

    oldwd <- getwd()

    ddtDirIn <- file.path(ddtDir, "in")
    if (dir.exists(ddtDirIn)) {
        setwd(ddtDirIn)
    }

    e1 <- new.env( parent = baseenv())
    assign( "res", preload(), envir = e1)
    setwd(oldwd)

    readSaveObj$save(e1$res, filePath  = file.path(ddtDir, "actual", expectedFileName))

    expectedFilePath <- file.path(ddtDir, "expected", expectedFileName)

    if(!file.exists( expectedFilePath)) {
        warning("No expected file in ", expectedFilePath, ".\n It will create from actual file located under actual folder.")
        readSaveObj$save(e1$res, expectedFilePath)
    }

    expected <- readSaveObj$read(expectedFilePath)
    compare(expected, e1$res )
}
