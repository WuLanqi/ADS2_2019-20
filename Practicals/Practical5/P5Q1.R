#1)
original_data= read.csv("/Users/lanqi/Desktop/WNV_mosquito_test_results.csv",na.strings = "")

levels(as.factor(original_data$LOCATION))

#summary(original_data)
#install.packages("tidyr")
library(tidyr)
data = drop_na(original_data)
anyNA(data)

#2)
class(data$SEASON.YEAR)
typeof(data$SEASON.YEAR)
#difference between them?

#3)
colnames(data)[1] <- "YEAR"
head(data)

#4)
typeof(data$TEST.DATE)
data$TEST.DATE <- as.POSIXct(data$TEST.DATE,tz="America/Chicago",format="%m/%d/%Y %H:%M:%S")
class(data$TEST.DATE)
head(data)

dat1 <- data$TEST.DATE[1]
attributes(dat1)
attributes(dat1)$tzone <- "America/Los_Angeles"
dat1


#5)
#???????????
data$LOCATION <- gsub("[()]","",data$LOCATION,perl = T)
head(data)
data <- separate(data,LOCATION,into=c("LATITUDE", "LONGITUDE"),sep = ",",remove = F, fill = "left" ,convert = T)
data
