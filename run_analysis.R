#Step 1.Merges the test and train  raw file from .txt to create one dataset in R.

## 1.1 Reading files that have been downloaded

### 1.1.1  Reading train raw data:
#first get the directory using getwd function
getwd() 

train_x <- read.table("E:/BELAJAR CODING/R/COURSERA/Samsung/UCI HAR Dataset/train/x_train.txt")
train_y <- read.table("E:/BELAJAR CODING/R/COURSERA/Samsung/UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("E:/BELAJAR CODING/R/COURSERA/Samsung/UCI HAR Dataset/train/subject_train.txt")


### 1.1.2 Reading test raw data:
test_x <- read.table("E:/BELAJAR CODING/R/COURSERA/Samsung/UCI HAR Dataset/test/x_test.txt")
test_y <- read.table("E:/BELAJAR CODING/R/COURSERA/Samsung/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("E:/BELAJAR CODING/R/COURSERA/Samsung/UCI HAR Dataset/test/subject_test.txt")

### 1.1.3 Reading features raw data:
features <- read.table('E:/BELAJAR CODING/R/COURSERA/Samsung/UCI HAR Dataset/features.txt')

### 1.1.4 Reading activity labels raw data:
activity_labels <- read.table('E:/BELAJAR CODING/R/COURSERA/Samsung/UCI HAR Dataset/activity_labels.txt')

## 1.2 change the train and tes column names :

colnames(train_x) <- features[,2]
colnames(train_y) <-"activityId"
colnames(train_subject) <- "subjectId"

colnames(test_x) <- features[,2] 
colnames(test_y) <- "activityId"
colnames(test_subject) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityType')

##1.3 Merging all table data in one dataset in unite_all variable:

train_merge <- cbind(train_y, train_subject, train_x)
test_merge <- cbind(test_y, test_subject, test_x)
unite_all <- rbind(train_merge, test_merge)

#check the dimension for unite_all data
dim(unite_all)



#Step 2.Choose the measurements of mean and standart deviation each of the measurement'variable

##2.1 Save the column names of unite_all data to colNames variable:

colNames <- colnames(unite_all)

##2.2 Create temporary logical vector for defining activity ID, subject ID, mean and standard deviation:

mean_and_std <- (grepl("activityId" , colNames) | 
                       grepl("subjectId" , colNames) | 
                       grepl("mean.." , colNames) | 
                       grepl("std.." , colNames) 
)

##2.3 Making subset which is needed to analyse from unite_all and save it to subsetForMeanAndStd variable:

subsetForMeanAndStd <- unite_all[ , mean_and_std == TRUE]

#Step 3. Uses descriptive activity names to name the activities in the data set


subsetWithActivityNames <- merge(subsetForMeanAndStd, activity_labels,
                              by='activityId',
                              all.x=TRUE)

#Step 4. Appropriately labels the data set with descriptive variable names.

#Done in previous steps, see 1.3,2.2 and 2.3!

#Step 5. From the data set in step 4, creates  independent tidy data set with the average of each variable for each activity and each subject.

##5.1 Making the tidy data set

TidySet <- aggregate(. ~subjectId + activityId, subsetWithActivityNames, mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]

##5.2 Writing and Save tidy data set in txt file named Tidyset.txt
write.table(TidySet, "TidySet.txt", row.name=FALSE)







