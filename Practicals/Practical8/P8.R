#Q1
class1<- runif(26, min = 0,max = 100)
mean_list <- c()
for (i in 1:10000) {
  sample_grade <- class1[sample(1:26,20,replace=F)]
  mean <- mean(sample_grade)
  mean_list <- c(mean_list,mean)
}
#the for loop can be replaced by following code:
#task1 = replicate(10000,mean(runif(26,0,100)))
#mean(task1<40)
#mean(task1<40)=sum(task1<40)/10000
#I found that the sample code did not pick e.g.20 samples from the class

grade40 <- sum(mean_list < 40)
p <- grade40/length(mean_list)
p

hist(mean_list)

#Q2
class2 <- runif(26, min = 0,max = 80)
mean_list2 <- c()
for (i in 1:10000) {
  sample_grade2 <- class2[sample(1:26,20,replace=F)]
  mean2 <- mean(sample_grade2)
  mean_list2 <- c(mean_list2,mean2)
}
grade40_2 <- sum(mean_list2 < 40)
p2 <- grade40_2/length(mean_list2)
p2
#task2unlucky = replicate(100000, mean(runif(26,0,80)))
#task2control = replicate(100000, mean(runif(26,0,100)))
#mean(task2unlucky > task2control)
hist(mean_list2,xlim=c(0,100),ylim=c(0,1500),xlab = "mean_list",ylab="Frequency",main="Histogram of mean list",border = "red")
par(new=T)
hist(mean_list,xlim = c(0,100),ylim=c(0,1500),xlab = "mean_list",ylab="Frequency",main="Histogram of mean list",border = "blue")

#Q3
grade_all <- rnorm(10000,mean = 50, sd=10)
percent <- sum(grade_all<64)/10000
grade_e <- 100*percent
grade_e
#grade_e <- pnorm(64,50,10)*100

grade_list3 <- c()
for (i in c(64,63,62,59)) {
  percent3 <- sum(grade_all<i)/10000
  grade3 <- 100*percent3
  grade_list3 <- c(grade_list3,grade3)
}
mean(grade_list3)
#mean(pnorm(c(64,63,62,59),50,10)*100)

grade_list4 <- c()
for (i in c(70,63,61,56)) {
  percent4 <- sum(grade_all<i)/10000
  grade4 <- 100*percent4
  grade_list4 <- c(grade_list4,grade4)
}
mean(grade_list4)
#mean(pnorm(c(70,63,61,56),50,10)*100)

#Q4
p_list <- c()
for (i in 1:1000) {
  #it is wrong
  class4 <- rnorm(26,mean=40,sd=8)
  hist(class4)
  mean(class4)
  class_normal <- pnorm(class4,50,10)*100
  if (mean(class_normal) < mean(class1)) {
    p=0
  }else{
    p=1
  }
  p_list <- c(p_list,p)
  
}
sum(p_list=1)/1000

#task4unlucky = replicate(100000, mean(sample(UnluckyNormScores, 26)))
#task4control = replicate(100000, mean(runif(26, 0, 100)))
#mean(task4unlucky > task4control)

grade_unlucky <- pnorm(rnorm(10000,mean = 40,sd=8),mean = 50,sd=10)*100
sample_unlucky <- sample(grade_unlucky,26)
mean(sample_unlucky)
grade_normal <- rnorm(10000,40,8)
sample_normal <- sample(grade_normal,26)
mean(sample_normal)
mean(sample_unlucky)<mean(sample_normal)

number <- runif(10000,min = 5,max = 40)
sample_normal2 <- sample(grade_normal,sample(number,1))
#the number of each classs <- runif(1,5,40)
mean(sample_normal2)
mean(sample_unlucky)<mean(sample_normal2)

#task4control = replicate(100000, mean(runif(round(runif(1,5,40)),0,100)))
#mean(task4unlucky > task4control)


#Q5(problem-set8)
mean_distribution <- rnorm(10000,50,5)
raw_score <- c()
for (i in 1:9999) {
  meani <- sample(mean_distribution,1)
  classi <- rnorm(sample(number,1),meani,10)
  raw_score <- c(raw_score,classi)
  #mean_distribution <- mean_distribution - meani
}
raw_unlucky <- rnorm(26,sample(mean_distribution,1),8)
raw_score <- c(raw_score,raw_unlucky)
summary(raw_score)
hist(raw_score)
#pnorm???
normative_unlucky <- pnorm(raw_unlucky,mean = mean(raw_score),sd=sd(raw_score))*100
hist(normative_unlucky)
summary(normative_unlucky)


allrawvector = c()
allrawlist = c()
for (i in 1:10000) {
  sampleclass = rnorm(round(runif(1,5,40)),rnorm(1,50,5),10)
  allrawvector = c(allrawvector, sampleclass)
  allrawlist = c(allrawlist, list(sampleclass)) 
}


task5unlucky = c()
for (i in 1:10000) {
  task5unlucky = c(task5unlucky, mean(rnorm(1,40,8) > allrawvector)*100) 
}
mean(task5unlucky)

hist(task5unlucky)

allnormlist = c()
for (i in 1:10000) {
  classnorm = c()
  for (j in 1:(length(allrawlist[[i]]))){
    classnorm = c(classnorm, mean(allrawlist[[i]][j] > allrawvector)*100)
    allnormlist = c(allnormlist, list(classnorm))
    }
}

count = 0
for (i in 1:10000) {
  if (mean(sample(task5unlucky,26)) > mean(allnormlist[[i]])){
    count = count + 1
  }
}
count