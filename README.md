# GettingDataAssignment
Course Project for Getting and Cleaning Data
Data location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### The process
The code checks if the data downloaded and saved in the current working directory under the folder of 'UCI HAR Dataset', if not exist, the code will download and unzip the data automatically. The downloaded file will be removed automatically after unzip.

run_analysis.R contains all the code to for all 5 steps required in the assignment. These 5 steps are:

1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement. 

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names. 

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output of the 5th step is saved as averageData.txt.

### Codebook
Please find information about the variables, data and transformations in the CodeBook.MD file.
