#Getting and Cleaning Data Project Assignment
## Introduction
This repo contains all the files for the project assignment of the course Getting and Cleaning Data from Coursera. This repo includes the following: 
  * run_analysis.R
  * codebook.md
  * README.md
  * tidyData.txt
  
## Credits
In order to make us of the data set we acknowledge the the following publication:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Raw Data
The raw data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. For an in-depth description of this data set we refer to the README file supplied with this data set. The files we used are: the file X\_test.txt, activity labels from y\_test.txt and the subject IDs from subject_test.txt In similar fashion we used the trainig set.

## run_analysis.R
For the script run_analysis.R to work, please change your working directory to the same directory which contains the unzipped UCI HAR Dataset (see link above). Also make sure you have installed the plyr package.
The aim of this script is return an independent tidy data set with the average of each mean and standard dev. variable for each activity and each subject. The file extracts the data and merges it together. Variable names and the activity labes are changed for readability. The exact changes can be found in the comments in the run_analysis.R file.  
