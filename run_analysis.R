run_analysis <- function() {
 
# load libraries 
   library(plyr) 
  
## Read in Features data while preserving the data as character class
## Remove illegal characters  
  
  features <-read.table("features.txt", colClasses = "character")
  features[,2] <- gsub("-|,","-",features[,2])
  features[,2] <- tolower(features[,2])
  
## Read in  "test" data and merge
  subject_test <- read.table("subject_test.txt")
  colnames(subject_test) <-"subject_id"
  
  activity_test <- read.table("y_test.txt")
  colnames(activity_test) <- "activity_id"
  
  xtest_data <- read.table("X_test.txt")
  colnames(xtest_data)  <- features[,2]
  
  mergetest_data <- cbind(subject_test, activity_test, xtest_data)
  
## Now Separate out the mean and standard deviation features only, reducing the number of columns in the df.  
 
  finaltest_data <- mergetest_data[,c(1,3,grep(".*mean.|.*std.*", names(mergetest_data)))]
  
## Read in "train" data  and merge
  
  subject_train <- read.table("subject_train.txt")
  colnames(subject_train) <-"subject_id"
  
  activity_train <- read.table("y_train.txt")
  colnames(activity_train) <- "activity_id"
  
  xtrain_data <- read.table("X_train.txt")
  colnames(xtrain_data) <- features[,2]
  
  mergetrain_data <- cbind(subject_train, activity_train, xtrain_data)
  
## Separate out the mean and standard deviation features only, reducing the number of columns in the dataframe.
  
  finaltrain_data <- mergetrain_data[,c(1,3,grep(".*mean.|.*std.*", names(mergetrain_data)))]
  
## Read in Activity Labels as character
  
  activity_labels <- read.table("activity_labels.txt", colClasses= "character")
  colnames(activity_labels) <- c("activity_id","activity_name")
  
##  Merge activty labels to the training data file and the test data file
  
  finaltrain_data <- merge(activity_labels, finaltrain_data)
  finaltrain_data$activity_name <- tolower(finaltrain_data$activity_name)
  
  finaltest_data <- merge(activity_labels, finaltest_data)
  finaltrain_data$activity_name <- tolower(finaltrain_data$activity_name)
  

##  Combine the final test data and the final train data to be required_data
  
     required_data <- rbind(finaltest_data, finaltrain_data) 
     dim(required_data)

     
     
## Write data file     

    write.table(required_data, file = "required_data.txt")
    print("Finished processing. The processed raw dataset is written to required_data.txt.")
     
## Create Tidy Data file using Split/ Apply/ Combine with ddply
     
    tidy <- ddply(required_data, .(subject_id, activity_id, activity_name), numcolwise(mean)) 

    write.table(tidy, file = "tidy.txt")                                            
    print("Finished processing. The processed tidy dataset is written to tidy.txt.")
    
## Clean up data frames    
    
    rm( activity_labels, activity_test, activity_train, features, finaltest_data, finaltrain_data,
        meanstd, mergetest_data, mergetrain_data, required_data, subject_test, subject_train,
        xtest_data, xtrain_data, ytest_data, ytrain_data)
}