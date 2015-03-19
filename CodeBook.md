# CodeBook

This data set is a 180x81 size data frame, containing data from various Samsung Galaxy S II smartphones
that were worn on the waist by 30 volunteers whilst performing different activities. More information and
the raw data set can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Creation of tidy data file

The raw data that was partitioned into test and training data was merged together into one set. Only the mean and standard deviation 
columns from the original data set were retained (column either contains std or mean in its name), and the activity type and subject who carried out the recording 
were also merged into the data frame. Finally, the mean was taken of each variable in the data frame by subject and activity.


### Variables

The activity variable is a factor of which activity was being carried out whilst the measurements were taken, the subject
variable is a number between 1 and 30 representing which volunteer was performing the activity. The remaining variables are averages (mean)
calculated by subject and activity.

For example, the entry in the 3rd row and 3rd column represents the mean of the mean values of tBodyAcc in the X direction measured by the
smartphone whilst subject 3 was laying down.


### An explanation of the original data variables
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
