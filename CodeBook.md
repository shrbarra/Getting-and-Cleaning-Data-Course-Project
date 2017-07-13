# Run_analysis() function as part of the course project from Coursera's Getting and Cleaning
Data Course from Johns Hopkins University
This function takes data from [Human Activity Recognition dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## The variable names are the following:
* activity_ref: reference table for activity names (activity_labels.txt).
* features: columns names for the measurements (features.txt).
* train_set: train subjects (subject_train.txt).
* test_set: test subjects (subjects_test.txt).
* activity_sets: contains activity references (numbers) from both datasets (y_train.txt and y_test.txt).
* activity_named: matched the activity's numbers (from activity_sets) with their names.
* set_measures: imported both datasets (X_train.txt and X_test.txt) into one.
* merged_set: merged set_measures with activity_named and set_measures.
* pos: positions where the measurements are mean() or std() tranformations.
* X_MeanStd: table containing subject, activity and mean() or std() tranformations.
* final_set: tidy and summarised (average of measurements) data from X_MeanStd, but with descriptive variable names and 
grouped by subject and activity.

## Transformations on column labels:
*t -> Time.
*f -> Frequency.
*Acc -> Acceleration.
*Gyro -> Gryoscope.
*() -> "".
*Mag -> Magnitude.
*std -> StandardDeviation.
*med -> Median.
*sma -> SignalMagnitude.
*iqr -> InterquartileRange.

More information about the dataset can be found in the Human Activity Recognition dataset within the files: README.txt, 
features.txt, features_info.txt and activity_labels.txt.
