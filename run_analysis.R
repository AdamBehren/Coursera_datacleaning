#You should create one R script called run_analysis.R that does the following. 
library(plyr)

#
##1. Merges the training and the test sets to create one data set.
#
setwd("C:/Users/Adam/Documents/School/Coursera/CleaningData/UCI HAR Dataset/")
#load datasets
activ_labels <- read.csv("activity_labels.txt",sep = "", header = FALSE)
train_labels <- read.csv("train/y_train.txt", sep = "", header = FALSE)
train_data <- read.csv("train/x_train.txt", sep = "", header = FALSE)
test_labels <- read.csv("test/y_test.txt", sep = "", header = FALSE)
test_data <- read.csv("test/x_test.txt",sep = "", header = FALSE)

#load feature headings
features <- read.csv("features.txt", sep = "", header = FALSE)
names(train_data) <- features[,2]
names(test_data) <- features[,2]
names(train_labels) <- "activityID"
names(test_labels) <- "activityID"
names(activ_labels) <- c("activityID", "activityName")

#load additional 
row_iden_train <- read.csv("train/subject_train.txt", sep = "", header = FALSE)
#acceleration signal
total_accel_train <- read.csv("train/Inertial Signals/total_acc_x_train.txt", sep = "", header = FALSE)
body_accel_train <- read.csv("train/Inertial Signals/body_acc_x_train.txt", sep = "", header = FALSE)
body_gyro_train <- read.csv("train/Inertial Signals/body_gyro_x_train.txt", sep = "", header = FALSE)

#append labels
test_data <- cbind(test_labels,test_data)
train_data <- cbind(train_labels, train_data)

#combined dataset
combined_data <- rbind(train_data,test_data)

#
##2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#

#find values in features with std() or mean()
meanheadings <- grep("mean()", colnames(combined_data), value = TRUE)
stdheadings <- grep("std()",colnames(combined_data), value = TRUE)
selected_data <- combined_data$activityID
selected_data <- cbind(selected_data, combined_data[,meanheadings])
selected_data <- cbind(selected_data, combined_data[,stdheadings])

#
#3. From the data set in step 4 (complete), creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

mean_table <- ddply(combined_data, .(activityID), colwise(mean))
mean_table <- cbind(activ_labels$activityName,mean_table)
names(mean_table$'activ_labels$activityName') <- "activityName"
write.table(mean_table,file="cleanData.txt", row.name=FALSE)
