
ddtRunSingle <- function(ddtDir, preload, compare, expectedFileName, readSaveObj = NULL) {
    if (is.null(readSaveObj)) {
        readSaveObj <- getReadSaveObj.Default()
    }

    oldwd <- getwd()

    ddtDirIn <- file.path(ddtDir, "in")
    if (dir.exists(ddtDirIn)) {
        setwd(ddtDirIn)
    }
    
    e1 <- new.env(parent = baseenv()) 
    assign("res", preload(), envir = e1)
    setwd(oldwd)

    readSaveObj$save(e1$res, filePath  = file.path(ddtDir, "actual", expectedFileName))

    expectedFilePath <- file.path(ddtDir, "expected", expectedFileName)

    if(!file.exists(expectedFilePath)) {
        warning("No expected file in ", expectedFilePath, ".\n It will create from actual file located under actual folder.")
        readSaveObj$save(e1$res, expectedFilePath)
    }

    expected <- readSaveObj$read(expectedFilePath)
    compare(expected, e1$res )
}
