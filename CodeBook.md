# CodeBook - Getting and Cleaning Data Project

## Variables


### Input

Source data for this project is comprised of sensor data from a set of cell
phones.

Source data for this project is organized into 2 sets of 3 files, plus a
features.txt file that provides column names for the mapped data tables. 

The two sets are test and train. Each contains identical data from a structural
perspective (but not from an observations perspective)

In each set there is an X, Y and subject file. 

Subject contains a numerical identifier of the subject of the observations. In
this case the phone or person whose phone's data is recorded. 

The X file contains each of the data points corresponding to average
Acceleration, Gravity, etc. Details for these fields can be found in the
documentation that accompanies the source data. 

The Y file contains a activity type identifier and can be mapped to a
description using the activity_labels.txt file. 

### Output

Output is contained in the output.txt file and represents the average value of
each metric grouped by the subject (As described above) and the activity type. 


## Experimental Design

The script included assumes the existance of the data described in Input above. 

Given that data the following steps are performed. 

1. Data is collected from the test dataset
2. Names are applied to the collected data and cleaned of any special characters
   that could cause problems for R
3. Data is collected on the train dataset
4. Names are applied to the collected data and cleaned of any special characters
   that could cause problems for R
5. The two datasets are appended, resulting in one large dataset
6. only columns containing the mean and standard deviation columns are kept. The
   rest are stripped out
7. averages of each variable are calculated, grouped by subject and activity
   type.
8. The results are written to output.txt

