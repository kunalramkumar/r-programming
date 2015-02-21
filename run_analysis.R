library(dplyr)

# Function that loads and combines test and train files
load_combine_data <- function (test_file, train_file) {
	test <- read.table(test_file)
	train <- read.table(train_file)
	rbind(test, train)
}

# Assign Data Directories
dir_data_test = "UCI HAR Dataset//test/"
dir_data_train = "UCI HAR Dataset//train/"

# Generate Activity data
activity <- load_combine_data(paste0(dir_data_test, "y_test.txt"), paste0(dir_data_train, "y_train.txt"))
# Load Activity names
activity_names <- read.table("UCI HAR Dataset//activity_labels.txt")
# Name the activities in the data set
activity <- merge(activity, activity_names, by = "V1")
activity <- select(activity, V2)
names(activity) <- "activity"

# Generate Features data
features <- load_combine_data(paste0(dir_data_test, "X_test.txt"), paste0(dir_data_train, "X_train.txt"))
# Load Features labels
features_labels <- read.table("UCI HAR Dataset//features.txt")
# Label the Features in the data set
names(features) <- features_labels$V2

# Generate Subject data
subject <- load_combine_data(paste0(dir_data_test, "subject_test.txt"), paste0(dir_data_train, "subject_train.txt"))
names(subject) <- "subject"

# Merge all three data frames
df_subject_activity <- cbind(subject, activity)
dfMerged <- cbind(df_subject_activity, features)

# Get Mean and Standard Deviation features
cols_mean_std <- colnames(dfMerged)[grep(".-(mean|std)\\(\\)", colnames(dfMerged))]
dfFinal <- subset(dfMerged, select=c("subject","activity", cols_mean_std))

# Expand columns names
names(dfFinal) <- gsub("Acc", "Accelerometer", names(dfFinal))
names(dfFinal) <- gsub("Gyro", "Gyroscope", names(dfFinal))
names(dfFinal) <- gsub("Mag", "Magnitude", names(dfFinal))
names(dfFinal) <- gsub("^t", "time", names(dfFinal))
names(dfFinal) <- gsub("^f", "frequency", names(dfFinal))
names(dfFinal) <- gsub("BodyBody", "Body", names(dfFinal))

# Compute average of features for subject and activity
clean_data <- dfFinal %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# Write tidy data to file
write.table(clean_data, "tidy_data.txt", row.names = FALSE, sep = ',')