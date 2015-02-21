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

## Generating output

Creates the a file called tidy_data.txt that contains the final "cleansed" output in the current working directory using the write.table function