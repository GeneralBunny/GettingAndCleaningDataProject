library(dplyr)
library(data.table)

############# download the data #############################################
rm(list=ls())
if (!file.exists("./Project")){dir.create("./Project")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./Project/data.zip",method="curl")
unzip("./Project/data.zip", exdir="./Project")

############# Read in the train data files ###################################
#Xtrain contains the 561 columns of the features (variables) from the train data.
#Each feature has 7352 rows (measurements).
Xtrain<-read.table(paste(getwd(),"/Project/UCI HAR Dataset/train/X_train.txt", sep=""))
#ytrain contains the activities (labeled with 1 to 6) corresponding 
#to each of the 7352 measruements from the train data.
ytrain<-read.table(paste(getwd(),"/Project/UCI HAR Dataset/train/y_train.txt", sep=""))
#subTrain contains the subject (total 21 persons) who did each of 
#the 7352 measruements of the train data
subTrain<-read.table(paste(getwd(),"/Project/UCI HAR Dataset/train/subject_train.txt", sep=""))

############# Read in the test data files ####################################
#Xtest contains the 561 columns of the features (variables) from the test data.
#Each feature has 7352 rows (measurements).
Xtest<-read.table(paste(getwd(),"/Project/UCI HAR Dataset/test/X_test.txt", sep=""))
#ytest contains the activities (labeled with 1 to 6) corresponding 
#to each of the 7352 measruements from the test data.
ytest<-read.table(paste(getwd(),"/Project/UCI HAR Dataset/test/y_test.txt",sep=""))
#subTest contains the subject (total 9 persons) who did each 
#of the 7352 measruements of the test data
subTest<-read.table(paste(getwd(),"/Project/UCI HAR Dataset/test/subject_test.txt",sep=""))

############# Read in the feature (variable) file ############################
#features contains the names of 561 features(variables). 
#The first column is number 1 to 561,
#and the second column is the corresponding name.
features<-read.table(paste(getwd(),"/Project/UCI HAR Dataset/features.txt",sep=""))

############# Read in the avtivity file #####################################
ActivityLabel<-read.table(paste(getwd(),"/Project/UCI HAR Dataset/activity_labels.txt",sep=""))
#AvtivityLabel is the names of the activities.
#The first column is number 1 to 6,
#and the second column is the corresponding name.

### Step 1: Merges the training and the test sets to create one data set.######
Train<-cbind(group="train",subTrain, ytrain, Xtrain)
colnames(Train)[2]<- "subject"
colnames(Train)[3]<- "activity"
Test<-cbind(group="test", subTest, ytest, Xtest)
colnames(Test)[2]<-"subject"
colnames(Test)[3]<- "activity"
Total<-rbind(Train, Test)

############ Step 2: Extracts only the measurements on the mean and ###########
############ standard deviation for each measurement.##########################
MeanStd<- cbind(Total[,1:3],select(Total,grep("mean|std", features$V2)+3))

##### Step 3: Uses descriptive activity names to name the activities #########
ActNum<-as.numeric(ActivityLabel[,1])
ActName<-as.character(ActivityLabel[,2])
for( i in 1:length(ActNum)){
        MeanStd$activity<-sub(ActNum[i], ActName[i],MeanStd$activity)
}

### Step 4: Appropriately labels the data set with descriptive variable names.##
MeanStdNames<-features$V2[grep("mean|std", features$V2)]
names(MeanStd)[4:length(MeanStd)]<-c(as.character(MeanStdNames))
names(MeanStd) <- gsub("^t", "time",names(MeanStd))
names(MeanStd) <- gsub("^f", "frequency",names(MeanStd))
names(MeanStd) <- gsub("Acc", "Accelerometer",names(MeanStd))
names(MeanStd) <- gsub("Gyro", "Gyroscope",names(MeanStd))
names(MeanStd) <- gsub("Mag", "Magnitude",names(MeanStd))
names(MeanStd) <- gsub("BodyBody", "Body",names(MeanStd))

##### Step 5: From the data set in step 4, creates a second, independent ######
##### tidy data set (name: "TidyData.txt") with the average of ################
############## each variable for each activity and each subject. ##############
Temp<-data.table(MeanStd)
Average<-Temp[,lapply(.SD,mean),by=.(subject,activity),.SDcols=4:ncol(Temp)]
Average<-Average[order(subject,activity),]
write.table(Average, file="TidyData.txt", row.names= FALSE)

#### To read the file back into R, using the following code. ##################
######### tidydata<-read.table("TidyData.txt", header=TRUE) ################
######### View(tidydata)
#### For more information, please refer to readMe.md and CodeBook.md files.