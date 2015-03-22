run_analysis <- function() {
  require(dplyr)
  ## Merge the test and training sets to create one data set.
  ## This loads the data.
  x.test <- read.table("test/X_test.txt")
  y.test <- read.table("test/y_test.txt")
  subject.test <- read.table("test/subject_test.txt")
  x.train <- read.table("train/X_train.txt")
  y.train <- read.table("train/y_train.txt")
  subject.train <- read.table("train/subject_train.txt")
  features <- read.table("features.txt", quote="\"", stringsAsFactors=FALSE)
  features <- features[,2]
  ## Combine the x.test and x.train data.
  x <- rbind(x.test, x.train)
  ## Name the columns
  colnames(x) <- features
  ## Subsetting the data
  data.reduced <- x[,c(1:6, 41:46, 121:126, 266:271, 294:296, 424:429, 452:454)]
  ## Get the names from the reduced set
  names <- colnames(data.reduced)
  ## Remove the extra characters
  gsub("[(]", "", names) -> names
  gsub("[)]", "", names) -> names
  gsub("[-]", "", names) -> names
  names <- tolower(names)
  colnames(data.reduced) <- names
  ## Combine the test subject identifiers.
  ## Test data first, train second
  subject <- rbind(subject.test, subject.train)
  colnames(subject) <- "subject"
  ## Combine the test subject activity identifiers
  activities <- rbind(y.test, y.train)
  activities[,1] <- as.character(activities[,1])
  colnames(activities) <- "activities"
  final.subset <- cbind(subject, activities, data.reduced)
  final.subset$activities <- gsub(1, "WALKING", final.subset$activities)
  final.subset$activities <- gsub(2, "WALKING_UPSTAIRS", final.subset$activities)
  final.subset$activities <- gsub(3, "WALKING_DOWNSTAIRS", final.subset$activities)
  final.subset$activities <- gsub(4, "SITTING", final.subset$activities)
  final.subset$activities <- gsub(5, "STANDING", final.subset$activities)
  final.subset$activities <- gsub(6, "LAYING", final.subset$activities)
  final.subset <- tbl_df(final.subset)
  subject.activity <- group_by(final.subset, subject, activities)
  final <- summarize(subject.activity, 
                     tbodyaccmeanx=mean(tbodyaccmeanx), 
                     tbodyaccmeany=mean(tbodyaccmeany),
                     tbodyaccmeanz=mean(tbodyaccmeanz), 
                     tbodyaccstdx=mean(tbodyaccstdx), 
                     tbodyaccstdy=mean(tbodyaccstdy),
                     tbodyaccstdz=mean(tbodyaccstdz), 
                     tgravityaccmeanx=mean(tgravityaccmeanx),
                     tgravityaccmeany=mean(tgravityaccmeany),
                     tgravityaccmeanz=mean(tgravityaccmeanz), 
                     tgravityaccstdx=mean(tgravityaccstdx), 
                     tgravityaccstdy=mean(tgravityaccstdy),
                     tgravityaccstdz=mean(tgravityaccstdz), 
                     tbodygyromeanx=mean(tbodygyromeanx), 
                     tbodygyromeany=mean(tbodygyromeany),
                     tbodygyromeanz=mean(tbodygyromeanz), 
                     tbodygyrostdx=mean(tbodygyrostdx), 
                     tbodygyrostdy=mean(tbodygyrostdy),
                     tbodygyrostdz=mean(tbodygyrostdz), 
                     fbodyaccmeanx=mean(fbodyaccmeanx), 
                     fbodyaccmeany=mean(fbodyaccmeany),
                     fbodyaccmeanz=mean(fbodyaccmeanz), 
                     fbodyaccstdx=mean(fbodyaccstdx), 
                     fbodyaccstdy=mean(fbodyaccstdy), 
                     fbodyaccstdz=mean(fbodyaccstdz),
                     fbodyaccmeanfreqx=mean(fbodyaccmeanfreqx), 
                     fbodyaccmeanfreqy=mean(fbodyaccmeanfreqy), 
                     fbodyaccmeanfreqz=mean(fbodyaccmeanfreqz), 
                     fbodygyromeanx=mean(fbodygyromeanx), 
                     fbodygyromeany=mean(fbodygyromeany), 
                     fbodygyromeanz=mean(fbodygyromeanz),
                     fbodygyrostdx=mean(fbodygyrostdx), 
                     fbodygyrostdy=mean(fbodygyrostdy), 
                     fbodygyrostdz=mean(fbodygyrostdz), 
                     fbodygyromeanfreqx=mean(fbodygyromeanfreqx),
                     fbodygyromeanfreqy=mean(fbodygyromeanfreqy), 
                     fbodygyromeanfreqz=mean(fbodygyromeanfreqz))
  write.csv(final, "averagebysubjectactivity.txt", row.names = FALSE)
}
