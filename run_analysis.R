getTidyXNames <- function() {
  # the features file contains the filenames for the X file
  x_names = read.table("./data/UCI HAR Dataset/features.txt")
  x_names_list <- x_names$V2
  
  # Clean up some of the strange formatting in that features file
  x_names_list <- sub("\\()", "", x_names_list)
  x_names_list <- sub("BodyBody", "Body", x_names_list)
  x_names_list <- sub("fBody", "Body", x_names_list)
  
  x_names_list
}

generateTestDataSet <- function() {
  # read in each of the data files to their own data table
  subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")  
  x <- read.table("./data/UCI HAR Dataset/test/X_test.txt") 
  y <- read.table("./data/UCI HAR Dataset/test/y_test.txt")  
  
  # set names for each data table. 
  # the first is simply subject as specified in the data set documentation
  names(subject) <- c("subject")  
  
  # Generate and assign column name list from the provided features file
  names(x) <- getTidyXNames()
  
  # again the y files only column is the activity per the documentation
  names(y) <- c("activity")
  
  # merge the independent data tables together
  cbind(subject, x, y)  
}

generateTrainDataSet <- function() {
  # read in each of the data files to their own data table  
  subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
  x <- read.table("./data/UCI HAR Dataset/train/X_train.txt")  
  y <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
  
  # set names for each data table. 
  # the first is simply subject as specified in the data set documentation
  names(subject) <- c("subject")  
  
  # Generate and assign column name list from the provided features file
  names(x) <- getTidyXNames()
  
  # again the y files only column is the activity per the documentation
  names(y) <- c("activity")
  
  # merge the independent data tables together
  cbind(subject, x, y)  
}

appendDataSets<-function(...) {
  # wrapping rbind for readibility. This makes it clear that the intent
  # is the append the data sets that are passed in
  rbind(...)
}

stripRelevantColumns <- function(data) {
  # get all of the columns that record a mean or standard deviation
  col_name_regex = ".*mean\\(\\).*-X$|.*std\\(\\).*-X$"
  columns <- grep(regex, names(data))
  
  # Add back in the subject and activity type
  columns <- c(relevantCols, c(1, length(names(mergedData))))
  
  # return only those columns that are contained in the columns subset
  data[,columns]  
}

generateAveragedData <- function(data) {
  # melt the data to get a break down of each metric by subject and activity
  meltedData <- melt(data, id=c("subject", "activity"))
  
  # cast data back to a data frame by taking the average of each grouped variable
  dcast(meltedData, subject+activity ~ variable, mean)
}

main <- function() {
  test <- generateTestDataSet()
  train <- generateTrainDataSet()
  mergedData <- appendDataSets(test, train)
  relevantData <- stripRelevantColumns(mergedData)  
  averagedData <- generateAveragedData(relevantData)
  write.table(averagedData, file="output.txt")
}

main()
