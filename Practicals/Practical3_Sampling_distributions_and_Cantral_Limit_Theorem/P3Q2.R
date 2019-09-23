#1 dice
number_distribution <- c()
for (t in 1:1000) {
  number <- sample(6,1,replace=TRUE)
  number_distribution <- c(number_distribution,number)
}
hist(number_distribution,breaks = 0.5:6.5)
#2 dice
number_distribution2 <- c()
for (t in 1:1000) {
  n1 <- sample(6,1,replace=TRUE)
  n2 <- sample(6,1,replace=TRUE)
  sum <- n1+n2
  number_distribution2 <- c(number_distribution2,sum)
}
hist(number_distribution2,breaks = 0.5:12.5)