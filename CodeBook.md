**Title**: Codebook for Getting and Cleaning data course project in the Johns Hopkins University Data Science Specialization\
**Author**: Petra\
**Date**:2023-01-06\

# Project Description:

Collect and clean data from the study: <https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>\
Collect data,clean data, and build a tidy data set with each observation containing subject, activity, and 66 columns(variables) that each contain the average (per subject per activity ) of the mean() and Std() variables in the original data set\

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

## Variables in the tidy data set

Each observation contains subject, activity, and 66 variables that each contain the average (per subject per activity ) of the mean() and Std() variables in the cleaned data set\
The tidy data set can be read using:\
tidyresult\<-read.table("./tidydataset.txt", header = TRUE)\
head(tidyresult)\
Dimensions: 180 rows, 68 columns\
Uniq values: each subject has one row(observation) for each activity

## Descriptions for variables in tidy data set

**subject**: integer number from 1 to 30\
**activity**: one of the following list of descriptions to label the action performed:WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING\
**Summary variables**: 66 features each containing the average (per subject per activity ) of the mean() and Std() variables provided by the original study\
**Unit of measurement**:the data is normalized and bounded by [-1,1] in the Euclidean space. Detail and original unit of measure shown below

### Time domain variables:

The average (per subject per activity)of the normalised mean() and std() features of the following time domain(indicated by prefix t) values:\

**body motion acceleration component**: tBodyAcc-X,tBodyAcc-Y,tBodyAcc-Z with original unit of measure as g = gravity of earth =9.80665 meter/second squared\

|                                             | **Cleaned data set**                      | **Tidy data set(Average per subject activity)**    |
|-----------------------|----------------------|---------------------------|
| **mean** of X, Y, Z signals                 | tBodyAccmeanX,tBodyAccmeanY,tBodyAccmeanZ | AvgtBodyAccmeanX,AvgtBodyAccmeanY,AvgtBodyAccmeanZ |
| **std** of X, Y, Z signals                  | tBodyAccstdX,tBodyAccstdY,tBodyAccstdZ    | AvgtBodyAccstdX,AvgtBodyAccstdY,AvgtBodyAccstdZ    |
| **magnitude** for the 3-axial signals' mean | tBodyAccMagmean                           | AvgtBodyAccMagmean                                 |
| **magnitude** for the 3-axial signals' std  | tBodyAccMagstd                            | AvgtBodyAccMagstd                                  |

**gravitational acceleration component**: tGravityAcc-X,tGravityAcc-Y,tGravityAcc-Z with original unit of measure as g = gravity of earth =9.80665 meter/second squared\

|                                             | **Cleaned data set**                               | **Tidy data set(Average per subject activity)**             |
|---------------------|------------------------|---------------------------|
| **mean** of X, Y, Z signals                 | tGravityAccmeanX,tGravityAccmeanY,tGravityAccmeanZ | AvgtGravityAccmeanX,AvgtGravityAccmeanY,AvgtGravityAccmeanZ |
| **std** of X, Y, Z signals                  | tGravityAccstdX,tGravityAccstdY,tGravityAccstdZ    | AvgtGravityAccstdX,AvgtGravityAccstdY,AvgtGravityAccstdZ    |
| **magnitude** for the 3-axial signals' mean | tGravityAccMagmean                                 | AvgtGravityAccMagmean                                       |
| **magnitude** for the 3-axial signals' std  | tGravityAccMagstd                                  | AvgtGravityAccMagstd                                        |

**change in acceleration per second**: tBodyAccJerk-X,tBodyAccJerk-Y,tBodyAccJerk-Z with original unit of measure as g/second\

|                                             | **Cleaned data set**                                  | **Tidy data set(Average per subject activity)**                |
|--------------------|------------------------|----------------------------|
| **mean** of X, Y, Z signals                 | tBodyAccJerkmeanX,tBodyAccJerkmeanY,tBodyAccJerkmeanZ | AvgtBodyAccJerkmeanX,AvgtBodyAccJerkmeanY,AvgtBodyAccJerkmeanZ |
| **std** of X, Y, Z signals                  | tBodyAccJerkstdX,tBodyAccJerkstdY,tBodyAccJerkstdZ    | AvgtBodyAccJerkstdX,AvgtBodyAccJerkstdY,AvgtBodyAccJerkstdZ    |
| **magnitude** for the 3-axial signals' mean | tBodyAccJerkMagmean                                   | AvgtBodyAccJerkMagmean                                         |
| **magnitude** for the 3-axial signals' std  | tBodyAccJerkMagstd                                    | AvgtBodyAccJerkMagstd                                          |

**angular velocity**: tBodyGyro-X,tBodyGyroY,tBodyGyro-Z with original unit of measure as radians/second\

|                                             | **Cleaned data set**                         | **Tidy data set(Average per subject activity)**       |
|----------------------|-----------------------|---------------------------|
| **mean** of X, Y, Z signals                 | tBodyGyromeanX,tBodyGyromeanY,tBodyGyromeanZ | AvgtBodyGyromeanX,AvgtBodyGyromeanY,AvgtBodyGyromeanZ |
| **std** of X, Y, Z signals                  | tBodyGyrostdX,tBodyGyrostdY,tBodyGyrostdZ    | AvgtBodyGyrostdX,AvgtBodyGyrostdY,AvgtBodyGyrostdZ    |
| **magnitude** for the 3-axial signals' mean | tBodyGyroMagmean                             | AvgtBodyGyroMagmean                                   |
| **magnitude** for the 3-axial signals' std  | tBodyGyroMagstd                              | AvgtBodyGyroMagstd                                    |

