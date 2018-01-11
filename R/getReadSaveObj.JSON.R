
#' @describeIn  getReadSaveObj JSON serializer 

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