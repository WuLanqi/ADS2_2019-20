temp <- read.csv("/Users/lanqi/Desktop/OrionTemp.csv")
head(temp)
summary(temp)
length(temp[,])
individuals <- temp[sample(length(temp[,]),10,replace=F),]
individuals
t.test(individuals,mu=37,alternative = "two.sided")
mean(individuals)
sd(individuals)

#Generate and plot the null distribution for your test
x <- seq(-10,10,0.01)
y <- dt(x,df=9)
plot(x,y)
#p-value
sum(y[which(x>2.9047)])*0.01*2

x_list <- c()
y_list <- c()
prob_list <- c()
for (j in 1:1000){
  count=0
  for (i in 1:j) {
    individuals <- temp[sample(length(temp[,]),10,replace=F),]
    res <- t.test(individuals,mu=37,alternative = "two.sided")
    if (res$p.value<=0.05){
      count = count+1
    }
    prob <- count/j
  }
  x_list <- c(x_list,j)
  y_list <- c(y_list,count)
  prob_list <- c(prob_list,prob)
  #prob <- count/100
  #prob
}
plot(x_list,y_list,xlab = "Number of tests",ylab = "Num tests with p<=0.05",main = "One-sample t_test, sample size=10")
prob_list

count=0
for (i in 1:100) {
  individuals <- temp[sample(length(temp[,]),10,replace=F),]
  res <- t.test(individuals,mu=37,alternative = "two.sided")
  if (res$p.value<=0.05){
    count = count+1
  }
}
prob <- count/100
prob
