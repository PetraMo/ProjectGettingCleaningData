library(dplyr)
library(tidyr)

##read files
myactivity<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
myactivitydateloaded<-date()
mycolnames<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
mycolnamesdateloaded<-date()


mytrainsubject<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
mytrainsubjectdateloaded<-date()
mytraindata<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
mytraindatadateloaded<-date()
mytrainactivity<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
mytrainactivitydateloaded<-date()

mytestsubject<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
mytestsubjectdateloaded<-date()
mytestdata<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
mytestdatadateloaded<-date()
mytestactivity<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
mytestactivitydateloaded<-date()



##Add variable names/column names 
colnames(mytrainactivity)<-c("activitynumber")
colnames(mytestactivity)<-c("activitynumber")
colnames(mytrainsubject)<-c("subject")
colnames(mytestsubject)<-c("subject")
colnames(myactivity)<-c("activitynumber","activity")
 
##Clean raw data colnames by removing dashes, fullstops,commas and use it to name columns
mycleancolnames<-gsub("-","",gsub("_","",gsub("\\.","",gsub(" ","",gsub("\\,","",mycolnames[,2])))))
colnames(mytraindata)<-mycleancolnames
colnames(mytestdata)<-mycleancolnames


##Add subject as first column and activitynumber as last column to each of the Train and Test data sets
mytraindata<-cbind(mytrainsubject,mytraindata,mytrainactivity)
mytestdata<-cbind(mytestsubject,mytestdata,mytestactivity)

##combine train and test; add the test data at the bottom of the train data
mytraintest<-rbind(mytraindata,mytestdata)


##subset the columns so that only the Subject and the mean() and std() columns remain
mytraintest<-mytraintest[,c("subject",grep("mean\\(\\)|std\\(\\)",mycleancolnames,value=TRUE),"activitynumber")]


##add descriptive name for activity, note this may reorder result
mergedactivity<-merge(mytraintest,myactivity,by.x="activitynumber",by.y="activitynumber", all=FALSE, incomparables = NA )


cleaneddataset<-mergedactivity[,c("subject","activity",grep("mean\\(\\)|std\\(\\)",mycleancolnames,value=TRUE))]
write.table(cleaneddataset,file="./cleaneddataset.txt",row.names=FALSE)


#############################
##  create tidy dataset    ##
#############################
##remove brackets from names to be able to use the colmeans function to average the fields
names(cleaneddataset)<-gsub("\\(","",gsub("\\)","",names(cleaneddataset)))
##choose columns to avg, namely all the columns that contain the words mean or std
colstoavg<-grep("mean|std",names(cleaneddataset),value=TRUE)

##group by subject and activity
tidy1<-split(cleaneddataset ,list(cleaneddataset$subject,cleaneddataset$activity),drop=TRUE)

##use colMeans in an sapply to average the columns. transpose into correct data frame
tidy2<-data.frame(t(sapply(tidy1, function(x) colMeans(x[,c(colstoavg)]))))

##rownames will be subject.activity, add them as first column of new data frame containing the averaged data
tidy3 <- cbind(subjectactivity=rownames(tidy2), data.frame(tidy2, row.names=NULL))
##split subject and activity into 2 columns
tidydataset<-separate(tidy3,col="subjectactivity",into= c('subject', 'activity'),sep = "\\.")
colnames(tidydataset)<-c('subject', 'activity',paste0("Avg",colstoavg))
write.table(tidydataset,file="./tidydataset.txt",row.names=FALSE)