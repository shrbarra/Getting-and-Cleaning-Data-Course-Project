library(dplyr)
library(data.table)

run_analysis <- function(){

setwd("./UCI HAR Dataset") #Presumes that the dataset is located in the current WD

#1.1) Importing the Labels for Activity and Features
activity_ref <- read.table("./activity_labels.txt", sep=" ", col.names = c("refAct","Activity"))
features <- read.table("./features.txt", colClasses = c("NULL","character"), sep=" ")

#1.2) Importing subjects
train_set <- read.table("./train/subject_train.txt", col.names = "Subject", colClasses = "numeric")
test_set <- read.table("./test/subject_test.txt", col.names = "Subject", colClasses = "numeric")

#2.1) Creating a vector with activities references
activity_sets <- read.table("./train/y_train.txt",col.names = "refAct", colClasses = "numeric") %>%
     rbind(read.table("./test/y_test.txt",  col.names = "refAct", colClasses = "numeric"))

#2.2) Matching the activity's numbers with their names
activity_named <- left_join(activity_sets, activity_ref, by="refAct") %>% select(-refAct)

#3) Importing the measurements
set_measures <- read.table("./train/X_train.txt", col.names = features$V2, colClasses = "numeric") %>%
     rbind(read.table("./test/X_test.txt",col.names = features$V2, colClasses = "numeric"))

#4) Creating one dataset: TRAIN + TEST and cbind's named activities and the measurements
merged_set <- rbind(train_set,test_set) %>% cbind(activity_named) %>% cbind(set_measures)

#5.1) Selecting cols with mean() or std()
pos <- grep(".*mean().*|.*std().*", names(merged_set))
X_MeanStd <- select(merged_set,Subject,Activity,pos)

#5.2) Using descriptive variable names
names(X_MeanStd) <- gsub("^t","Time",names(X_MeanStd))
names(X_MeanStd) <- gsub("^f","Frequency",names(X_MeanStd))
names(X_MeanStd) <- gsub("Acc","Acceleration",names(X_MeanStd))
names(X_MeanStd) <- gsub("Gyro","Gryoscope",names(X_MeanStd))
names(X_MeanStd) <- gsub("\\(\\)","",names(X_MeanStd))
names(X_MeanStd) <- gsub("Mag","Magnitude",names(X_MeanStd))
names(X_MeanStd) <- gsub("std","StandardDeviation",names(X_MeanStd))
names(X_MeanStd) <- gsub("med","Median",names(X_MeanStd))
names(X_MeanStd) <- gsub("sma","SignalMagnitude",names(X_MeanStd))
names(X_MeanStd) <- gsub("iqr","InterquartileRange",names(X_MeanStd))

#6) Grouping Subject and Activity from merged_set
final_set <- X_MeanStd %>% group_by(Subject,Activity) %>% summarise_all(.funs = mean)

#7) Exporting the final_set to a txt file
write.table(final_set, file = "tidy_data.txt",row.name=FALSE)
}

run_analysis()