# Getting and Cleaning Data: Code Book

This document is codebook for the Course Project in Getting and Cleaning Data. 

### Functions

The function load_combine_data is responsible for loading the test and train files using read.table and combining them into a single data frame using rbind

### Variables

The variables used in this script are named according to the data that they store in order to ensure readability. Ex - activity holds the activity related information, features_labels holds all labels for the features in our data

### Constants

Data Directories are stored in the following variables

* dir_data_test = "UCI HAR Dataset//test/"
* dir_data_train = "UCI HAR Dataset//train/"

### Logic

The script performs the following activities in order

* Generate Activity data
* Load Activity names
* Name the activities in the data set
* Generate Features data
* Load Features labels
* Label the Features in the data set
* Generate Subject data
* Merge all three data frames
* Get Mean and Standard Deviation features
* Expand columns names
* Compute average of features for subject and activity
* Write tidy data to file

The final output looks like - 
```{r}
> head(dfFinal[1:4], 3)
  subject activity timeBodyAccelerometer-mean()-X timeBodyAccelerometer-mean()-Y
1       2  WALKING                      0.2571778                    -0.02328523
2       2  WALKING                      0.2860267                    -0.01316336
3       2  WALKING                      0.2754848                    -0.02605042
```

## Generating output

Creates the a file called tidy_data.txt that contains the final "cleansed" output in the current working directory using the write.table function