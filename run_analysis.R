require(dplyr)
require(tidyr)

#Read Features and Activities Table
features<-read.table("./features.txt")
activities<-read.table("./activity_labels.txt",col.names=c("Classe",'Activity'))

#Find features with names containing "mean()" and "std()"
meansandsds<-features[grep("*mean\\(|std\\(",features$V2),]

#Set vector of columns to keep
keepcols<-rep('NULL',length(features$V1))
keepcols[meansandsds$V1]='double'

#2.  Extracts only the measurements on the mean
#and standard deviation for each measurement
#Read X training and testing data. By Setting the colClasses parameter,
#only the columns with mean() and std() are extracted

X_train<-read.table("./train/X_train.txt",colClasses=keepcols,col.names=features$V2)
X_test<-read.table("./test/X_test.txt",colClasses=keepcols,col.names=features$V2)

#Read Y training and testing data
Y_train<-read.table("./train/y_train.txt",col.names='Classe')
Y_test<-read.table("./test/y_test.txt",col.names='Classe')

#Read Subject training and testing data
subject_train<-read.table("./train/subject_train.txt",col.names='Subject')
subject_test<-read.table("./test/subject_test.txt",col.names='Subject')

#1. Merge Training and Test Sets
data_tbl<-bind_rows(bind_cols(subject_train,X_train,Y_train),
                     bind_cols(subject_test,X_test,Y_test))


#3. Apply descriptive activity labels
data_tbl<-inner_join(data_tbl,activities)

#4. Appropriately labels the data set with descriptive variable names.
col_names<-colnames(data_tbl)
#replace typo with correction
col_names<-gsub("BodyBody","Body",col_names)
#delete "." characters
col_names<-gsub("\\.","",col_names)
#change t to time
col_names<-sub("^t","time",col_names)
#change f to freq
col_names<-sub("^f","freq",col_names)
colnames(data_tbl)<-col_names

#5. From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable 
#for each activity and each subject

#group by Subject and activity and take the mean of each group
groups<-data_tbl %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))

#rename columns
colnames(groups)<-paste0("meanof",colnames(groups))

#write tidy dataset to text format
write.table(groups, "./groupmeans.txt",row.name=FALSE)
