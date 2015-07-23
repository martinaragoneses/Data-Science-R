corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations (use 'cor' function for two vectors)
  ## NOTE: Do not round the result!
  tres <- rep(threshold, times = 332)
  x <- complete(directory)$nobs > tres
  correls <- numeric()
  ids <- 1:332
  where <- ids[x]
  
  good <- list()
  
  ## Recall from the first function:
  
  file_list <- as.character(list.files(directory)) # specdatafiles
  file_paths <- paste(directory, file_list, sep="/")
  
  ## We initialize where the raw and the clean data are going to be
  data_raw <- data.frame(Date = character(), sulfate = numeric(), nitrate = numeric(), ID = numeric())
  data_clean <- numeric()
  
  ## And now we loop:
  
  for(i in where) {
    data_raw <- read.csv(file_paths[i], header = TRUE)
    good <- !is.na(data_raw[, 2]) & !is.na(data_raw[, 3])
    data_clean <- data_raw[good, ]
    correls <- c(correls, cor(data_clean[,c(2, 3)])[1, 2])
  }
  correls
}