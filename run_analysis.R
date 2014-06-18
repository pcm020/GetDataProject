library(plyr)
#Download data
if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/DataSet.zip", method="curl")
dateDownloaded <- date()

#extract data
unzip("./data/DataSet.zip", exdir="./data")

#load data info: features names and activity labels
features <- read.table("./data/UCI HAR Dataset/features.txt")
labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", stringsAsFactors=F)

#load train data
train.sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
train.X <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

#get by name: std or mean features
fea.num <- features[grepl("mean", features[,2]) | grepl("std", features[,2]), 1]
fea.col <- features[grepl("mean", features[,2]) | grepl("std", features[,2]), 2]

#get features for train (task 2)
train.fea <- train.X[,fea.num]

#assign colnames (task 4)
colnames(train.sub) <- "subject"
colnames(train.fea) <- fea.col

#Labels (task 3)
train.y$activity <- mapvalues(train.y$V1, from = labels[,1], to = labels[,2])

#create data.frame
train.df <- data.frame(train.sub, train.fea, train.y["activity"])

#load test data
test.sub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
test.X <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("./data/UCI HAR Dataset/test/y_test.txt")

#get features for train (task 2)
test.fea <- test.X[,fea.num]

#assign colnames (task 4)
colnames(test.sub) <- "subject"
colnames(test.fea) <- fea.col

#Labels (task 3)
test.y$activity <- mapvalues(test.y$V1, from = labels[,1], to = labels[,2])

#create data.frame
test.df <- data.frame(test.sub, test.fea, test.y["activity"])

#merge by rows data.frames (task 1)
merge.df <- rbind(train.df, test.df)

#mean values by activity and subject (task 5)
result.df <- aggregate(.~activity+subject, data=merge.df, FUN=mean)

#save the data.frame
write.table(result.df, "./result_tidy.txt")
