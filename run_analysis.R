# Load the data from 'features.txt' to a variable named features
features <- read.table("UCI HAR Dataset/features.txt")

# Extract the feature data for mean and standard deviation
features_matched <- grep(".*mean.*|.*std.*", features[,2])
features_matched_names <- features[features_matched,2]

# Extract the data from 'activity_labels.txt' and create a lookup variable with the data. The lookup table is required to convert the activity levels to activity names
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")
lookup_activity <- setNames(activity_labels[,1],activity_labels[,2])

# Load the training data set
# Training Data
train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
# Training Data Activity Level
train_Y <- read.table("UCI HAR Dataset/train/y_train.txt")
# Training Data Subjects
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Creating the training data
training <- cbind(train_subjects, train_Y, train_X[features_matched])


# Load the testing data set
# Testing Data
test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
# Testing Data Activity Level
test_Y <- read.table("UCI HAR Dataset/test/y_test.txt")
# Testing Data Subjects
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Creating the testing data
testing <- cbind(test_subjects, test_Y, test_X[features_matched])

# Combining the training and testing data
combined_data <- rbind(training, testing)

# Setting the column names of the combined data
colnames(combined_data) <- c("subject", "activity", as.character(features_matched_names))

# Looking up the activity lookup table and convert the activity column of combined data to the activity name
combined_data$activity <- names(lookup_activity)[match(combined_data$activity , lookup_activity)]

# Calculating the mean by grouping the combined data with respect to subject and activity
total_cols <- ncol(combined_data)
tidy <- aggregate(combined_data[,3:total_cols], by = list(subject = combined_data$subject,activity = combined_data$activity), mean)

write.table(tidy, "tidy.txt", row.names = FALSE)