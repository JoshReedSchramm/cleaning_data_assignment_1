# Getting and Cleaning Data ProjectHelp

This project accomplishes the following goals in line with the First Peer Assignment of the getting and Cleaning Data course on Coursera

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Overview

The main component of this project is run_analysis.R. When sourced into an R console that file will read data from the data directory and output a file - output.txt containing the results of step 5 above.

## Input

run_analysis.R assumes the presence of a data folder containing a subfolder "UCI HAR Dataset". Within that folder there should be 2 subfolders, test and train, each containing a subject_*.txt, X_*.txt and y_*.txt file where * is either "test" or "train" corresponding to the containing folder. 

The script also assumes the precence of a file - features.txt - in ./data/UCI HAR Dataset/

## Output

The script, when run, will output a file - output.txt - into the root working directory, containing a data frame of averages of each measured activity characteristic, grouped by activity and subject.





