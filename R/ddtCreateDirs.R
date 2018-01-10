#' Initialize directories for DDT
#'
#' @param ddtPath path where tests inputs and outputs should be stored
#' @param testCaseName name of test case for DDT
#' @seealso   \code{\link{ddtRun}}
#' @export
#' @examples
#' ddtCreateDirs("./tests/ddt")
ddtCreateDirs <- function(ddtPath, testCaseName ="testCase1") {
  folderName <- c("actual", "expected", "in")

    if (!base::dir.exists(ddtPath)) {
        base::dir.create(ddtPath)
    }

    if (!base::dir.exists(base::file.path(ddtPath, testCaseName))) {
        base::dir.create(base::file.path(ddtPath, testCaseName))
    }
    for (f in folderName) {
        testCaseDir <- base::file.path(ddtPath, testCaseName, f)
        if (!base::dir.exists(testCaseDir)) {
            base::dir.create(testCaseDir)
        }
    }
}
