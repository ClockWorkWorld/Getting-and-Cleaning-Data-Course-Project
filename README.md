# README
Tyler Seekins  
April 3, 2016  

### Getting and Cleaning Data Course Project

The goal of this project to collect, work with, and clean a data set collected from the accelerometers from the Samsung Galaxy S smartphone and prepare tidy data that can be used for later analysis. To perform this data wrangling, a script run_analysis.R that accomplishes the following was created:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Using the run_analysis.R script

1.  Download the data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and unzip.
2.  Set the working directory to the ./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset directory.
3.  Run the R script run_analysis.R
4. Retrieve the output of run_analysis.R, the groupmeans.txt file, from the ./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset directory.

*Note: the file run_analysis.R depends on the dplyr package which is available from CRAN.

### Working with the output file groupmeans.txt
The resulting file, groupmeans.txt can easily be read into R for future analysis using the read.table() function with the parameter sep=sep = " " and the parameter
header=TRUE.

### Understanding the analysis

Please read the file CodeBook.md to understand the measurements, variable names and the process to transform the raw data to the output.
