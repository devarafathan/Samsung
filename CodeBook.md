#Step 1.Merges the test and train  raw file from .txt to create one dataset in R.
## 1.1 Reading files that have been downloaded
### 1.1.1  Reading train raw data:
#first get the directory using getwd function
### 1.1.2 Reading test raw data:
### 1.1.3 Reading features raw data:
### 1.1.4 Reading activity labels raw data:
## 1.2 change the train and tes column names :
##1.3 Merging all table data in one dataset in unite_all variable:
#Step 2.Choose the measurements of mean and standart deviation each of the measurement'variable
##2.1 Save the column names of unite_all data to colNames variable:
##2.2 Create temporary logical vector for defining activity ID, subject ID, mean and standard deviation:
##2.3 Making subset which is needed to analyse from unite_all and save it to subsetForMeanAndStd variable:
#Step 3. Uses descriptive activity names to name the activities in the data set
#Step 4. Appropriately labels the data set with descriptive variable names
#Step 5. From the data set in step 4, creates  independent tidy data set with the average of each variable for each activity and each subject.
##5.1 Making the tidy data set
##5.2 Writing and Save tidy data set in txt file named Tidyset.txt




