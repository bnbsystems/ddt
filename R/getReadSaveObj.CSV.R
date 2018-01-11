
#' @describeIn getReadSaveObj reading/writing from/to simple CSV file
getReadSaveObj.CSV <- function() {
    return(list(save = function(obj, filePath) {
        utils::write.table(x = obj, file = filePath, append = FALSE, na = "NA", row.names = FALSE, col.names = TRUE)
    }, read = function(filePath) {
        return(utils::read.table(file = filePath, header = T, stringsAsFactors = TRUE) )
    }))
}