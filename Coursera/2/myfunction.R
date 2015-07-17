setwd("~/Desktop/data/github/Data-Science-R/Coursera/2")
myfunction <- function(x) {
  y <- rnorm(100)
  mean(y)
}

second <- function(x) {
  x + rnorm(length(x))
}