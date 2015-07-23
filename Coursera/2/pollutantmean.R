pollutantmean <- function(directory, pollutant = "nitrate", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate" (both in the datasets).
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used (recall there are 322 of them). By default, we 
  ## use all of them, but we could select just a subset.
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  ## We create a list with all the files in the directory
  
  file_list <- as.character(list.files(directory)) # specdatafiles
  file_paths <- paste(directory, file_list, sep="/")
  
  ## We initialize where the raw and the clean data are going to be
  data_raw <- data.frame(Date = character(), sulfate = numeric(), nitrate = numeric(), ID = numeric())
  data_clean <- numeric()
  
  ## We go through a loop that reads the .csv's for each of the wanted IDs
  for(i in id) {
    
    data_raw <- rbind(data_raw, read.csv(file_paths[i], header = TRUE))
  }
  
  if(pollutant == "nitrate") {
     # Removing missing values of the variable wanted
      good <- !is.na(data_raw[, 3])
      data_clean <- data_raw[good, ]

      # And finally calculate its mean
      mean(data_clean[, 3])
  
  } else {  
    good <- !is.na(data_raw[, 2])
    data_clean <- data_raw[good, ]
    
    # And finally calculate its mean
    mean(data_clean[, 2])
  }
    
}  