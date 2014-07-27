Getting_Cleaning_Data_Course_Project
====================================

The course project of Getting and Cleaning Data MOOC available on coursera.org (John Hopkins Bloomberg School of Public Health, instructor - Jeff Leek, PhD)

====================================

This script aims at cleaning the data obtained from the website:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site
where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

====================================

The script 'run_analysis.R' cleans the data in the following way:

1) Reads TEST and TRAINING datasets into R (files 'test/X_test.txt' and 'train/X_train' accordingly) - objects 'test' and
'training'

2) Reads VARIABLES NAMES presented in TEST and TRAINING datasets from the file '/features.txt' - object 'features' - and
assigns their names to the test and training sets read before

3) Reads an identifier of the SUBJECT who carried out the experiment from 'test/subject_test.txt' and 
'train/subject_train.txt' for TEST and TRAINING DATASETS accordingly - objects 'subject.test' and 'subject.train'. Then adds
a 'SUBJECT' variable to both datasets - 'test' and 'training' objects

4) Reads ACTIVITIES labels from 'test/y_test.txt' and 'train/y_train.txt' for TEST and TRAINING DATASETS accordingly - objects
'test.labels' and 'train.labels'. Then adds a LABELS variable to both datasets - 'test' and 'training' objects

5) Merges TEST and TRAINING datasets - 'test' and 'training' objects - into one new dataset - object 'final.data'

6) Reads the ACTIVITIES lavels - object 'activity.labels' - and assigns its values to LABELS variables of final merged dataset - object 'final.data' - as levels, makiing LABELS a factor variable at the same time

7) Extracts variables that measures means, standard deviations from the final dataset, as well as SUBJECTS and LABELS
variables into new object called 'final.data_filt'

8) Calculates average values across subjects to the object called 'total_subjects'

9) Calculates average values across activities to the object 'total_activities'

10) Merges averages across subjects and activities - objects 'total_subjects' and 'total_activities' - to a new object
called finalization. FINALIZATION is the final tidy data that is ready to further analtsis - it is then saved as a 
.txt document ('tidy_dataset.txt'). 

===========================================

NOTE! TXT FILE MIGHT SEEM UNORDERED, BUT IN FACT IT IS AS DATA.TABLE FILE THAT IS TIDY AND READY FOR ANALYSIS


