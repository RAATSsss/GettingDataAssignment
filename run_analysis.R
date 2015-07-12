#download data if not existing
if(!file.exists('~/UCI HAR Dataset/')){
    print('file already exisitings, skip downloading')
} else{
    print('file not existing, start downloading')
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
    unzip(temp)
    unlink(temp)
}

#step 1 Merges the training and the test sets to create one data set.
#load data
features= read.table('~/UCI HAR Dataset/features.txt', colClasses = 'character'); #import features.txt
activityType = read.table('~/UCI HAR Dataset/activity_labels.txt', colClasses = 'character'); #import activity_labels.txt
#import files in test and train folder using file lists and lappy
testFiles <- list.files('~/UCI HAR Dataset/test', pattern = '*.txt') 
trainFiles <-list.files('~/UCI HAR Dataset/train', pattern = '*.txt')
testData <- data.frame(lapply(paste('~/UCI HAR Dataset/test/',testFiles,sep = ''), 
                              FUN = function(x) read.table(x, colClasses = 'numeric')))
trainData <- data.frame(lapply(paste('~/UCI HAR Dataset/train/',trainFiles,sep = ''),
                               FUN = function(x) read.table(x, colClasses = 'numeric')))
#bind the test and trian data
df<-rbind(testData, trainData)
colnames(df)<-c('subjectID', features$V2, 'ActivityID')

# step 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# Subset df select only mean and std info
df1 <- df[grep("-(mean|std)\\(\\)", colnames(df))]
df1$subjectID <- df$subjectID
df1$ActivityID <- df$ActivityID

#step 3 Uses descriptive activity names to name the activities in the data set
df2 <- merge(x = df1, y = activityType, by.x = 'ActivityID', by.y = 'V1') # merge data with activity type
df2 <- df2[,c(ncol(df2)-1, 1, ncol(df2), 2:(ncol(df2)-2))] # reorder columns, indexes to the front
#step 4 Appropriately labels the data set with descriptive variable names. 
names(df2)[names(df2) == 'V2'] <- 'ActivityName'
#step 5 From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.
meanData<-aggregate(df2[,4:ncol(df2)],list(df2$subjectID,df2$ActivityID,df2$ActivityName),mean)
write.table(meanData,row.names = FALSE)
