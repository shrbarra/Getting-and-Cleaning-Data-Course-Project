## Run_analysis() function as part of the course project from Coursera's Getting and Cleaning
Data Course from Johns Hopkins University.
This function takes data from [Human Activity Recognition dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

It reads TRAIN (X_train.txt) and TEST (X_test.txt) datasets, merges both and filters the information for measurements 
including mean and standard deviation transformations. Then, it assigns descriptive labels to all columns andsaves the
file as tidy_data.txt into the current directory.

## The run.analysis.R runs as the following:
Presumes that the dataset is located in the current WD so it sets the WD as "./UCI HAR Dataset".

1) Imports the Labels for Activity and Features.
2) Imports subjects.
3) Creates a vector with activities references.
4) Matches the activity's numbers with their names.
5) Imports the measurements.
6) Creates one dataset: TRAIN + TEST and cbind's named activities and the measurements.
7) Selects cols with mean() or std().
8) Use descriptive variable names
9) Groups Subject and Activity from merged_set.
10) Exports the final_set to a txt file.

More information about the dataset can be found in the Human Activity Recognition dataset within the files: README.txt, 
features.txt, features_info.txt and activity_labels.txt.
