#1
ND_1 <- rnorm(100,mean = 143,sd=48)
TW_1 <- rnorm(100,mean = 143,sd=48)
ND_2 <- rnorm(10000,mean = 143,sd=48)
TW_2 <- rnorm(10000,mean = 156,sd=55)

dataset1 <- data.frame(ND_1,TW_1)
dataset2 <- data.frame(ND_2,TW_2)
#2
t.test(dataset1$ND_1,dataset1$TW_1,paired = T)
t.test(dataset2$ND_2,dataset2$TW_2,paired = T)

set.seed(1)
index <- sample(10000,100,replace=FALSE)
#[number,] to get specific rows
sample_people <- dataset2[index, ]
t.test(sample_people$ND_2,sample_people$TW_2,paired = T)

for (i in 1:5) {
  #each time draw the same random numbers
  set.seed(1)
  index <- sample(10000,100,replace=FALSE)
  sample_people <- dataset2[index, ]
  print(t.test(sample_people$ND_2,sample_people$TW_2,paired = T))
}

#3
age <- sample(18:80,10000,replace=TRUE)
gender <- sample(0:1,10000,replace=TRUE)
dataset2 <- cbind(dataset2,age,gender)
#gender cannot be treated as integer, so make them to factor
dataset2$gender=as.factor(dataset2$gender)
#gender <- sample(c("M","F"),10000,replace=T)
dataset2$age=as.factor(dataset2$age)
#install.packages("ggplot2")
library(ggplot2)
p=ggplot(dataset2,aes(x=gender,y=ND_2))
p+geom_boxplot()
p=ggplot(dataset2,aes(x=gender,y=TW_2))
p+geom_boxplot()
p=ggplot(dataset2,aes(x=age,y=ND_2))
p+geom_boxplot()
p=ggplot(dataset2,aes(x=age,y=TW_2))
p+geom_boxplot()

#4
write.csv(dataset1,file = "/Users/lanqi/Desktop/dataset.csv")
