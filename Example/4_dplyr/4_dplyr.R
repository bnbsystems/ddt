
library(dplyr)
library(nycflights13)

ddtCreateDirs(ddtsDir)

getDiagonal <- function( matA) sapply(seq_len(min(dim(matA))), function(i) matA[i, i]) %>% as.vector

preload <- function() {
    data <- flights %>%
              filter(month == 5, day == 17, carrier %in% c('UA', 'WN', 'AA', 'DL')) %>%
              select(carrier, dep_delay, air_time, distance) %>%
              arrange(carrier) %>%
              mutate(air_time_hours = air_time / 60) %>%
              group_by(carrier) %>%
              summarize(count = n(), max_dep_delay = max(dep_delay))
    return(data)
}

　
compare <- function(expected, actual) {
    expectedCol <- apply(expected, 1, paste, collapse = ".")
    actualCol <- apply(actual, 1, paste, collapse = ".")

    res <- sapply(actualCol, FUN = function(x) { x == expectedCol }) %>% getDiagonal %>% all
    print( paste0("Result is ",  res))
    if (res) {
        print("Data table are the same")
    } else {
        stop("wrong values in data frame:\n", print(actualCol), "\nExpecting :\n", expectedCol)
    }
}

ddtRun(ddtsDir, preload, compare, readSaveObj = getReadSaveObj.CSV())
