#5.	Use Support Vector machine for above problem. And compare the performance of both. Explain the input parameters you provided for the classifier. (10M)


setwd("D:/DataScience/Data Mining/Exam/Q5")
liver_data<-read.csv("Liver_data.csv", header = FALSE, col.names = c("mcv", "alkphos", "sgpt", "sgot", "gammagt", "drinks","selector"))

str(liver_data)

#replacing the decision values into 4 classes

liver_data$selector <- as.factor(liver_data$selector)
liver_data$drinks <- cut(liver_data$drinks, breaks = c(0, 5,10,15,20), labels = c('C1', 'C2', "C3", 'C4'), right = FALSE) 

liver_data <- na.omit(liver_data)


#selecting the train and test values 

train = subset(liver_data, liver_data$selector == 1)
str(train)

test = subset(liver_data, liver_data$selector == 2)
str(test)

#train and test  variable

x_train <- subset(train, select = -c(selector, drinks))
x_test <- subset(test, select = -c(selector, drinks))

#train and test target variable

y_train = train[,6, drop = TRUE]
y_test = test[,6, drop = TRUE]

#library for svm 
library(e1071)

#misclassification error for training set
fit = svm(x_train, y_train)
1-sum(y_train==predict(fit,x_train))/length(y_train)   #0.2027

#misclassification error for test set
fit = svm(x_test, y_test)
1-sum(y_test==predict(fit,x_test))/length(y_test)    #0.265


#The misclassification error for KNN is less than SVM so, KNN is preferred when compared to  SVM


