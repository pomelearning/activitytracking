## Getting and Cleaning Data Course Project
## Create run_analysis.R script that does the following:
## Step 1. Merges the training and the test sets to create one data set.
## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## Step 3. Uses descriptive activity names to name the activities in the data set.
## Step 4. Appropriately labels the data set with descriptive variable names.
## Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Prerequisite: 
## 1. Data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has been downloaded and unzipped in the working directory.
## 2. Required data.table and reshape2 packages have been installed.

## Step 0. Get data directory and required libraries.

data_directory <- paste(getwd(), "/UCI HAR Dataset", sep="");

require("data.table");
require("reshape2");

## Step 1. Merges the training and the test sets to create one data set.

## Step 1.1. Load Test Data and Training Data
x_test <- read.table(paste(data_directory, "/test/X_test.txt", sep=""));
y_test <- read.table(paste(data_directory, "/test/y_test.txt", sep=""));
subject_test <- read.table(paste(data_directory, "/test/subject_test.txt", sep=""));

names(subject_test) <- "subject";
names(y_test) <- "activity";
names(x_test) <- features[, 2];

x_training <- read.table(paste(data_directory, "/train/X_train.txt", sep=""));
y_training <- read.table(paste(data_directory, "/train/y_train.txt", sep=""));
subject_training <- read.table(paste(data_directory, "/train/subject_train.txt", sep=""));

names(subject_training) <- "subject";
names(y_training) <- "activity";
names(x_training) <- features[, 2];

## Step 1.2. Merge Test and Training Data
test_data <- cbind(subject_test, y_test, x_test);
training_data <- cbind(subject_training, y_training, x_training);
merged_data <- rbind(test_data, training_data);
                               
                                      
## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

## 2.1. Load Features (Variable Names)
features <- read.table(paste(data_directory, "/features.txt", sep=""));

## 2.2. Extract Variable Names Contain mean() or std()
extracted_features <- grep("mean\\(\\)|std\\(\\)", features[, 2]);
extracted_data <- merged_data[, c(1, 2, extracted_features+2)];


## Step 3. Uses descriptive activity names to name the activities in the data set.
activity_labels <- read.table(paste(data_directory, "/activity_labels.txt", sep=""));
activity <- activity_labels[, 2];
extracted_data$activity <- activity[extracted_data$activity];
        
## Step 4. Appropriately labels the data set with descriptive variable names.

names(extracted_data)<-gsub("mean\\(\\)", "Average", names(extracted_data));
names(extracted_data)<-gsub("std\\(\\)", "Standard Deviation", names(extracted_data));

names(extracted_data)<-gsub("tGravityAccMag", "Gravity Accelerometer Magnitude Time", names(extracted_data));
names(extracted_data)<-gsub("tBodyAccJerkMag", "Body Accelerometer Jerk Magnitude Time", names(extracted_data));
names(extracted_data)<-gsub("tBodyGyroJerkMag", "Body Gyroscope Jerk Magnitude Time", names(extracted_data));
names(extracted_data)<-gsub("tBodyAccMag", "Body Accelerometer Magnitude Time", names(extracted_data));
names(extracted_data)<-gsub("tBodyGyroMag", "Body Gyroscope Magnitude Time", names(extracted_data));
names(extracted_data)<-gsub("tBodyAccJerk", "Accelerometer Jerk Time", names(extracted_data));
names(extracted_data)<-gsub("tBodyGyroJerk", "Body Gyroscope Jerk Time", names(extracted_data));
names(extracted_data)<-gsub("tBodyAcc", "Body Accelerometer Time", names(extracted_data));
names(extracted_data)<-gsub("tGravityAcc", "Gravity Accelerometer Time", names(extracted_data));
names(extracted_data)<-gsub("tBodyGyro", "Body Gyroscope Time", names(extracted_data));

names(extracted_data)<-gsub("fBodyAccJerk", "Accelerometer Jerk Frequency", names(extracted_data));
names(extracted_data)<-gsub("fBodyAccMag", "Body Accelerometer Magnitude Frequency", names(extracted_data));
names(extracted_data)<-gsub("fBodyAcc", "Body Accelerometer Frequency", names(extracted_data));
names(extracted_data)<-gsub("fBodyGyro", "Body Gyroscope Frequency", names(extracted_data));

names(extracted_data)<-gsub("fBodyBodyAccJerkMag", "Body Accelerometer Jerk Magnitude Frequency", names(extracted_data));
names(extracted_data)<-gsub("fBodyBodyGyroMag", "Body Gyroscope Magnitude Frequency", names(extracted_data));
names(extracted_data)<-gsub("fBodyBodyGyroJerkMag", "Body Gyroscope Jerk Magnitude Frequency", names(extracted_data));

## Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
melted_data <- melt(extracted_data, id.vars = c("activity", "subject"))
tidy_data <- dcast(melted_data, activity + subject ~ variable, mean, na.rm=TRUE);

write.table(tidy_data, paste(data_directory, "/tidy_data.txt", sep=""), row.name=FALSE);