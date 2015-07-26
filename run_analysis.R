clean <- function () {
     
     # Loads the required packages
     library(dplyr)
     
     # Downloads file, unzip, and move to appropriate folder
     
     # Read data from text files. These will be our temp datasets
     activitylabels <- read.table("activity_labels.txt")
     features <- read.table("features.txt")
     xtrain <- read.table("X_train.txt")
     ytrain <- read.table("y_train.txt")
     subtrain <- read.table("subject_train.txt")
     subtest <- read.table("subject_test.txt")
     xtest <- read.table("X_test.txt")
     ytest <- read.table("y_test.txt")
     
     # Rename columns of the temp datasets (all other than xtest and xtrain)
     names(features) <- c("feature_id","feature_label")
     names(activitylabels) <- c("activity_id","activity_label")
     names(ytrain) <- c("activity_id")
     names(ytest) <- c("activity_id")
     names(subtest) <- c("subject_id")
     names(subtrain) <- c("subject_id")
     
     #Convert feature labels to a character vector and remove "()" from strings
     #Also replace dashes with underscores
     features_vec <- as.character(unlist(select(features,feature_label)))
     features_vec <- sub("()","",features_vec,fixed=TRUE)
     features_vec <- gsub("-","_",features_vec)
     
     # Convert values of activity labels to lower case
     activitylabels[,2] <- tolower(activitylabels[,2])
     
     # Combine columns to get complete test and train datasets
     ytest_act <- left_join(ytest,activitylabels, by="activity_id")
     ytrain_act <- left_join(ytrain,activitylabels, by="activity_id")
     testdata <- bind_cols(subtest,ytest_act,xtest)
     traindata <- bind_cols(subtrain,ytrain_act,xtrain)
     
     # Combine rows for testdata and traindata
     alldata <- bind_rows(testdata,traindata)
     
     # Rename columns of the combined dataset
     names(alldata)[4:564] <- features_vec
     
     # Subset combined dataset to only include ids and columns that relates
     # to mean and standard deviation
     mean_std_data <- alldata[,grep("mean|std|subject_id|activity_label",names(alldata))]
     
     # Rename columns to ensure format consistency
     names(mean_std_data) <- gsub("BodyBody","Body",names(mean_std_data))
     names(mean_std_data) <- gsub("Body",".body.",names(mean_std_data))
     names(mean_std_data) <- gsub("Gravity",".gravity.",names(mean_std_data))
     names(mean_std_data) <- gsub("_mean_",".mean.",names(mean_std_data))
     names(mean_std_data) <- gsub("_std_",".std.",names(mean_std_data))
     names(mean_std_data) <- gsub("_meanFreq_",".mean.freq.",names(mean_std_data))
     names(mean_std_data) <- gsub("meanFreq","mean.freq",names(mean_std_data))
     names(mean_std_data) <- gsub("AccJerk","Acc.Jerk",names(mean_std_data))
     names(mean_std_data) <- gsub("gyroJerk","gyro.jerk",names(mean_std_data),ignore.case = TRUE)
     names(mean_std_data) <- gsub("Mag_","Mag.",names(mean_std_data))
     names(mean_std_data) <- gsub("AccMag","Acc.Mag",names(mean_std_data))
     names(mean_std_data) <- gsub("gyroMag","gyro.Mag",names(mean_std_data),ignore.case = TRUE)
     names(mean_std_data) <- gsub("jerkMag","jerk.Mag",names(mean_std_data),ignore.case = TRUE)
     names(mean_std_data) <- tolower(names(mean_std_data))
     
     # Summarise all column but group by subject id and activity label
     summary <- summarise_each(group_by(mean_std_data,subject_id,activity_label),funs(mean))
     names(summary)[3:81] <- paste("avg.of.",names(summary)[3:81],sep="")
     
     # Return summarised data
     write.table(summary,"human_activity_recognition_summary.txt",row.names = FALSE)
}

