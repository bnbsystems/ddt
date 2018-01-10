#' @describeIn  \code{\link{getReadSaveObj.Default}} JSON serializer
getReadSaveObj.JSON <- function() {
    list(save = function(obj, filePath) {
        serObj <- jsonlite::serializeJSON(obj, pretty = T)
        cat(serObj, file = filePath, append = F)
    }, read = function(filePath) {
        file <- file(filePath, "r")
        expectedLines <- readLines(file, warn = F)
        close(file)
        unlink(file)
        jsonlite::unserializeJSON(expectedLines) %>% return
    }) %>% return
}


#' @describeIn  \code{\link{getReadSaveObj.Default}} RDS serializer
getReadSaveObj.RDS <- function() {
    list(save = function(obj, filePath) {
        print("saving to ", filePath)
        base::save(obj, file = filePath)
    }, read = function(filePath) {
        print("Reading file ", filePath)
        base::load(filePath) %>% return
    }) %>% return
}

#' @describeIn \code{\link{getReadSaveObj.Default}} reading/writing from/to simple CSV file
getReadSaveObj.CSV <- function() {
    list(save = function(obj, filePath) {
        utils::write.table(x = obj, file = filePath, append = FALSE, na = "NA", row.names = FALSE, col.names = TRUE)
    }, read = function(filePath) {
        utils::read.table(file = filePath, header = T, stringsAsFactors = TRUE) %>% return
    }) %>% return
}


#' Run singple test under given location
#'
#' @family getReadSaveObj
#' @seealso  \code{\link{ddtRun}}
#' @export
#' @examples
#' ddtRunSingle(".", function(){}, function(){}, getReadSaveObj.CSV ) # run single test
getReadSaveObj.Default <- getReadSaveObj.JSON
