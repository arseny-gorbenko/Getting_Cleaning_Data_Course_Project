# Read test & training sets
test <- read.table("C:/Documents and Settings/s.gorbenko/Рабочий стол/RRRR/UCI HAR Dataset/test/X_test.txt")
training <- read.table("C:/Documents and Settings/s.gorbenko/Рабочий стол/RRRR/UCI HAR Dataset/train/X_train.txt")


# Assign variables names to test $ training sets
features <- read.table("C:/Documents and Settings/s.gorbenko/Рабочий стол/RRRR/UCI HAR Dataset/features.txt")
colnames(test) <- features$V2
colnames(training) <- features$V2


# Add a 'subject' variables to both data sets
subject.test <- read.table("C:/Documents and Settings/s.gorbenko/Рабочий стол/RRRR/UCI HAR Dataset/test/subject_test.txt")
subject.train <- read.table("C:/Documents and Settings/s.gorbenko/Рабочий стол/RRRR/UCI HAR Dataset/train/subject_train.txt")
test$subject <- subject.test[, 1]
training$subject <- subject.train[, 1]


# Add new variable to test & training sets - labels (activities)
test.labels <- read.table("C:/Documents and Settings/s.gorbenko/Рабочий стол/RRRR/UCI HAR Dataset/test/y_test.txt")
train.labels <- read.table("C:/Documents and Settings/s.gorbenko/Рабочий стол/RRRR/UCI HAR Dataset/train/y_train.txt")
test$labels <- test.labels[, 1]
training$labels <- train.labels[, 1]


# Merge test & training datasets
final.data <- rbind(training, test)


# Name the activities in the data set ('labels' variable)
activity.labels <- read.table("C:/Documents and Settings/s.gorbenko/Рабочий стол/RRRR/UCI HAR Dataset/activity_labels.txt")
final.data$labels <- factor(final.data$labels, labels = as.character(activity.labels[, 2]))


# Extract the measurements on the mean and standard deviation for each measurement
final.data_mean <- subset(final.data, , select = grepl("mean()", colnames(final.data)))
final.data_std <- subset(final.data, , select = grepl("std()", colnames(final.data)))
final.data_subj.label <- subset(final.data, , select = c(subject, labels))
final.data_filt <- cbind(final.data_subj.label, final.data_mean, final.data_std)


# Calculate average values across subjects
total_subjects <- data.frame(1:30)
for (i in 3:81) {
  subjects <- tapply(final.data_filt[, i], final.data_filt[, 1], mean)
  total_subjects <- cbind(total_subjects, subjects)
}
colnames(total_subjects) <- c("subject/activity", colnames(final.data_filt[, 3:81]))


# Calculate average values across activities
total_activities <- data.frame(1:6)
for (i in 3:81) {
  activities <- tapply(final.data_filt[, i], final.data_filt[, 2], mean)
  total_activities <- cbind(total_activities, activities)
}
total_activities$X1.6 <- factor(total_activities$X1.6, labels = as.character(activity.labels[, 2]))
colnames(total_activities) <- c("subject/activity", colnames(final.data_filt[, 3:81]))


# Create final tidy data and save it as a data.table
finalization <- rbind(total_subjects, total_activities)
write.table(finalization, "tidy_dataset.txt")
