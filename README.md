---
title: "README"
author: "Petra"
date: "2023-01-06"
output: github_document
---

# Project Description:

Getting and Cleaning data course project in the Johns Hopkins University Data Science Specialization\
Collect and clean data from the study: <https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>\
Transform the cleaned data set into a tidy data set that shows averages per subject per activity in a table. The table must comply with the rules for tidy data: each variable is a column, each observation is a row, and each type of observational unit is a table.

# Files and scripts in project directory

**Readme.md**: General information about source files and original study design. For data-specific information and transformations done, see CookBook.md\
**CodeBook.md**: Describes the data sources,variables, transformations\
**run_analysis.R**: Script to collect, clean and summarize data as prescribed\
**tidydataset.txt**: The resulting tidy data set with averages for all mean() and std() variables per subject per activity\

# Data processing

## Collection of the raw data

The following raw data files were downloaded from the study link into folders as shown:\

.\getdata\_projectfiles_UCI HAR Dataset\UCI HAR Dataset:\
**activity_labels.txt**: The integer to activity mapping for the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) that each subject performed\
**features.txt**: List of all 561 features in X_train and X_test\

.\getdata\_projectfiles_UCI HAR Dataset\UCI HAR Dataset\train:\
**subject_train.txt**: An integer representing the subject who performed the activity for each observation of the 7352 observations in the training data set. There are 21 subjects in the training data set.\
**X_train.txt**: The 561 variables for 7352 observations in the training data set\
**y_train.txt**: An integer label for each observation in the training data. The number can be looked up in activity_labels.txt to get the corresponding activity ((WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)\

.\getdata\_projectfiles_UCI HAR Dataset\UCI HAR Dataset\test:\
**subject_test.txt**: An integer representing the subject who performed the activity for each observation of the 2947 observations in the Test data set. There are 9 subjects in the test data set\
**X_test.txt**: The 561 variables for 2947 observations in the test data set\
**y_test.txt**: An integer label for each observation in the test data. The number can be looked up in activity_labels.txt to get the corresponding activity ((WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

## Processing of the raw data

### Programming Assignment instructions:

Download data from the above link\
Merge training and test set\
Extract the mean() and Std() measurements/variables/columns. (Subset the columns to keep only these variables)\
Add descriptive activity column to label activity(WALKING ,WALKING_UPSTAIRS ,WALKING_DOWNSTAIRS ,SITTING ,STANDING ,LAYING )\
Add column names to label this subset of the data with descriptive variable names

### Steps in run_analysis.R to accomplish the above instructions:

Read the data (downloaded from the above link) into R with read.table commands\
Name columns with descriptive names: Use naming convention provided in features.txt for X_train and X_test, but remove dashes, full stops,commas to make more readable. Keep abbreviations, for example acc=acceleration(further explanations below), to avoid descriptions that are too long\
For train data: Combine Subject, Train , Activity columns\
For test data: Combine Subject, Test , Activity columns\
Add activity description by merging with activity labels (Note that this may reorder rows)\
Combine Train and test rows\
Subset the columns so that only the subject, activity and columns with mean() and std() in column names remain\
Write to cleaned data set. Dimensions:10 299 rows, 68 columns\

# Creating the tidy data file

## Programming Assignment instructions:

Use the cleaned data set to build a tidy data set that contains average of each variable for each activity and each subject

## Steps in run_analysis.R to build tidy data set as per instruction

Instruction: Use the cleaned data set to build a tidy data set that contains: average of each variable for each activity and each subject\
Remove brackets from names to be able to use the colmeans function to average the fields\
Choose columns to avg, namely all the columns that contain the words mean or std\
Group cleaned data set by subject and activity\
Use colMeans in a sapply to average the columns. Transpose result into data frame\
Rownames will be in the format subject.activity, add subject.activity as first column of new data frame containing the averaged data\
Split subject and activity into 2 columns\
Write tidy data set to table tidydataset\
The tidy data set can be read using:\
tidyresult\<-read.table("./tidydataset.txt", header = TRUE)\
head(tidyresult)\

## Summary of data tranformations:

Source tables: activity_labels.txt,features.txt,subject_train.txt,X_train.txt,y_train.txt,subject_test.txt,X_test.txt,y_test.txt\
Cleaned data set variables: subject,activity, all mean() and std() variables, including magnitude mean and magnitude std variables\
Tidy data set: average the mean and std per subject and activity of Acc,gravityAcc, AccJerk,Gyro, GyroJerk variables from time and frequency domains in 3 axial directions, as well as the average of the magnitudes\
Transformation/Summary type: Average per subject per activity\
Filter: no filter\

# Information from the original study design

Human Activity Recognition Using Smartphones Dataset Version 1.0 ================================================================== Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. [activityrecognition\@smartlab.ws](mailto:activityrecognition@smartlab.ws){.email} www.smartlab.ws ==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

## For each record the following is provided:

-   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
-   Triaxial Angular velocity from the gyroscope.
-   A 561-feature vector with time and frequency domain variables.
-   Its activity label.
-   An identifier of the subject who carried out the experiment.

## The dataset includes the following files:

-   'README.txt'

-   'features_info.txt': Shows information about the variables used on the feature vector.

-   'features.txt': List of all features.

-   'activity_labels.txt': Links the class labels with their activity name.

-   'train/X_train.txt': Training set.

-   'train/y_train.txt': Training labels.

-   'test/X_test.txt': Test set.

-   'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

-   'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

-   'train/Inertial Signals/total_acc_x\_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x\_train.txt' and 'total_acc_z\_train.txt' files for the Y and Z axis.

-   'train/Inertial Signals/body_acc_x\_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

-   'train/Inertial Signals/body_gyro_x\_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Notes:

-   Features are normalized and bounded within [-1,1].
-   Each feature vector is a row on the text file.

For more information about this dataset contact: [activityrecognition\@smartlab.ws](mailto:activityrecognition@smartlab.ws){.email}

## License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
