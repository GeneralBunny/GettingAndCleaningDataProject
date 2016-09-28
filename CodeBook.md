#CodeBook for analysing the wearable computing data
This file contains the following three subjects.
* Data
* Variables
* Transformations of the raw data.

## Data
* The raw data are collected from the accelerometers from the Samsung Galaxy S II smartphone. They are the recordings of 30 
subjects performing activities of daily livingwhile carrying a waist-mounted smartphone with embedded inertial sensors.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed 
six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been 
randomly partitioned into two sets, where 70% of the volunteers (21 volunteers) was selected for generating the training data and 
30% (9 volunteers) the test data. 

  The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width 
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational 
force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window,
a vector of features was obtained by calculating variables from the time and frequency domain.

   A full description of the data is available at this website: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables
*  subject: number from 1 to 30, represents the subjects (volunteers) who did the experiments. The training data were collected from 21
volunteers and the test data were collected by 9 volunteers.
*  activity: number from 1 to 6, represents six different activities accordingly: walking, walking_upstairs, walking_downstairs,
sitting, standing, laying.
*  features (variables): there are 561 features in total. 
  *  The time domain signals (prefix "t" to denote time) from the accelerometer and gyroscope 3-axial raw signals are denoted as tAcc-XYZ
  and tGyro-XYZ.
  *  The time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order 
low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into 
body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
And the signal from gyroscope has only the body component (tBodyGyro-XYZ).
  *  Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
tBodyGyroMag, tBodyGyroJerkMag). So far, we have 20 signals (tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ,
tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag) (Note: -XYZ' is used to denote 3-axial signals in the X, Y and Z directions.).
  *  Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). Now we have these 13 more signals. 
  *  The set of variables that were estimated from these 33 signals are: 
    *  mean(): Mean value
    *  std(): Standard deviation
    *  mad(): Median absolute deviation 
    *  max(): Largest value in array
    *  min(): Smallest value in array
    *  sma(): Signal magnitude area
    *  energy(): Energy measure. Sum of the squares divided by the number of values. 
    *  iqr(): Interquartile range 
    *  entropy(): Signal entropy
    *  arCoeff(): Autorregresion coefficients with Burg order equal to 4
    *  correlation(): correlation coefficient between two signals
    *  maxInds(): index of the frequency component with largest magnitude
    *  meanFreq(): Weighted average of the frequency components to obtain a mean frequency
    *  skewness(): skewness of the frequency domain signal 
    *  kurtosis(): kurtosis of the frequency domain signal 
    *  bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
    *  angle(): Angle between to vectors.

  *  Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
    *  gravityMean
    *  tBodyAccMean
    *  tBodyAccJerkMean
    *  tBodyGyroMean
    *  tBodyGyroJerkMean

##Transformations of the raw data.

