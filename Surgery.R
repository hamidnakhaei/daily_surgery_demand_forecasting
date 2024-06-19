library(psych)
library(ggplot2)
#____________Q1______________
#import data
Surgery_Data <- read.csv("Surgery.csv")
View(Surgery_Data)
str (Surgery_Data)
summary(Surgery_Data)

mean(Surgery_Data$Actual) #the number given in pdf as mean is correct
sd(Surgery_Data$Actual) #the number given in pdf as standard deviation is correct
#outliers
boxplot(Surgery_Data$Actual, main="Boxplot of Actual",
        ylab="Actual Number of Surgeries", col="cadetblue4")

index = which(Surgery_Data$Actual > 20)
outliers =Surgery_Data[-index ,]
outliers
Surgery_Data <- Surgery_Data[index ,]

boxplot(Surgery_Data$Actual, main="Boxplot of Actual",
        ylab="Actual Number of Surgeries", col="cadetblue4")

actual_mean <- mean(Surgery_Data$Actual) 
#we don't see a great decrease in mean after deleting outliers
sd(Surgery_Data$Actual) #we see a great decrease in sd after deleting outliers

#define Add_on field
Surgery_Data$Add_On <- Surgery_Data$Actual - Surgery_Data$T...1
summary(Surgery_Data$Add_On)
sd (Surgery_Data$Add_On)
#change SurgDate's format to DATE
Surgery_Data$SurgDate <- as.Date(strptime(as.character(Surgery_Data$SurgDate), "%m/%d/%Y"))

#change DOW's format to factor and reorder levels
Surgery_Data$DOW = as.factor(Surgery_Data$DOW)
Surgery_Data$DOW = factor(Surgery_Data$DOW, levels = c("Mon", "Tue", "Wed", "Thu", "Fri"))

###in this part we defined new dataset: just_add_data
#this dataset includes added number of surgeries data
just_add_data = Surgery_Data

just_add_data$addw4 = just_add_data$T...21-just_add_data$T...28
just_add_data$addw3 = just_add_data$T...14-just_add_data$T...21
just_add_data$add13 = just_add_data$T...13-just_add_data$T...14
just_add_data$add12 = just_add_data$T...12-just_add_data$T...13
just_add_data$add11 = just_add_data$T...11-just_add_data$T...12
just_add_data$add10 = just_add_data$T...10-just_add_data$T...11
just_add_data$add9 = just_add_data$T...9-just_add_data$T...10
just_add_data$add8 = just_add_data$T...8-just_add_data$T...9
just_add_data$add7 = just_add_data$T...7-just_add_data$T...8
just_add_data$add6 = just_add_data$T...6-just_add_data$T...7
just_add_data$add5 = just_add_data$T...5-just_add_data$T...6
just_add_data$add4 = just_add_data$T...4-just_add_data$T...5
just_add_data$add3 = just_add_data$T...3-just_add_data$T...4
just_add_data$add2 = just_add_data$T...2-just_add_data$T...3
just_add_data$add1 = just_add_data$T...1-just_add_data$T...2
just_add_data$addw2 = just_add_data$T...7-just_add_data$T...14
just_add_data$addw1 = just_add_data$T...4-just_add_data$T...7

drop_Ts = c("T...21", "T...14", "T...13", "T...12", "T...11", "T...10", 
            "T...9", "T...8", "T...7", "T...6", "T...5", "T...4", "T...3",
            "T...2", "T...1" , "Add_On")
just_add_data = just_add_data[, !(names(just_add_data) %in%drop_Ts)]
###end of defining dataset

#diagrams of "Actual"
hist(Surgery_Data$Actual, main = "Histogram of Number of Surgeries" ,breaks=18,
     col="dodgerblue4", xlab = "Number of Surgeries", ylab = "Frequency")

qqnorm(Surgery_Data$Actual, col="deepskyblue4")
qqline(Surgery_Data$Actual, col="firebrick2")

#histogram of added surgeries
not_show1 = c("SurgDate","DOW", "Actual", "T...28")
multi.hist(just_add_data[, !(names(just_add_data) %in%not_show1)], bcol = "aliceblue"  ,
           density = TRUE, dcol=c("red","blue"),dlty=c("solid","dotted") , breaks = 16)

#histogram of total surgeries
not_show2 = c("SurgDate","DOW", "Actual")
multi.hist(Surgery_Data[, !(names(Surgery_Data) %in%not_show2)], bcol = "aliceblue"  ,
           density = TRUE, dcol=c("red","blue"),dlty=c("solid","dotted") , breaks = 16)

#correlation between total surgeries
pairs.panels(data.frame(Surgery_Data$T...28, Surgery_Data$T...21, Surgery_Data$T...14,
                        Surgery_Data$T...7, Surgery_Data$T...5, Surgery_Data$T...3, 
                        Surgery_Data$Actual))

pairs.panels(data.frame(just_add_data$Actual, just_add_data$addw1,
                        just_add_data$addw2,
                        just_add_data$addw3, just_add_data$addw4))

# categorical factor(DOW) on numerical factor (Actual).
ggplot (data = Surgery_Data , aes(x = Actual, color=DOW)) + geom_histogram(bins = 10) + 
  facet_grid(DOW ~ .) + ggtitle("Histogram of Number of Surgeries Based on Days") +
  xlab("Actual Number of Surgeries") + ylab("Frequency")

