# R-Programming
## Getting and Cleaning Data: Course Project

### The R script run_analysis.R does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Finally, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### Please ensure that the code is placed in the same directory as the data

#### The data directories for the test and training files are stored in the following variables
* dir_data_test = "UCI HAR Dataset//test/"
* dir_data_train = "UCI HAR Dataset//train/"

#### The script processes the input files present in the locations mentioned above and generates a tidy data set called tidy_data.txt in the current working directory