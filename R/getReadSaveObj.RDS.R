
#' @describeIn  \link{getReadSaveObj.JSON} RDS serializer
getReadSaveObj.RDS <- function() {
    return(list(save = function(obj, filePath) {
        print("saving to ", filePath)
        base::save(obj, file = filePath)
    }, read = function(filePath) {
        print("Reading file ", filePath)
        return(base::load(filePath))
    }))
}