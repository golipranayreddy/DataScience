getwd()
setwd("D:/DataScience/Data Mining/Exam/Q2") 
apr = read.csv("dataset.csv", header = TRUE); 
apr$TID <- NULL 
library(arules) 
transactions = read.transactions("Itemset.csv", sep=',', rm.duplicates = TRUE) 
rules <- apriori(transactions, parameter = list(sup = 0.03, conf = 0.5,target="rules"))  
inspect(sort(rules, by = 'lift')[1:15])  
itemFrequencyPlot(transactions, topN = 5)
