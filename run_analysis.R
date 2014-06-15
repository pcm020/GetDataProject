#Download data
if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/DataSet.zip", method="curl")
dateDownloaded <- date()

#extract data
unzip("./data/DataSet.zip", exdir="./data")

#load train data
train.sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
widths <- rep(16, 561)
train.X <- read.fwf("./data/UCI HAR Dataset/train/X_train.txt", widths=widths)
train.y <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

#load test data
test.sub <- read.csv("./data/UCI HAR Dataset/test/subject_test.txt")
test.X <- read.csv("./data/UCI HAR Dataset/test/X_test.txt", sep=" ")
test.y <- read.csv("./data/UCI HAR Dataset/test/y_test.txt")