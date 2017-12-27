# Code Book for run_analysis.R

### This code book describes the data sets, variables, measurements and any transformation performed in the script.

## Input Data

1. x_test.txt: This is the test data set containing 561 features, each in its own column.
2. y_test.txt: This is the test data set listing all activities performed.
3. subject_test.txt: This the training data set, consisted of one varialbe - V1, lists the subject who performed the activity for each window sample. Its range is from 1 to 30.
4. x_training.txt: This is the training data set containing 561 features, each in its own column.
5. y_training.txt: This is the training data set listing all activities performed.
6. subject_training.txt: This the training data set is consisted of one varialbe - V1 (ID). It lists the subject who performed the activity for each window sample. Its range is from 1 to 30.
7. features.txt: This data set lists all features and is consisted of two variables - V1 (ID) and V2 (Description).
6. activity_labels.txt: This data set lists all activities and is consisted of two variables - V1 (ID) and V2 (Activity Name). 


## Identifiers

There are two identifiers for each test or training data set:
   * Subject: The ID of the test or training subject.
   * Activity: The type of activity performed when the corresponding measurements were taken.

## Activities

There are 6 activity types the subject could performed:
   * WALKING (ID = 1)
   * WALKING_UPSTAIRS (ID = 2)
   * WALKING_DOWNSTAIRS (ID = 3)
   * SITTING (ID = 4)
   * STANDING (ID = 5)
   * LAYING (ID = 6)


## Variables

There are 17 variables for each activity in the data set:
   * tBodyAcc - Body Accelerometer Time
   * tGravityAcc - Gravity Accelerometer Time
   * tBodyAccJerk - Body Accelerometer Jerk Time
   * tBodyGyro - Body Gyroscope Time
   * tBodyGyroJerk - Body Gyroscope Jerk Time
   * tBodyAccMag - Body Accelerometer Magnitude Time
   * tGravityAccMag - Gravity Accelerometer Magnitude Time
   * tBodyAccJerkMag - Body Accelerometer Jerk Magnitude Time
   * tBodyGyroMag - Body Gyroscope Magnitude Time
   * tBodyGyroJerkMag - Body Gyroscope Jerk Magnitude Time
   * fBodyAcc - Body Accelerometer Frequency
   * fBodyAccJerk - Accelerometer Jerk Frequency
   * fBodyGyro - Body Gyroscope Frequency
   * fBodyAccMag - Body Accelerometer Magnitude Frequency
   * fBodyAccJerkMag - Body Accelerometer Jerk Magnitude Frequency
   * fBodyGyroMag - Body Gyroscope Magnitude Frequency
   * fBodyGyroJerkMag - Body Gyroscope Jerk Magnitude Frequency


## Measurements

There are 16 measurements in the input data set and we only extract mean and standard deviation in the script to produce the output data set.
