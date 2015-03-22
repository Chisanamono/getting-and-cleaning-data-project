#Codebook
***
###Explaining the results of run_analysis.R
###including defining the variables used
###and the process used to subset and organize the data
***
###Explanation of original research
###taken from the readme.txt found in the [original data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
***
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.
***

###The variables
####Please note: The results are all averages taken of each measurement for each subject and activity.
Each variable may begin with either a 't' or an 'f'.

+ Variables beginning with 't' refer to time-series measurements.
+ Variables beginning with 'f' refer to frequency-series measurements.

Each variable may be either a gravity or a body component.

Each variable may be either tracking the accelerometer or gyroscope sensor.

Each variable may be the average or the standard deviation of the signal tracked.

Each variable may be of of the x, y, or z sensor.

###The Process

Tables from the test set and the training set are always kept in the same order (test then train).
Variables were hand selected from the orignal set of 561 to keep the mean and standard deviation of what seemed to be the actual sensor data.
