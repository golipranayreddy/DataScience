#7.	Compute the misclassification error that would result if you used your clustering rule to classify the data by assigning the majority class of the cluster.	


setwd("D:/DataScience/Data Mining/Exam/Q7")
liver_data<-read.csv("Liver_data.csv", header = FALSE, col.names = c("mcv", "alkphos", "sgpt", "sgot", "gammagt", "drinks","selector"))

str(data)

x_data = liver_data[,1:5]
y_data = liver_data[,6]

#misclassification error rate
fit = kmeans(x,4)
library(class)
knnfit = knn(fit$centers,x,as.factor(c(1,2,3,4)))
1-sum(knnfit == y)/length(y)


