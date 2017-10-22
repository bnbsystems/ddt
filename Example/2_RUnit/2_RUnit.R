library(magrittr)
library(RUnit)

preload <- function(){ myDf <- read.csv("example_input.csv") return(lm(y~x, data=myDf))  }
compare <- function(expected, actual){
  actual$coefficients %>%  checkEquals( expected$coefficients, tolerance = 0.001,
                                        msg = paste("wrong coefficents. Expected ", print(expected$coefficients) , " but is ",  print(actual$coefficients)))
}

ddtRun(ddtsDir, preload, compare)
