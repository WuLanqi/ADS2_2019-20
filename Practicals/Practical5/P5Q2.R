data <- read.csv("/Users/lanqi/Desktop/Tests_PGP3.csv",na.strings = c("NA",""))
class(data$sex)

data$sex <- gsub("1","M",as.character(data$sex))
data$sex <- gsub("2","F",as.character(data$sex))
class(data$sex)
data$sex

boxplot(data$elisa.od~data$sex)
boxplot(data$elisa.od~data$age.f)
data_new = drop_na(data)
head(data_new)
anyNA(data_new)
boxplot(data_new$elisa.od~data_new$sex)
boxplot(data_new$elisa.od~data_new$age.f)

data2 <- gather(data_new,key = "time.point",value = "ELISA.od",elisa.od:elisa.pre.od,factor_key = TRUE)
library(ggplot2)
ggplot(data = data2,aes(age.f,ELISA.od,col=time.point))+geom_boxplot()

data3 <- spread(data = data2,key = time.point, value = ELISA.od)

       
       