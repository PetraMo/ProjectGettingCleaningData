**Title**: Codebook for Getting and Cleaning data course project in the Johns Hopkins University Data Science Specialization\
**Author**: Petra\
**Date**:2023-01-06\

# Project Description:

Collect and clean data from the study: <https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>\
Collect data,clean data, and build a tidy data set with each observation containing subject, activity, and 66 columns(variables) that each contain the average (per subject per activity ) of the mean() and Std() variables in the original data set\

## Raw data

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

## Variables in the tidy data set

Each observation contains subject, activity, and 66 variables that each contain the average (per subject per activity ) of the mean() and Std() variables in the cleaned data set\
The tidy data set can be read using:\
tidyresult\<-read.table("./tidydataset.txt", header = TRUE)\
head(tidyresult)\
Dimensions: 180 rows, 68 columns\
Uniq values: each subject has one row(observation) for each activity

## Descriptions for variables in tidy data set and their sources

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
