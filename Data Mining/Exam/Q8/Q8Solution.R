getwd()
setwd("D:/DataScience/Data Mining/Exam/Q8") 
BSE_Sensex <- read.csv("BSE_Sensex_Index.csv")
SGR_Close <- c()
for(i in 1:15446) {
  SGR_Close[i] <- (BSE_Sensex$Close[i] - BSE_Sensex$Close[i + 1]) / BSE_Sensex$Close[i + 1]
}
SGR_Close[15447] <- (SGR_Close[15446] + SGR_Close[15445] + SGR_Close[15444]) / 3
SGR_Close[15447]

z_SGR_Close <- c()
mean_SGR_Close <- mean(SGR_Close)
mean_SGR_Close

sd_SGR_Close <- sd(SGR_Close)
sd_SGR_Close 

for(j in 1:15447){
  z_SGR_Close[j] <- (SGR_Close[j] - mean_SGR_Close) / (sd_SGR_Close)
}
outliers_dates <- c()
outliers_count <- 0
otd <- 1
for(k in 1:15447){
  if(z_SGR_Close[k] > 3) {
    outliers_count <- outliers_count + 1
    outliers_dates[otd] <- BSE_Sensex$Date[k]
    otd <- otd + 1
  }
  if(z_SGR_Close[k] <- 3) {
    outliers_count <- outliers_count + 1
    outliers_dates[otd] <- BSE_Sensex$Date[k]
    otd <- otd + 1
  }
}
outliers_count

outliers_dates