**angular velocity per second**: tBodyGyroJerk-X,tBodyGyroJerk-Y,tBodyGyroJerk-Z with original unit of measure as radians/second squared\

|                                             | **Cleaned data set**                                     | **Tidy data set(Average per subject activity)**                   |
|-------------------|-------------------------|----------------------------|
| **mean** of X, Y, Z signals                 | tBodyGyroJerkmeanX,tBodyGyroJerkmeanY,tBodyGyroJerkmeanZ | AvgtBodyGyroJerkmeanX,AvgtBodyGyroJerkmeanY,AvgtBodyGyroJerkmeanZ |
| **std** of X, Y, Z signals                  | tBodyGyroJerkstdX,tBodyGyroJerkstdY,tBodyGyroJerkstdZ    | AvgtBodyGyroJerkstdX,AvgtBodyGyroJerkstdY,AvgtBodyGyroJerkstdZ    |
| **magnitude** for the 3-axial signals' mean | tBodyGyroJerkMagmean                                     | AvgtBodyGyroJerkMagmean                                           |
| **magnitude** for the 3-axial signals' std  | tBodyGyroJerkMagstd                                      | AvgtBodyGyroJerkMagstd                                            |

### Frequency domain variables:

The average (per subject per activity)of the normalised mean() and std() features of the following frequency domain(indicated by prefix f) FFT values:\

**body motion acceleration component**: fBodyAcc-X,fBodyAcc-Y,fBodyAcc-Z with original unit of measure as g = gravity of earth =9.80665 meter/second squared\

|                                             | **Cleaned data set**                      | **Tidy data set(Average per subject activity)**    |
|-----------------------|----------------------|---------------------------|
| **mean** of X, Y, Z signals                 | fBodyAccmeanX,fBodyAccmeanY,fBodyAccmeanZ | AvgfBodyAccmeanX,AvgfBodyAccmeanY,AvgfBodyAccmeanZ |
| **std** of X, Y, Z signals                  | fBodyAccstdX,fBodyAccstdY,fBodyAccstdZ    | AvgfBodyAccstdX,AvgfBodyAccstdY,AvgfBodyAccstdZ    |
| **magnitude** for the 3-axial signals' mean | fBodyAccMagmean                           | AvgfBodyAccMagmean                                 |
| **magnitude** for the 3-axial signals' std  | fBodyAccMagstd                            | AvgfBodyAccMagstd                                  |

**change in acceleration per second**: fBodyAccJerk-X,fBodyAccJerk-Y,fBodyAccJerk-Z with original unit of measure as g/second\

|                                             | **Cleaned data set**                                  | **Tidy data set(Average per subject activity)**                |
|--------------------|------------------------|----------------------------|
| **mean** of X, Y, Z signals                 | fBodyAccJerkmeanX,fBodyAccJerkmeanY,fBodyAccJerkmeanZ | AvgfBodyAccJerkmeanX,AvgfBodyAccJerkmeanY,AvgfBodyAccJerkmeanZ |
| **std** of X, Y, Z signals                  | fBodyAccJerkstdX,fBodyAccJerkstdY,fBodyAccJerkstdZ    | AvgfBodyAccJerkstdX,AvgfBodyAccJerkstdY,AvgfBodyAccJerkstdZ    |
| **magnitude** for the 3-axial signals' mean | fBodyAccJerkMagmean                                   | AvgfBodyAccJerkMagmean                                         |
| **magnitude** for the 3-axial signals' std  | fBodyAccJerkMagstd                                    | AvgfBodyAccJerkMagstd                                          |

**angular velocity**: fBodyGyro-X,fBodyGyroY,fBodyGyro-Z with original unit of measure as radians/second\

|                                             | **Cleaned data set**                         | **Tidy data set(Average per subject activity)**       |
|----------------------|-----------------------|---------------------------|
| **mean** of X, Y, Z signals                 | fBodyGyromeanX,fBodyGyromeanY,fBodyGyromeanZ | AvgfBodyGyromeanX,AvgfBodyGyromeanY,AvgfBodyGyromeanZ |
| **std** of X, Y, Z signals                  | fBodyGyrostdX,fBodyGyrostdY,fBodyGyrostdZ    | AvgfBodyGyrostdX,AvgfBodyGyrostdY,AvgfBodyGyrostdZ    |
| **magnitude** for the 3-axial signals' mean | fBodyGyroMagmean                             | AvgfBodyGyroMagmean                                   |
| **magnitude** for the 3-axial signals' std  | fBodyGyroMagstd                              | AvgfBodyGyroMagstd                                    |
| **magnitude** for Gyro/second mean          | fBodyGyroJerkMagmean                         | AvgfBodyGyroMagmean                                   |
| **magnitude** for Gyro/second std           | fBodyGyroJerkMagstd                          | AvgfBodyGyroMagstd                                    |

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
