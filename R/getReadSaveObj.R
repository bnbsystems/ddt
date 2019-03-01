#' Reads/Writes objects in JSON format
#'
#' @family getReadSaveObj
#' @seealso  \code{\link{ddtRun}}
#' @export
#' @examples
#' #ddtRunSingle(".", function(){}, function(){}, getReadSaveObj ) # run single test
getReadSaveObj <- function() { return(getReadSaveObj.JSON()) }
