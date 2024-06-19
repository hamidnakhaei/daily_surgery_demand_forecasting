# Daily Surgery Demand Forecasting in an Operating Room Using Linear Regression
# Problem Definition
A large hospital has 55 operating rooms. The scheduling for surgeries in these rooms is planned several weeks in advance. Surgeries can be scheduled from 4 weeks to 1 day before the surgery date based on the surgeons' preferences and plans. Every day at 5 PM, the list of surgeries for the following day is finalized, and no elective surgeries can be scheduled for the next day after this point. However, emergency surgeries might be added to the next day's schedule, or some surgeries may be canceled due to medical conditions. These changes and the uncertainty in the exact number of surgeries each day can impact the overall schedule. Surgeries are categorized into elective and emergency types. Elective surgeries, which make up about 94% of all surgeries, are planned well in advance (from 4 weeks to 1 day before the surgery), while emergency surgeries, accounting for approximately 6% of the hospital's surgeries, are unplanned and must be considered immediately due to their urgent nature. \
Various units, including nurses, surgeons, anesthesia staff, pre-operative care, radiology, pathology, recovery room, and sterilization services, are involved in each surgery. Therefore, proper scheduling of operating rooms significantly impacts other hospital departments. \
On average, around 116 surgeries are performed daily in this hospital. However, the number of surgeries performed each day is not constant, with a standard deviation of about 18 surgeries on different days. This fluctuation makes workforce planning challenging. Most changes in the daily number of surgeries result from cases added due to emergencies or canceled for medical reasons the previous day. We refer to these cases as "on-add," and we aim to investigate whether they are the reasons for the daily surgery count fluctuations. \
At the end of each day, the number and type of surgeries scheduled for the next day are communicated to the surgical pathology, radiology, recovery, and anesthesia departments. Based on the number of surgeries scheduled for the next day, they are either given leave or called in for overtime. \
Given these points, it becomes clear that not knowing the exact number of surgeries a few days in advance makes planning difficult for management. Now, the hospital management intends to develop a predictive model using the existing data, in collaboration with the data analysis team, to estimate the daily number of surgeries several days in advance. This will allow sufficient time for workforce and equipment planning.
# Data
The surgery scheduling data for each day has been collected over 48 weeks. In this data, the number of surgeries scheduled by the end of $x$ days before the surgey day is denoted by the variable $T...x$. For example, for the date 10/10/2010, the number of surgeries scheduled 7 days in advance is 80, and this number reaches 104 one day in advance (denoted as $T...1$), which is when the elective surgery schedule is finalized. Note that surgeries can be scheduled up to 28 days in advance. Additionally, there are some "on-add" cases that cause the actual number of surgeries performed on a given day to differ from the number recorded the previous day. The variable "Actual" denotes the actual number of surgeries performed each day. The variable "DOW" denotes the day of the week.
# Using Descriptive Analytics:
## Employing descriptive analytics to identify and present factors that are crucial for understanding the variables affecting daily surgery demand.
The summary table of descriptive statistics for some selected variables is as follows:

| Name     | Min | Median | Mean   | Max  |
| ------ | ----- | ------| ------| ------|
| $T...28$ | 0   |35|34|57|
|$T...14$  | 0   |65|64|93|
| $T...7$  | 0   |87|86|118|
| $T...4$  | 0   |97|94|124|
| $T...2$  | 0   |103|101|131|
| $T...1$  | 3   |112|110|139|
| Actual   | 1   |117|116|145|

After adding a new column to the data set as "Add_On," The summary table of descriptive statistics for it is as follows:

| Name     | Min | Median | Mean  | Max  | Std.|
| ------ | ----- | ------| ------| ------|----|
| Add_On | -9    |7      |6.34   |23     |4.71|
A new data set is defined with new variables $addx$, where x denotes the change made in the schedule 3 days before each surgery day. \
The histogram and Q-Q plot of the variable "Actual" are given in the pictures below. It seems that "Actual" follows a normal distribution. \


The histograms of different "T...x" variables are given in the picture below. It seems that "Actual" follows a normal distribution.

# Impact of Day of the Week:
## Determining whether the day of the week influences daily surgery demand by performing a relevant statistical test.

# On-Add Dependency on Weekdays:
## Examining whether the number of on-adds is influenced by the day of the week. This is done by Identifying the dates with the highest and lowest on-adds and counting the days where scheduled and actual surgeries match.

# Regression Model for Prediction:
## Developing a regression model to forecast daily surgery demand, interpreting the coefficients, and assessing model accuracy.

# Presenting to Management:
## Describing how to effectively present the forecast results to hospital management, discussing the confidence level in your predictions, and highlighting the critical aspects of the model.

# Stratification vs. Dummy Variables:
## Comparing the use of DOW as a factor with dummy variables against creating separate regression models for each day of the week, explaining the differences and implications of these approaches.

# Request for Additional Data:
## Suggesting additional variables that could be requested from the hospital to enhance the predictive accuracy of the model.
