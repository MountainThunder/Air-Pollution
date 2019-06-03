complete <- function(directory, id=1:332){
    directory <- paste(as.character(directory[1]))
    #setwd(directory)
    complete_case_table <- data.frame(id_num = numeric(), nobs = numeric(), stringsAsFactors = FALSE)
    colnames(complete_case_table) <- c("id", "nobs")
    
    for (i in id){
        file_name <- paste(str_pad(as.character(i), width=3, side = "left", pad = "0"), ".csv", sep="")
        file_data <- read.csv(file_name)
        complete_cases_logical <- complete.cases(file_data)
        complete_num <- sum(complete_cases_logical)
        complete_case_table <- rbind(complete_case_table, data.frame(id_num = i, nobs=complete_num))
    }
    
    print(complete_case_table)
}


#complete("specdata", c(3))
