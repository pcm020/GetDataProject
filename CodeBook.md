# CodeBook

## Data

## Variables

- Subject: id person that do the movements. Char

- Activity: label to describe the activiy for the person. Char. Posible values:
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

- Set of Variables: mean and standard desviation for mobile velocity and acceleration mobile variables for each subject and activity. Numeric.

## Transformations

List of task do over the load raw data to transform in the tidy data:

- From train and test data files obtain only the mean and std columns by find the names in the file features.txt using the _grepl_ function.

- Assign the column names for features and subject.

- Change the activity codes in train\_y and test\_y to label values from activiy_labels.txt file. I used the _mapvalues_ function.

- Create a data frame with the subject, features and activity for each type (test and train).

- Merge the 2 data frames with _rbind_ function.

- Aggregate the activity and subject variables with _aggregate_ function. This is the final result that is saved and attached.


