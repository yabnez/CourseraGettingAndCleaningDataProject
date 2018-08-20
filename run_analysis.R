#
# Course Project for Getting and Cleaning Data
#

library(reshape2)
library(dplyr)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
zipFileName <- "getdata_dataset.zip"
dataDir <- "UCI HAR Dataset"

#
## P1. Download and unzip the project data
#

if (!file.exists(zipFileName))  download.file(fileURL, zipFileName)
if (!file.exists(dataDir))      unzip(zipFileName)

#
## P2. Read original data
#

# for debug, comment out when completed
if (!exists("trainS")) {
# for debug

# training data
trainS <- read.table(file.path(dataDir, "train", "subject_train.txt"))
trainV <- read.table(file.path(dataDir, "train", "X_train.txt"))
trainA <- read.table(file.path(dataDir, "train", "y_train.txt"))

# test data
testS  <- read.table(file.path(dataDir, "test", "subject_test.txt"))
testV  <- read.table(file.path(dataDir, "test", "X_test.txt"))
testA  <- read.table(file.path(dataDir, "test", "y_test.txt"))

# features
features <- read.table(file.path(dataDir, "features.txt"), as.is=TRUE)

# activity labels
activities <- read.table(file.path(dataDir, "activity_labels.txt"))

# for debug, comment out when completed
}
# for debug

#
#  1. Merges the training and the test sets to create one data set.
#

# concatenate tables to single table
huAct <- rbind(cbind(trainS, trainV, trainA),
               cbind(testS,  testV,  testA))

# assign column names
colnames(huAct) <- c("subject", features[, 2], "activity")

#
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#
# determine columns of dataset.
huAct <- huAct[, grepl("subject|activity|mean|std", colnames(huAct))]

#
# 3. Uses descriptive activity names to name the activities
#    in the data set
#

# replace activity values with named factor levels
huAct$activity <- 
  factor(huAct$activity, 
         levels = activities[, 1], labels = activities[, 2])

#
# 4. Appropriately labels the data set with descriptive variable names.
#

# get column names and remove special characters
huActCols <- colnames(huAct)
huActCols <- gsub("[\\(\\)-]", "", huActCols)

# clean up names
huActCols <- gsub("Acc",      "-Accelerometer", huActCols)
huActCols <- gsub("Freq",     "-Frequency", huActCols)
huActCols <- gsub("Gyro",     "-Gyroscope", huActCols)
huActCols <- gsub("Mag",      "-Magnitude", huActCols)
huActCols <- gsub("mean",     "-Mean", huActCols)
huActCols <- gsub("std",      "-StandardDeviation", huActCols)
huActCols <- gsub("X$",       "-X", huActCols)
huActCols <- gsub("Y$",       "-Y", huActCols)
huActCols <- gsub("Z$",       "-Z", huActCols)
huActCols <- gsub("^f",       "FrequencyDomain", huActCols)
huActCols <- gsub("^t",       "TimeDomain", huActCols)

huActCols <- gsub("BodyBody", "Body", huActCols)
huActCols <- gsub("Body",     "-Body", huActCols)

colnames(huAct) <- huActCols

#
# 5. From the data set in step 4, creates a second, independent
#    tidy data set with the average of each variable for each
#    activity and each subject.
#

# group by subject and activity, and take average
huActMeans <- huAct %>% 
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

# output to file "tidy.txt"
write.table(huActMeans, "tidy.txt", row.names=FALSE, quote=FALSE)

