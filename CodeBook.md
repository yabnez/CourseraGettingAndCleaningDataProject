# Code Book for Coursera Getting And Cleaning Data Project

## variables

* Subject: integer to identify the subject.
* Activity: the activity name.

Measurement Variables:
floating value for the averages for measurements.

* TimeDomain-Body-Accelerometer-Mean-X
* TimeDomain-Body-Accelerometer-Mean-Y
* TimeDomain-Body-Accelerometer-Mean-Z
* TimeDomain-Body-Accelerometer-StandardDeviation-X
* TimeDomain-Body-Accelerometer-StandardDeviation-Y
* TimeDomain-Body-Accelerometer-StandardDeviation-Z
* TimeDomainGravity-Accelerometer-Mean-X
* TimeDomainGravity-Accelerometer-Mean-Y
* TimeDomainGravity-Accelerometer-Mean-Z
* TimeDomainGravity-Accelerometer-StandardDeviation-X
* TimeDomainGravity-Accelerometer-StandardDeviation-Y
* TimeDomainGravity-Accelerometer-StandardDeviation-Z
* TimeDomain-Body-AccelerometerJerk-Mean-X
* TimeDomain-Body-AccelerometerJerk-Mean-Y
* TimeDomain-Body-AccelerometerJerk-Mean-Z
* TimeDomain-Body-AccelerometerJerk-StandardDeviation-X
* TimeDomain-Body-AccelerometerJerk-StandardDeviation-Y
* TimeDomain-Body-AccelerometerJerk-StandardDeviation-Z
* TimeDomain-Body-Gyroscope-Mean-X
* TimeDomain-Body-Gyroscope-Mean-Y
* TimeDomain-Body-Gyroscope-Mean-Z
* TimeDomain-Body-Gyroscope-StandardDeviation-X
* TimeDomain-Body-Gyroscope-StandardDeviation-Y
* TimeDomain-Body-Gyroscope-StandardDeviation-Z
* TimeDomain-Body-GyroscopeJerk-Mean-X
* TimeDomain-Body-GyroscopeJerk-Mean-Y
* TimeDomain-Body-GyroscopeJerk-Mean-Z
* TimeDomain-Body-GyroscopeJerk-StandardDeviation-X
* TimeDomain-Body-GyroscopeJerk-StandardDeviation-Y
* TimeDomain-Body-GyroscopeJerk-StandardDeviation-Z
* TimeDomain-Body-Accelerometer-Magnitude-Mean
* TimeDomain-Body-Accelerometer-Magnitude-StandardDeviation
* TimeDomainGravity-Accelerometer-Magnitude-Mean
* TimeDomainGravity-Accelerometer-Magnitude-StandardDeviation
* TimeDomain-Body-AccelerometerJerk-Magnitude-Mean
* TimeDomain-Body-AccelerometerJerk-Magnitude-StandardDeviation
* TimeDomain-Body-Gyroscope-Magnitude-Mean
* TimeDomain-Body-Gyroscope-Magnitude-StandardDeviation
* TimeDomain-Body-GyroscopeJerk-Magnitude-Mean
* TimeDomain-Body-GyroscopeJerk-Magnitude-StandardDeviation
* FrequencyDomain-Body-Accelerometer-Mean-X
* FrequencyDomain-Body-Accelerometer-Mean-Y
* FrequencyDomain-Body-Accelerometer-Mean-Z
* FrequencyDomain-Body-Accelerometer-StandardDeviation-X
* FrequencyDomain-Body-Accelerometer-StandardDeviation-Y
* FrequencyDomain-Body-Accelerometer-StandardDeviation-Z
* FrequencyDomain-Body-Accelerometer-Mean-Frequency-X
* FrequencyDomain-Body-Accelerometer-Mean-Frequency-Y
* FrequencyDomain-Body-Accelerometer-Mean-Frequency-Z
* FrequencyDomain-Body-AccelerometerJerk-Mean-X
* FrequencyDomain-Body-AccelerometerJerk-Mean-Y
* FrequencyDomain-Body-AccelerometerJerk-Mean-Z
* FrequencyDomain-Body-AccelerometerJerk-StandardDeviation-X
* FrequencyDomain-Body-AccelerometerJerk-StandardDeviation-Y
* FrequencyDomain-Body-AccelerometerJerk-StandardDeviation-Z
* FrequencyDomain-Body-AccelerometerJerk-Mean-Frequency-X
* FrequencyDomain-Body-AccelerometerJerk-Mean-Frequency-Y
* FrequencyDomain-Body-AccelerometerJerk-Mean-Frequency-Z
* FrequencyDomain-Body-Gyroscope-Mean-X
* FrequencyDomain-Body-Gyroscope-Mean-Y
* FrequencyDomain-Body-Gyroscope-Mean-Z
* FrequencyDomain-Body-Gyroscope-StandardDeviation-X
* FrequencyDomain-Body-Gyroscope-StandardDeviation-Y
* FrequencyDomain-Body-Gyroscope-StandardDeviation-Z
* FrequencyDomain-Body-Gyroscope-Mean-Frequency-X
* FrequencyDomain-Body-Gyroscope-Mean-Frequency-Y
* FrequencyDomain-Body-Gyroscope-Mean-Frequency-Z
* FrequencyDomain-Body-Accelerometer-Magnitude-Mean
* FrequencyDomain-Body-Accelerometer-Magnitude-StandardDeviation
* FrequencyDomain-Body-Accelerometer-Magnitude-Mean-Frequency
* FrequencyDomain-Body-AccelerometerJerk-Magnitude-Mean
* FrequencyDomain-Body-AccelerometerJerk-Magnitude-StandardDeviation
* FrequencyDomain-Body-AccelerometerJerk-Magnitude-Mean-Frequency
* FrequencyDomain-Body-Gyroscope-Magnitude-Mean
* FrequencyDomain-Body-Gyroscope-Magnitude-StandardDeviation
* FrequencyDomain-Body-Gyroscope-Magnitude-Mean-Frequency
* FrequencyDomain-Body-GyroscopeJerk-Magnitude-Mean
* FrequencyDomain-Body-GyroscopeJerk-Magnitude-StandardDeviation
* FrequencyDomain-Body-GyroscopeJerk-Magnitude-Mean-Frequency

Activity variables:
* WALKING
* WALKING UPSTAIRS
* WALKING DOWNSTAIRS
* SITTING
* STANDING
* LAYING

## data

The measurements raw dataset is originally downloaded from the website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


## transformations to clean up data
* translate measurement variable abbreviations to full spell.
* split measurement variable words with "-".
* fixed a typo "BodyBody".

