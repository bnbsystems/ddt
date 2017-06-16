preload <- function(){  myDf <- read.csv("example_input.csv")  return(lm(y~x, data=myDf))  }
compare <- function(expected, actual){  if(all(abs(expected$coefficients - actual$coefficients) < 0.001) ){    print("Same")  } else {    stop("wrong coefficents. Expected ", print(expected$coefficients) , " but is ",  print(actual$coefficients))  }}

run(ddtsDir, preload, compare) 
