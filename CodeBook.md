# CodeBook

This CodeBook describes the variables, the data, and any transformations or work that it was performed to clean up the data.

## Data

### Raw Data

The raw data to clean up is downloaded from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

After unzip it, the files obtains are:

__activity\_labels.txt__ : code and label name for activities.

__features\_info.txt__ : codebook for the raw data movements.

__features.txt__ : code and name of all features.

__README.txt__ : Info, notes and license for raw data.

__test\\subject\_test.txt__ : Subject id for each row from data movements for test data.

__test\\X\_test.txt__ : All variables values for test data.

__test\\y\_test.txt__ : Activity for each row for test data.

__train\\subject\_train.txt__ : Subject id for each row from data movements for train data.

__train\\X\_train.txt__ : All variables values for train data.

__train\\y\_train.txt__ : Activity for each row for train data.

### Tidy Data

The tidy data is saved in the __result\_tidy.txt__ file.

## Variables

Variables definition in the tidy data set:

- Subject: id person that do the movements. Integer. Values from 1 to 30.

- Activity: label to describe the activiy for the person. Char. Posible values:
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

- Set of Variables: mean and standard desviation for mobile velocity and acceleration mobile variables for each subject and activity. Numeric. Values are normalize between -1 and 1. The variable names are:

"tBodyAcc.mean...X"               "tBodyAcc.mean...Y"              
"tBodyAcc.mean...Z"               "tBodyAcc.std...X"               
"tBodyAcc.std...Y"                "tBodyAcc.std...Z"               
"tGravityAcc.mean...X"            "tGravityAcc.mean...Y"           
"tGravityAcc.mean...Z"            "tGravityAcc.std...X"            
"tGravityAcc.std...Y"             "tGravityAcc.std...Z"            
"tBodyAccJerk.mean...X"           "tBodyAccJerk.mean...Y"          
"tBodyAccJerk.mean...Z"           "tBodyAccJerk.std...X"           
"tBodyAccJerk.std...Y"            "tBodyAccJerk.std...Z"           
"tBodyGyro.mean...X"              "tBodyGyro.mean...Y"             
"tBodyGyro.mean...Z"              "tBodyGyro.std...X"              
"tBodyGyro.std...Y"               "tBodyGyro.std...Z"              
"tBodyGyroJerk.mean...X"          "tBodyGyroJerk.mean...Y"         
"tBodyGyroJerk.mean...Z"          "tBodyGyroJerk.std...X"          
"tBodyGyroJerk.std...Y"           "tBodyGyroJerk.std...Z"          
"tBodyAccMag.mean.."              "tBodyAccMag.std.."              
"tGravityAccMag.mean.."           "tGravityAccMag.std.."           
"tBodyAccJerkMag.mean.."          "tBodyAccJerkMag.std.."          
"tBodyGyroMag.mean.."             "tBodyGyroMag.std.."             
"tBodyGyroJerkMag.mean.."         "tBodyGyroJerkMag.std.."         
"fBodyAcc.mean...X"               "fBodyAcc.mean...Y"              
"fBodyAcc.mean...Z"               "fBodyAcc.std...X"               
"fBodyAcc.std...Y"                "fBodyAcc.std...Z"               
"fBodyAcc.meanFreq...X"           "fBodyAcc.meanFreq...Y"          
"fBodyAcc.meanFreq...Z"           "fBodyAccJerk.mean...X"          
"fBodyAccJerk.mean...Y"           "fBodyAccJerk.mean...Z"          
"fBodyAccJerk.std...X"            "fBodyAccJerk.std...Y"           
"fBodyAccJerk.std...Z"            "fBodyAccJerk.meanFreq...X"      
"fBodyAccJerk.meanFreq...Y"       "fBodyAccJerk.meanFreq...Z"      
"fBodyGyro.mean...X"              "fBodyGyro.mean...Y"             
"fBodyGyro.mean...Z"              "fBodyGyro.std...X"              
"fBodyGyro.std...Y"               "fBodyGyro.std...Z"              
"fBodyGyro.meanFreq...X"          "fBodyGyro.meanFreq...Y"         
"fBodyGyro.meanFreq...Z"          "fBodyAccMag.mean.."             
"fBodyAccMag.std.."               "fBodyAccMag.meanFreq.."         
"fBodyBodyAccJerkMag.mean.."      "fBodyBodyAccJerkMag.std.."      
"fBodyBodyAccJerkMag.meanFreq.."  "fBodyBodyGyroMag.mean.."        
"fBodyBodyGyroMag.std.."          "fBodyBodyGyroMag.meanFreq.."    
"fBodyBodyGyroJerkMag.mean.."     "fBodyBodyGyroJerkMag.std.."     
"fBodyBodyGyroJerkMag.meanFreq.."

## Transformations

List of tasks does over the load raw data to transform in the tidy data:

- From train and test data files obtain only the mean and std columns by find the names in the file features.txt using the _grepl_ function.

- Assign the column names for features and subject.

- Change the activity codes in train\_y and test\_y to label values from activiy_labels.txt file. I used the _mapvalues_ function.

- Create a data frame with the subject, features and activity for each type (test and train).

- Merge the 2 data frames with _rbind_ function.

- Aggregate the activity and subject variables with _aggregate_ function. This is the final result that is saved and attached.


