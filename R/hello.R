# Hello, world!
#
# This is an example function named 'hello' 
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#' @param love Do you love cats? Defaults to TRUE.#' @keywords cats#' @export#' @examples

runSingle <- function(ddtDir, preload, compare, expectedFileName) {    oldwd <- getwd()          setwd(file.path(ddtDir,"in"))    e1 <- new.env(parent = baseenv())     assign("res", preload(), envir = e1)    setwd(oldwd)        cat(serializeJSON(e1$res), file=file.path(ddtDir,"actual",expectedFileName), append = F)        expectedFilePath <- file.path(ddtDir, "expected",expectedFileName)    if(!file.exists(expectedFilePath)) {      warning("No expected file in ", expectedFilePath, ". It will create from actual file located under actual folder")      cat(serializeJSON(e1$res, pretty=T), file=expectedFilePath, append = F)    }           expected <- unserializeJSON(readLines(file(expectedFilePath, "r")) )    compare(expected, e1$res )
}
run <- function(ddtsDir, preload, compare, expectedFileName = "actual.json" ){  dirs <- list.dirs(path = ddtsDir, recursive = F, full.names = T)  for(d in dirs ){    print(d)    runSingle(d, preload, compare, expectedFileName)  }}
