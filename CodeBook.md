# original data
for detailed information of the original data, please refer to the 'features_info.txt' and 'readme.txt' in the original
downloaded files
## header info
activity_labels.txt, features.txt
## training data
x_train, y_train and subject_train: contain the training data from the downloaded files.
## test data
x_test, y_test and subject_test: contain the test data from the downloaded files.

# cleaning process
1. 3 files of the training data are joined together forming a data frame (testData) with 563 columns 
in the order of subject_train, x_train and y_train
2. 3 files of the test data are joined together forming a data frame (trainData) with 563 columns 
in the order of subject_test, x_test and y_test
3. testData and trainData are combined together (rbind) forming data frame df
4. column names of df is given according to the features.txt
5. columns in df on mean, std and IDs are selected into data frame df1
6. df1 is merged with activity_labels on same activity ID, giving each row a valid activity name
7. mean value of each row is calculated by their subject ID and activity ID
8. processed data is written to 'CleanData2.txt' in the current working directory


