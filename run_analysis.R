#
# Course Project for Getting and Cleaning Data
#

# library setup
library(reshape2)
library(dplyr)
library(zip)

#
## P1. Download and unzip the project data
#
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
zipName <- "getdata.zip"
dataDir <- "UCI HAR Dataset"

if (!file.exists(zipName)) download.file(fileURL, zipName)
if (!file.exists(dataDir)) unzip(zipName)

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

# features & activity labels
feat   <- read.table(file.path(dataDir, "features.txt"), as.is=TRUE)
acts   <- read.table(file.path(dataDir, "activity_labels.txt"))

# for debug, comment out when completed
}
# for debug

#
#  1. Merges the training and the test sets to create one data set.
#

# concatenate tables to single table
allAct <- rbind(cbind(trainS, trainV, trainA), cbind(testS,  testV,  testA))

# assign column names
colnames(allAct) <- c("subject", feat[, 2], "activity")

#
# 2. Extracts only the measurements on the mean and standard deviation
#    for each measurement.
#
# select dataset
allAct <- allAct[, grepl("subject|activity|mean|std", colnames(allAct))]

#
# 3. Uses descriptive activity names to name the activities
#    in the data set
#

# activity values to levels and labels
allAct$activity <- 
  factor(allAct$activity, levels = acts[, 1], labels = acts[, 2])

#
# 4. Appropriately labels the data set with descriptive variable names.
#

# clean up names
cols <- colnames(allAct)
cols <- gsub("[\\(\\)-]", "", cols)
cols <- gsub("Acc",       "-Accelerometer", cols)
cols <- gsub("Freq",      "-Frequency", cols)
cols <- gsub("Gyro",      "-Gyroscope", cols)
cols <- gsub("Mag",       "-Magnitude", cols)
cols <- gsub("mean",      "-Mean", cols)
cols <- gsub("std",       "-StandardDeviation", cols)
cols <- gsub("X$",        "-X", cols)
cols <- gsub("Y$",        "-Y", cols)
cols <- gsub("Z$",        "-Z", cols)
cols <- gsub("^f",        "FrequencyDomain", cols)
cols <- gsub("^t",        "TimeDomain", cols)
cols <- gsub("BodyBody",  "Body", cols) # typo fixed
cols <- gsub("Body",      "-Body", cols)

colnames(allAct) <- cols

#
# 5. From the data set in step 4, creates a second, independent
#    tidy data set with the average of each variable for each
#    activity and each subject.
#

# group by subject and activity, and take average for each
average <- allAct %>% 
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

# result to "tidy.txt"
write.table(average, "tidy.txt", row.names=FALSE, quote=FALSE)
message("\n###\nproject completed!\n###\n")
