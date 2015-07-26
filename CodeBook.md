As mentioned in README.md, there were 30 subjects who each performed six different activities which generated 561 types of data(often called a feature or a field) and 10,299 total observations. Our data is divided into "test" and "train" datasets in six text files and here's a short description for them.

test (30% of the subjects)
--------------------------
X_test.txt: Observations with 561 variables without a header.
Y_test.txt: The activity ids for the respective observations in X_test.txt.
subject_test.txt: The subject ids who performed the activities.

train (70% of the subjects)
--------------------------
X_train.txt: Observations with 561 variables without a header.
Y_train.txt: The activity ids for the respective observations in X_train.txt.
subject_train.txt: The subject ids who performed the activities.

In addition, there are two other text files; "features.txt" provides the name for the 561 variables since it is missing from the x dataset, and "activity_labels.txt" which provides a short description for the activity ids.

The Transformation
------------------
Here's the general approach to creating our tidy dataset:

1. Read the text files into R.
2. Assign appropriate field names to all the loaded data except for X_test and X_train.
3. Convert activity labels to lowercase for consistency.
4. Combine training related datasets into one data frame. Repeat for test related datasets.
5. Combine training and test datasets together.
6. Ensure that field names for the remaining features are assigned.
7. Create a subset of the combined dataset with subject id, activity label and features with mean and standard deviation values.
8. Rename columns for the subset data for consistency.
9. Summarise the subset data by averaging the features, grouped by subject id and activity labels, and rename columns.

Explanation of feature names
----------------------------

Each feature name indicates the type of data that was collected and has a combination of words (separated by ".") that describe them. These are what the words represent:

acc: signals are from the embedded accelerometer.
gyro: signals are from the embedded gyroscope.
body: body motion component of the sensor signal.
gravity: gravitational motion component of the sensor signal.
mean: the estimated mean/average for the signal.
std: the estimated standard deviation for the signal.
x: x component of the 3-axial signal.
y: y component of the 3-axial signal.
z: z component of the 3-axial signal.
t: time domain signals.
f: frequency domain signals.
jerk: derived in time from body linear acceleration and angular velocity.
mag: magnitude of the 3 dimensional signal calculated using the Euclidean form.
avg.of: average of each of the feature for each subject and each of the six activity that were performed by them.

Here's a list of variables in our final tidy dataset:

avg.of.subject_id
avg.of.activity_label
avg.of.t.body.acc.mean.x
avg.of.t.body.acc.mean.y
avg.of.t.body.acc.mean.z
avg.of.t.body.acc.std.x
avg.of.t.body.acc.std.y
avg.of.t.body.acc.std.z
avg.of.t.gravity.acc.mean.x
avg.of.t.gravity.acc.mean.y
avg.of.t.gravity.acc.mean.z
avg.of.t.gravity.acc.std.x
avg.of.t.gravity.acc.std.y
avg.of.t.gravity.acc.std.z
avg.of.t.body.acc.jerk.mean.x
avg.of.t.body.acc.jerk.mean.y
avg.of.t.body.acc.jerk.mean.z
avg.of.t.body.acc.jerk.std.x
avg.of.t.body.acc.jerk.std.y
avg.of.t.body.acc.jerk.std.z
avg.of.t.body.gyro.mean.x
avg.of.t.body.gyro.mean.y
avg.of.t.body.gyro.mean.z
avg.of.t.body.gyro.std.x
avg.of.t.body.gyro.std.y
avg.of.t.body.gyro.std.z
avg.of.t.body.gyro.jerk.mean.x
avg.of.t.body.gyro.jerk.mean.y
avg.of.t.body.gyro.jerk.mean.z
avg.of.t.body.gyro.jerk.std.x
avg.of.t.body.gyro.jerk.std.y
avg.of.t.body.gyro.jerk.std.z
avg.of.t.body.acc.mag.mean
avg.of.t.body.acc.mag.std
avg.of.t.gravity.acc.mag.mean
avg.of.t.gravity.acc.mag.std
avg.of.t.body.acc.jerk.mag.mean
avg.of.t.body.acc.jerk.mag.std
avg.of.t.body.gyro.mag.mean
avg.of.t.body.gyro.mag.std
avg.of.t.body.gyro.jerk.mag.mean
avg.of.t.body.gyro.jerk.mag.std
avg.of.f.body.acc.mean.x
avg.of.f.body.acc.mean.y
avg.of.f.body.acc.mean.z
avg.of.f.body.acc.std.x
avg.of.f.body.acc.std.y
avg.of.f.body.acc.std.z
avg.of.f.body.acc.mean.freq.x
avg.of.f.body.acc.mean.freq.y
avg.of.f.body.acc.mean.freq.z
avg.of.f.body.acc.jerk.mean.x
avg.of.f.body.acc.jerk.mean.y
avg.of.f.body.acc.jerk.mean.z
avg.of.f.body.acc.jerk.std.x
avg.of.f.body.acc.jerk.std.y
avg.of.f.body.acc.jerk.std.z
avg.of.f.body.acc.jerk.mean.freq.x
avg.of.f.body.acc.jerk.mean.freq.y
avg.of.f.body.acc.jerk.mean.freq.z
avg.of.f.body.gyro.mean.x
avg.of.f.body.gyro.mean.y
avg.of.f.body.gyro.mean.z
avg.of.f.body.gyro.std.x
avg.of.f.body.gyro.std.y
avg.of.f.body.gyro.std.z
avg.of.f.body.gyro.mean.freq.x
avg.of.f.body.gyro.mean.freq.y
avg.of.f.body.gyro.mean.freq.z
avg.of.f.body.acc.mag.mean
avg.of.f.body.acc.mag.std
avg.of.f.body.acc.mag.mean.freq
avg.of.f.body.acc.jerk.mag.mean
avg.of.f.body.acc.jerk.mag.std
avg.of.f.body.acc.jerk.mag.mean.freq
avg.of.f.body.gyro.mag.mean
avg.of.f.body.gyro.mag.std
avg.of.f.body.gyro.mag.mean.freq
avg.of.f.body.gyro.jerk.mag.mean
avg.of.f.body.gyro.jerk.mag.std
avg.of.f.body.gyro.jerk.mag.mean.freq