getwd()
setwd("D:/DataScience/Data Mining/Exam/Q3")
library(caret)
library(rpart.plot)
lenses = read.csv("lenses_data.csv", header = FALSE, col.names = c("1", "2", "3", "4", "5", "Label"))
str(lenses)
summary(lenses)
x = lenses[,1:4]
y = as.factor(lenses$Label)
models = rpart(y~.,x,control=rpart.control(minsplit=0,minbucket=0,cp=-1, maxcompete=0, maxsurrogate=0, usesurrogate=0, xval=0,maxdepth=5))


plot(models)
text(models)

rpart.plot(models)
sum(y==predict(models,x,type="class"))/length(y)

#miscalassification error
1-sum(y==predict(models,x,type="class"))/length(y)

#16 % of the data are predicted wrong


models1 = rpart(y~.,x,control=rpart.control(minsplit=0,minbucket=0,cp=-1, maxcompete=0, maxsurrogate=0, usesurrogate=0, xval=0,maxdepth=7))

plot(models1)
text(models1)

rpart.plot(models1)

#Information Gain
sum(y==predict(models1,x,type="class"))/length(y)

#miscalassification error
1-sum(y==predict(models1,x,type="class"))/length(y)

