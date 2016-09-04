#!/bin/sh

exec vim "$@"


This document describes the contents of this repository. It will also provide instructions on how to run the R script to transform the raw data set dictated in the Course Project into a tidy dataset.

Contents
This section describes the contents of this repository.
 
Filename	Description	   
ReadMe.md	This File	   
CodeBook.md	Describes the variables within the tidied dataset	   
run_analysis.R	Analysis function of the raw data	 
Setup
Before running the script, the following has to be setup:The R Environment is installed and the data has been downloaded to my R environment.
For ease of use, I flattened the hierarchical structure of the  "UCI_HAR_Dataset" and put all the files in one directory on my home drive. The assignment instructions did not insist on keeping the hierarchical file structure.
Steps
To get the tidied data, please follow the following steps:
1. Source the analysis function into R and run the function.
source('<your default R working directory>/run_analysis.R'))
run_analysis()
2. Once the function has completed running, you will see two output files - "tidied_data.csv" and "tidied_data.txt" - in your working directory. These files contain the same data and are presented in CSV and TXT formats.
3. To read the files into R, please use the following functions:
# Read text file
read.table("tidied_data.txt", header=TRUE)
# Read csv file
read.csv("tidied_data.csv", header=TRUE)