ggplot(data = Surgery_Data , aes( x = T...4 , y = Actual , color = DOW , shape = DOW))+
  geom_point() + geom_smooth(method=lm , se = FALSE) + 
  xlab("Number of Planned Surgeries 4 Days Before") +
  ylab("Actual Number of Surgeries") + ggtitle("Scatter Plot 4Days Before-Actual")

ggplot(data = Surgery_Data , aes( x = DOW , y = Actual, fill=DOW)) +geom_boxplot() +
  ggtitle("Boxplots of Each Day") + ylab("Actual Number of Surgeries") + xlab("Days of Week")
#_________________Q2____________________
catt <- c("c1","c2" ,"c3", "c4")
Surgery_Data$actual_cat <- cut(Surgery_Data$Actual,
                         breaks = seq(min(Surgery_Data$Actual),max(Surgery_Data$Actual),
                                      (max(Surgery_Data$Actual)-min(Surgery_Data$Actual))/4),
                         labels = catt)
demand_DOW <- table (Surgery_Data$actual_cat , Surgery_Data$DOW)
demand_DOW
demand_DOW_Dependency <- chisq.test(demand_DOW)
demand_DOW_Dependency


#______________Q3_____________________

length (which(Surgery_Data$Actual == Surgery_Data$T...1))
Surgery_Data [which.max(Surgery_Data$Add_On),]
Surgery_Data [which.min(Surgery_Data$Add_On),]

# categorizing addon surgeries into 3 catogories

catt <- c("c1","c2" ,"c3")
Surgery_Data$addon_cat <- cut(Surgery_Data$Add_On,
                                   breaks = seq(min(Surgery_Data$Add_On),max(Surgery_Data$Add_On),
                                                (max(Surgery_Data$Add_On)-min(Surgery_Data$Add_On))/3),
                                   labels = catt)
addon_DOW <- table (Surgery_Data$addon_cat , Surgery_Data$DOW)
addon_DOW
addon_DOW_Dependency <- chisq.test(addon_DOW )
addon_DOW_Dependency


# ____________________Q4_____________________
#set a boundary to devide dataset into two parts
limit = max(just_add_data$SurgDate)-90

max_col_num = ncol(just_add_data)-5
for (col in 4:max_col_num) {
  mod_data = just_add_data[,1:col]
  
  train = subset(mod_data, SurgDate<=limit)
  test = subset(mod_data, SurgDate>limit)
  
  mod = lm(Actual~ . -SurgDate , data=train)
  
  base = mean(train$Actual)
  pred <- predict(mod, newdata = test)
  RSS <- sum((test$Actual-pred)^2)
  TSS <- sum((test$Actual - base)^2)
  print(1-RSS/TSS)
  print(summary(mod))
}

#using one day and DOW
max_col_num2 = 15
for (col in 3:max_col_num2) {
  mod_data = Surgery_Data[, 1:2]
  mod_data$T_col = Surgery_Data[,col]
  mod_data$Actual = Surgery_Data$Actual
  
  train = subset(mod_data, SurgDate<=limit)
  test = subset(mod_data, SurgDate>limit)
  
  mod = lm(Actual~ . -SurgDate , data=train)
  
  base = mean(train$Actual)
  pred <- predict(mod, newdata = test)
  RSS <- sum((test$Actual-pred)^2)
  TSS <- sum((test$Actual - base)^2)
  print(c(colnames(Surgery_Data)[col], 1-RSS/TSS))
  print(summary(mod))
}

train = subset(Surgery_Data, SurgDate<=limit)
test = subset(Surgery_Data, SurgDate>limit)
model <- lm(Actual ~ T...4 + DOW + T...4:DOW, data= train)
summary(model)
baseline2 <- mean(train$Actual)
pred2 <- predict(model, newdata = test)
RSS2 <- sum((test$Actual-pred2)^2)
TSS2 <- sum((test$Actual - baseline2)^2)
1-RSS2/TSS2

# تفسیر پذیری بدی داره در حالی که خطای تست رو یه کمی بهتر میکنه
model4 <- lm(Actual ~ T...4 + DOW , data= train)
summary(model4)
predict(model4, newdata = data.frame(T...4 = 100 , DOW = "Fri") , interval = "prediction" , level = 0.95)
confint(model4 , level = 0.95)
confint(model4 , level = 0.8)
plot(model4)

#_________________Q6____________________
daily_reg = function (day) {
  selected_data = subset (Surgery_Data, Surgery_Data$DOW==day)
  n_train = selected_data[1:(nrow(selected_data)-18),]
  n_test = selected_data [(nrow(selected_data)-17):(nrow(selected_data)),]

  daily_mod = lm(Actual~ T...4, data=n_train)
  
  n_base = mean(n_train$Actual)
  n_pred <- predict(daily_mod, newdata = n_test)
  n_RSS <- sum((n_test$Actual-n_pred)^2)
  n_TSS <- sum((n_test$Actual - n_base)^2)
  
  print(c(day, 1-n_RSS/n_TSS))
  print(summary(daily_mod))
}

days = unique(just_add_data$DOW)
for (day in days) {
  daily_reg(day)
}
