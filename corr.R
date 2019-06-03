corr<- function(directory, threshold = 0){
    directory <- paste(as.character(directory[1]))
    #setwd(directory)
    #complete_case_table <- data.frame(id_num = numeric(), nobs = numeric(), stringsAsFactors = FALSE)
    #colnames(complete_case_table) <- c("id", "nobs")
    corr_vector <- c()
    index <-1
    
    for (i in 1:332){
        file_name <- paste(str_pad(as.character(i), width=3, side = "left", pad = "0"), ".csv", sep="")
        file_data <- read.csv(file_name)
        complete_cases_logical <- complete.cases(file_data)
        complete_num <- sum(complete_cases_logical)
        #print(file_data[complete_cases_logical,])
        #print(class(file_data[complete_cases_logical,]))
        complete_data <- file_data[complete_cases_logical,]
        
        #print(complete_data$sulfate)
        
        #print(complete_num)
        
        if(complete_num >threshold){
            
            #corr_vector <- append(corr_vector, cor(complete_data$sulfate, complete_data$nitrate))
            corr_vector <- c(corr_vector, cor(complete_data$sulfate, complete_data$nitrate))
            #print(class(corr_vector))
            #print(length(corr_vector))
            #print(index)           
            index <- index +1
            #print(cor(complete_data$sulfate, complete_data$nitrate))
            #print(corr_vector)
        }
        else{
            
        }
        
    }
    corr_vector
    
}


#result <-corr("specdata", 1)
#print("result:")
#print(result)