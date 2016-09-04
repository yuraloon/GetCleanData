#!/bin/sh



This code book explains the data in tidy.txt

Identifiers:

Subject_id - this is an integer, representing one of 30 subjects involved in the study.

Activity_id - represents one of six activities that the subjec performed and were recorded.

Activity_name - these are descriptions of the six activities in character format.
The values are as follows:
Walking = 1,
Walking upstairs = 2,
Walking downstairs = 3,
Sitting = 4,
Standing = 5,
Laying = 6
 
Measurements:

These are the different measurements taken in the study. All are real numbers between 1 and -1.

examples are:
tBodyAccMeanX  =  .96543
tBodyAccMeanY = -.896543
tBodyAccMeanZ  =   .97435


there are many others - we start with over appx 550 columns of measurements and grep out to between 80 - 90 depending on how one interprets the mean/std dev names.