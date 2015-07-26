This readme file gives an overview of the data that was given, the goal of the script and how to run it. For detailed information on the dataset and the transformations that the script is performing, please refer to CodeBook.md. 

The data that we're given was from an experiment on human activity recognition using smartphones. The readings were for 30 subjects and each of them performed six different activities. 30% of the subjects generated the test data while the remaining generated the training data. The data was saved in separated text files.

Our goal is to combine all these separate files and transform them into one tidy dataset. Once we have the tidy dataset, we will keep the fields that have mean and standard deviation values, after which we will summarise by calculating the average for each of them, grouped by the subjects and the six activities.

An example of our final dataset should look something like this:

subject_id     activity  avg_field1     avg_field2     avg_field3
1              walk      23             25.5           -2.7
1              sit       12             99             -3
1              swim      1.2            34             98
2              walk      2.3            23             -2.2
2              sit       128            5              -3.4
2              swim      45             22             98.5

I have provided the script "run_analysis.R" which will help us achieve this goal. I will explain how the transformations are done as well as the meaning of our fields/variables in "CodeBook.md".

In order to run this R file, you must follow the steps below, which includes installing the required R package(s) and having the right files in your working environment. I have thought of automating many of these steps but for that to work, I must make certain decisions for the user who's running this, which I am reluctant to do so. This includes downloading and moving files in a file path of my choice, renaming them, and installing packages all of which I believe is a matter of personal preference. Due to those reasons, I've decided against them.

REQUIREMENTS
Please perform each of them in the order that is detailed below:

1. Download the file at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip it. You should get a folder called "UCI HAR Dataset".
3. We need to move the necessary files to your working environment. If you prefer, you may create a special folder for this purpose and then set that as your working environment using the setwd() command.
4. In the "UCI HAR Dataset" folder, move "activity_labels.txt" and "features.txt" to your working environment.
5. Notice that in the "UCI HAR Dataset" folder, there are two folders called "test" and "train". In them, find "subject_test.txt", "subject_train.txt", "X_test.txt", "X_train.txt","Y_test.txt", and "Y_train.txt". Put them in the same working environment as the files in step 4. We can ignore the "Inertial Signals" folders.
6. Ensure that you do not rename those eight files that you just moved.
7. Download the dplyr package using the "install.packages("dplyr")" command.
8. Run the "source("run_analysis.R")" command.
9. Run the script with the "clean()" command.
10. Once complete, the tidy dataset should now be in your working directory. It's called "human_activity_recognition_summary.txt".