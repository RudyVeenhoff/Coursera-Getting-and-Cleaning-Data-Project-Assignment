
# Please make sure your working directory is set the directory containing the UCI HAR Dataset. See README.txt.

# Getting the training data and test data.
# Adding the corresponding columns "subject ID" and "Activity" to the training data and test data.
# Rowbinding training and test data.

trainingData <- read.table("./train/X_train.txt")
trainingActivityNumbered <- read.table("./train/y_train.txt")
trainingSubjectId<-read.table("./train/subject_train.txt")


testData <- read.table("./test/X_test.txt")
testActivityNumbered <- read.table("./test/y_test.txt")
testSubjectId<-read.table("./test/subject_test.txt")


completeTrainingData <- cbind(trainingSubjectId, trainingActivityNumbered,trainingData)
completeTestData <- cbind(testSubjectId,testActivityNumbered,testData)

completeData <-rbind(completeTrainingData,completeTestData)


# Selecting the necessary columns from the dataset; we only need 
# the mean and standard deviation.

features <- read.table("features.txt")
completeDataColNames <- c("Subject_ID", "Activity",as.character(features[,2]))
requiredColumns <- grep(".*mean.*|.*std.*|.*Subject.*|.*Activity.*",completeDataColNames)
requiredData <- completeData[,requiredColumns]

# Adding descriptive variable names.
# "-mean()-" becomes "Mean" and "-std()" becomes"Std".
# The time and frequency indicators have been written in full.
# Removed the typo "BodyBody" in the original data set.
# Removed the parentheses from the variable names.
requiredColumnsChar <- grep(".*mean.*|.*std.*|.*Subject.*|.*Activity.*",completeDataColNames, value=TRUE)
requiredColumnsChar <- gsub("-mean\\(\\)","Mean",requiredColumnsChar)
requiredColumnsChar <- gsub("-std\\(\\)","Std",requiredColumnsChar)
requiredColumnsChar <- gsub("^t","Time",requiredColumnsChar)
requiredColumnsChar <- gsub("^f","Frequency",requiredColumnsChar)
requiredColumnsChar <- gsub("BodyBody","Body",requiredColumnsChar)
requiredColumnsChar <- gsub("[()]","",requiredColumnsChar)
colnames(requiredData) <- requiredColumnsChar

# Changing the activity names. 1 becomes Walking, 2 becomes Walking Upstairs, etc.. 
activityNames <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
requiredData$Activity <- activityNames[requiredData$Activity]

# Creating an independent tidy data set with the average 
# of each variable for each activity and each subject.
library(plyr)
tidy = ddply(requiredData, c("Subject_ID","Activity"), numcolwise(mean))
names(tidy)[-c(1,2)] <- paste0("Mean", names(tidy)[-c(1,2)])
write.table(tidy, file = "tidyData.txt")
