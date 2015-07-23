complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  file_list <- as.character(list.files(directory)) # specdatafiles
  file_paths <- paste(directory, file_list, sep="/")
  
  
  numfiles <- length(file_list)
  data_raw <- data.frame(Date = character(), sulfate = numeric(), nitrate = numeric(), ID = numeric())
  
  x <- data.frame(ID = id, nobs = numeric(length(id)))
  good <- list()
  
  for(i in 1:max(id)) {
    
    good[i] <- sum(!is.na(read.csv(file_paths[i], header = TRUE)[, 2]) & !is.na(read.csv(file_paths[i], header = TRUE)[, 3]))
    x[i, 2] <- good[i]
  }
  x <- data.frame(ID = id, nobs = x[id, 2])
  x
}