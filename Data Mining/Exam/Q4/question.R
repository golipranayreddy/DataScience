getwd()
setwd("D:/DataScience/Data Mining/Exam/Q4")
liver = read.csv("Liver_data.csv", header = FALSE, col.names = c("mcv", "alkphos", "sgpt", "sgot", "gammagt", "drinks","selector"))
str(liver)

liver$selector <- as.factor(liver$selector)

liver$drinks <- cut(liver$drinks, breaks = c(0, 5,10,15,20), 
                    labels = c('C1', 'C2', "C3", 'C4'), right = FALSE)

liver <- na.omit(liver)


train = subset(liver, liver$selector == 1)

str(train)

tests = subset(liver, liver$selector == 2)

str(tests)

dim(train)
dim(tests)

x_train <- subset(train, select = -c(selector, drinks))
x_tests <- subset(tests, select = -c(selector, drinks))

library(class)

y_train = train[,6, drop = TRUE]
y_tests = tests[,6, drop = TRUE]
length(train)
length(tests)
#k = 1
fit1 = knn(x_train,x_train,y_train,k=1)  
1-sum(y_tests==fit1)/length(y_tests)   
# Misclassification error : 0.5
#K = 2
fit2 = knn(x_train,x_train,y_train,k=2)
1-sum(y_tests==fit2)/length(y_tests)
#Misclassification error: 0.51
#k = 3
fit3 = knn(x_train,x_train,y_train,k=3)
1-sum(y_tests==fit3)/length(y_tests)
