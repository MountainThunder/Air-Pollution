pollutantmean <- function(directory, pollutant, id = 1:332){
  ##Write a function named 'pollutantmean' that calculates the mean of a pollutant 
  ##(sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes
  ##three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 
  ##'pollutantmean' reads that monitors' particulate matter data from the directory specified 
  ##in the 'directory' argument and returns the mean of the pollutant across all of the 
  ##monitors, ignoring any missing values coded as NA. 
  
  directory <- paste(as.character(directory[1]))
  setwd(directory)
  #print(length(id))
  
  pollutant_values <- list()
  pollutant_values_index <- 1
  for (i in id){
    file_name <- paste(str_pad(as.character(i), width=3, side = "left", pad = "0"), ".csv", sep="")
   
    x <- get_table_pollutant_values(file_name, directory, pollutant[1])
    #print("x:")
    #print(x)
    pollutant_values[[pollutant_values_index]] <- x
    pollutant_values_index <- pollutant_values_index+1
  }
  #print("Pollutant Values")
  #print(pollutant_values)
  p<-unlist(pollutant_values, recursive = TRUE)
  #print("p:")
  #print(p)
  return_mean <- mean(p, na.rm = TRUE)
  return_mean
  #print("mean: ")
  #print(return_mean)
}

get_table_pollutant_values <- function(file_name, directory, pollutant){
  #print(file_name)
  file_data <- read.csv(file_name)
  if(pollutant == "sulfate"){
    index<-2
  }
  if(pollutant == "nitrate"){
    index <-3
  }
  values <- c(file_data[,index])
  d <- values[!is.na(values)]
  #print(d)
}

#install.packages("stringr")
#library(stringr)
#setwd("D:/Jessica/Coursera Data Science/R Programming Course/Week 2 Programming Assignment")
print(pollutantmean("specdata", "nitrate"))
