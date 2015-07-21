# Coursera_datacleaning

## Cleaning-Data Assignment 1

This repository cleans the UCI Har dataset from data collected from the accelerometers from the Samsung Galaxy S smartphone. Raw data
and description here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run-analysis.R script:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Outputs an independent tidy data set with the average of each variable for each activity and each subject.

The clean data is output to a text file in the current working directory called cleandata.txt. 

For further explanation of how the code works please refer to comments in the run-analysis.R script. 
