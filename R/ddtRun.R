ddtRun <- function(ddtsDir, preload, compare, expectedFileName = "actual.csv", readSaveObj = NULL) {
  dirs <- list.dirs(path = ddtsDir, recursive = F, full.names = T)

  for( d in dirs){
    print(d)
    ddtRunSingle(d, preload, compare, expectedFileName, readSaveObj)
  }
}
