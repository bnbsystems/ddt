
#' Reads/Writes objects in JSON format
#'
#' @family getReadSaveObj
#' @seealso  \code{\link{ddtRun}}
#' @export
#' @examples
#' ddtRunSingle(".", function(){}, function(){}, getReadSaveObj.CSV ) # run single test
getReadSaveObj.JSON <- function() {
    return(list(save = function(obj, filePath) {
        serObj <- jsonlite::serializeJSON(obj, pretty = T)
        cat(serObj, file = filePath, append = F)
    }, read = function(filePath) {
        file <- file(filePath, "r")
        expectedLines <- readLines(file, warn = F)
        close(file)
        unlink(file)
        return(jsonlite::unserializeJSON(expectedLines))
    }))
}