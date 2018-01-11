#' Run tests under given location
#'
#' @param ddtsDir (characters) path where tests inputs and outputs should be stored
#' @param preload (function) loading function
#' @param compare (function) compared of actual and expected objects
#' @param expectedFileName (character) generated file
#' @param readSaveObj (list of functions ) 
#' @family ddtRun
#' @seealso  \code{\link{ddtRunSingle}} \code{\link{getReadSaveObj}}
#' @export
#' @examples
#' ddtsDir <- './tests/example_in_doc/testCase_1'  #location where single DDT is
#' x <- 1:20
#' y <- x*2 + rnorm(20)
#' preload <- function(){ return(lm(y~x)) }
#' compare <- function(expected, actual){
#'  if(all(abs(expected$coefficients - actual$coefficients) < 0.001) ){
#'    print("Same")
#'  } else {
#'    stop("wrong coefficents. Expected ", print(expected$coefficients) , " but is ",  print(actual$coefficients))
#'  }}
#' # ddtRun(ddtsDir, preload, compare) # run all test
ddtRun <- function(ddtsDir, preload, compare, expectedFileName = "actual.csv", readSaveObj = NULL) {
  dirs <- list.dirs(path = ddtsDir, recursive = F, full.names = T)

  for( d in dirs){
    print(d)
    ddtRunSingle(d, preload, compare, expectedFileName, readSaveObj)
  }
}
