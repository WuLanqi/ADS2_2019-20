population <- rnorm(1e6,100,5)
sd_list <- c()
SEM_list <- c()
for (i in 5:100) {
  sampling_distribution <- c()
  sd_sum = 0
  for (t in 1:1000){
    index <- sample(1e6,i,replace=TRUE)
    randomi <- population[index]
    randommean <- mean(randomi)
    randomsd <- sd(randomi)
    sd_sum = sd_sum + randomsd
    sampling_distribution <- c(sampling_distribution,randommean)
  }
  sd1 = sd_sum/1000
  sd <- sd(sampling_distribution)
  SEM <- sd1/sqrt(i)
  sd_list <- c(sd_list,sd)
  SEM_list <- c(SEM_list,SEM)
}
plot(5:100,sd_list,xlab = "sample size",ylab = "sd of sampling distribution")
points(5:100,SEM_list,col="blue")
