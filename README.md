# Readme File for run_analysis.R

### Prerequisite: 
1. Data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has been downloaded and unzipped in the working directory.
2. Required data.table and reshape2 packages have been installed.

### Steps Performed:

0. Get data directory and required libraries.
1. Merges the training and the test sets to create one data set.
   <br> 1.1. Load Test Data and Training Data
   <br> 1.2. Merge Test and Training Data
2. Extracts only the measurements on the mean and standard deviation for each measurement.
   <br> 2.1. Load Features (Variable Names)
   <br> 2.2. Extract Variable Names Contain mean() or std()
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
