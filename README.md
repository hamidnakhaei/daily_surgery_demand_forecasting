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
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/1.png) \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/2.png) \

The histograms of different "T...x" variables are given in the picture below. It seems that "Actual" follows a normal distribution. \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/3.png) \
Scatter plots for the variables T…28, T…21, T…14, T…7, T…5, T…3, T…2, and Actual are shown pairwise in the figure below. In the last row of this figure, it is observed that the correlation between the scheduled number of surgeries and the actual number of surgeries increases as the day of surgery approaches. Therefore, the number of surgeries booked closer to the surgery day, such as the variables T…1 or T…3, has a greater impact on the actual number of surgeries compared to the number of surgeries booked farther in advance, like T…28. \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/4.png) \
Scatter plots for the variables addw4, addw3, addw2, addw1, Add_On, and Actual are shown pairwise in the figure below. The relatively low correlation among these variables is clearly visible from this figure. \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/5.png) \
To examine the impact of the day of the week (a categorical variable) on the number of surgeries (a continuous variable), a box plot and a histogram categorized by the day of the week were used. These plots are shown in the figures below. The histogram indicates that the number of surgeries on Fridays is generally lower than on other days, with its chart skewed to the left compared to others. Additionally, the highest number of surgeries typically occurs on Thursdays. \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/6.png) \
The box plot of the actual number of surgeries for each day of the week individually demonstrates differences between the days. For instance, fewer surgeries are usually performed on Fridays, while more surgeries are performed on Thursdays compared to other days. This chart also confirms the previously mentioned point that the lowest number of surgeries occurs on Fridays. \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/7.png) \
The figure below shows the scatter plot of the actual number of surgeries based on the variable T…4 and categorized by the day of the week. It is observed that the fitted lines for each day of the week differ. \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/8.png)
# Impact of Day of the Week:
## Determining whether the day of the week influences daily surgery demand by performing a relevant statistical test.
Here, the impact of a categorical variable (day of the week) on a continuous variable (actual number of surgeries) is examined. To do this, the continuous variable is divided into several categories to convert it into a categorical variable. A chi-square test is then used to examine the independence of these two categorical variable. The entire range of the actual number of surgeries is divided into four intervals of equal length. When a continuous variable is converted into a categorical variable in this way, some information is lost because all the data within each interval are considered equal, even though they are quantitatively different. The more categories there are, the less information is lost, but it also means fewer data points per cell in the corresponding data table. For the chi-square test, there should not be too few data points in each cell, so the number of categories must be chosen appropriately. After trial and error, the largest number of categories that allowed the chi-square test to be performed correctly was four, hence the number of categories was set to four. \
For categorization, a new variable named actual_cat is added to the dataset, which takes one of the values c1, c2, c3, and c4 based on the "Actual" variable. A table of DOW and actual_cat is then created, which calculates the number of data points in each category for each day. This table, along with the chi-square test results, is shown in the table below. \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/9.png) \
Since the p-value is less than 0.05, the null hypothesis is rejected, and it can be concluded that these two variables are not independent, indicating that the day of the week can influence the number of surgeries.
# On-Add Dependency on Weekdays:
## Examining whether the number of on-adds is influenced by the day of the week. This is done by Identifying the dates with the highest and lowest on-adds and counting the days where scheduled and actual surgeries match.
This section is very similar to the previous one, and the procedure followed there is also implemented here, with the difference that the number of categories is considered to be three. The reasons for this are the same as those explained in the previous section. For this purpose, a new variable named addon_cat is added to the dataset, which takes the values c1, c2, and c3. The table of these variables and the chi-square test results are shown in the table below. \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/10.png) \
Since the p-value is not less than 0.05, there is not enough evidence to reject the null hypothesis. It can be concluded that these two variables are independent, and the day of the week does not influence Add_On. \
The lowest Add_On occurred on 2012/05/14, and the highest on 2012/08/01. On 17 days, Add_On was zero, and the scheduled number of surgeries on the last day matched the final actual number of surgeries.
# Regression Model for Prediction:
## Developing a regression model to forecast daily surgery demand, interpreting the coefficients, and assessing model accuracy.

# Presenting to Management:
## Describing how to effectively present the forecast results to hospital management, discussing the confidence level in your predictions, and highlighting the critical aspects of the model.

# Stratification vs. Dummy Variables:
## Comparing the use of DOW as a factor with dummy variables against creating separate regression models for each day of the week, explaining the differences and implications of these approaches.

# Request for Additional Data:
## Suggesting additional variables that could be requested from the hospital to enhance the predictive accuracy of the model.
