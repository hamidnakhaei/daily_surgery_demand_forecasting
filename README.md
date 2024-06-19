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
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/56ee7b65af7be8af4de6978d43f4a5b47e42f85b/Fig/7.png) \
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
The dependent and independent variables need to be identified to create the regression model. The dependent variable is the number of daily surgeries, or "Actual", but various combinations of independent variables can be used. Three different approaches were considered to create an appropriate regression model, and ultimately the best model was selected. The first and second approaches involve using the add and T variables as independent variables, respectively. In the second approach, since the T variables are correlated, a model containing more than two T variables was not created. The last approach considers the combination effect in the independent variables, which will be explained later. It should be noted that the day of the week was used in all three approaches because the day of the week influences the number of surgeries. \
To validate the model, the data were divided into two sets. Some data were used to train the regression model, and the rest (test data) were used to validate the model. To separate the training and test data, the latest date was taken, and 90 days were subtracted from it. Since data is not available for all days of the week, fewer than 90 rows of data were eventually obtained for testing, with approximately 26% of the data allocated to testing. The $R^2$ value on the test data was considered a criterion for model validation. \
Using data closer to the day of surgery increases model accuracy, but makes resource management decisions harder for the manager. Therefore, a middle ground should be considered. This decision should preferably be made in consultation with the management or head nurse or with a specialist. Here, it is assumed that if the number of surgeries is predicted 4 days before the actual surgery day, there will be enough time for resource management. \
In the first approach, the day of the week, T…28, and other add variables are used. Initially, only the day of the week and T…28 variables are used, and new variables are gradually added to the model. This loop continues until we reach to add4. By comparing the outputs, it was found that increasing the number of variables and getting closer to the surgery day improves model accuracy and the $R^2$ value for the test. The coefficients and other characteristics of the best model in this loop are shown in the table below. \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/11.png) \
In this model, all variables are significant except the dummy variables for Tuesday, Wednesday, and Thursday. These three variables are removed from the model, and the other variables remain. The model validation characteristics are shown in the table below. \
| criterion     | $R^2$ on training data | $R^2$ on test data |
| ------ | ----- | ------|
| value | 0.75   |0.55      |

In the second approach, besides the day of the week, the T variables are used. A new for loop is created, where one of the T columns is taken in each iteration and modeled with DOW. Results show that selecting a day closer to the surgery improves the model accuracy ($R_2$). The validation characteristics for models with T…4 and T…5 are shown in the table below. \
|     | $R^2$ on training data | $R^2$ on test data |
| ------ | ----- | ------|
| T...4 model | 0.73   |0.62      |
| T...5 model | 0.73   |0.55      |

As observed, these two models perform similarly for the training data but differ significantly for the test data. Therefore, the selected model from the second approach is the one related to T…4, with its coefficients and other characteristics shown in the table below. \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/12.png) \
It is worth noting that in this model, the DOWWed variable is removed because it has a high p-value, indicating that it is not significantly different from zero. \
Comparing the first and second approaches, it can be said that the T…4 variable used in the second approach is the sum of all the variables in the first approach except DOW. In the second approach, instead of using 13 variables including T…28, addw4, addw3 up to add4, a function of these variables (the sum function) is used. Considering the $R_2$ values for the test and training data in the first approach, it is observed that there is a significant difference between them, which can indicate overfitting. The model predicts the training data well but not the test data. The difference in model accuracy between the test and training data in the second approach is significantly reduced. The cause of overfitting can be attributed to the large number of variables in the first approach. The more variables there are, the more parameters there are, and the more complex the model becomes. Additionally, the simpler the model, the better, and so far, the model from the second approach is the selected one. \
The third approach is very similar to the second, with the difference that the combination effect of the DOW and T…4 variables is also considered. The validation characteristics of this model are shown in the table below. \
| criterion     | $R^2$ on training data | $R^2$ on test data |
| ------ | ----- | ------|
| value | 0.74   |0.62      |

It is observed that this model does not offer a significant advantage over the model from the second approach. The coefficients and other characteristics of this model are shown in the table below. \
![](https://github.com/hamidnakhaei/daily_surgery_demand_forecasting/blob/e069c3994185752067040d931b3ed3a13439152a/Fig/13.png) \
Besides not obtaining a significant advantage from this model, it also has less interpretability than the previous model, as most of its variables are insignificant and are removed from the model. Therefore, the model obtained in the second approach is better than those in the first and third approaches and is selected as the final model.

Each coefficient in the model, as shown in Table 4.4, has its own meaning and interpretation. It is initially noted that the stars in the last column indicate that the obtained numbers are not randomly non-zero and have a significant difference from zero. The more stars, the more significant the difference of that coefficient from zero. It is observed that all variables except the dummy variable for Wednesday are significant, and hence the


# Presenting to Management:
## Describing how to effectively present the forecast results to hospital management, discussing the confidence level in your predictions, and highlighting the critical aspects of the model.

# Stratification vs. Dummy Variables:
## Comparing the use of DOW as a factor with dummy variables against creating separate regression models for each day of the week, explaining the differences and implications of these approaches.

# Request for Additional Data:
## Suggesting additional variables that could be requested from the hospital to enhance the predictive accuracy of the model.
