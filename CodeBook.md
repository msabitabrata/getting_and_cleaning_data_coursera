# Description
The `run_analysis.R` performs the below activity

1. Load the data from `features.txt` to a variable named `features`
2. Extract the feature data for mean and standard deviation. The index of the matched features is stored in `features_matched` and the names are stored in `features_matched_names`
3. Extract the data from `activity_labels.txt` and create a lookup variable `lookup_activity` with the data. The lookup table is required to convert the activity levels to activity names
4. Load the training data set into the variables `train_X`, `train_Y` and `train_subjects`. Then `training` data set has been created by binding the `features_matched` columns of `train_X`, `train_Y` and `train_subjects`
5. Load the testing data set into the variables `test_X`, `test_Y` and `test_subjects`. Then `testing` data set has been created by binding the `features_matched` columns of `test_X`, `test_Y` and `test_subjects`
6. Create a combined data set with the training and testing data together
7. Set up the column names of the combined data set with the first two columns as 'subject' and 'activity; the rest of the column names are `features_matched_names`
8. Look up the `lookup_activity` table and convert the activity column of combined data to the activity name
9. Calculate the mean by grouping the combined data with respect to subject and activity
10. Write the data to a text file `tidy.txt`
