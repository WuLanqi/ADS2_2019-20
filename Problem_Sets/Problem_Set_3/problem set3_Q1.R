#3 dice
number_distribution3 <- c()
for (t in 1:1000) {
  n1 <- sample(6,1,replace=TRUE)
  n2 <- sample(6,1,replace=TRUE)
  n3 <- sample(6,1,replace=TRUE)
  sum <- n1+n2+n3
  number_distribution3 <- c(number_distribution3,sum)
}
hist(number_distribution3)
#4 dice
number_distribution4 <- c()
for (t in 1:1000) {
  n1 <- sample(6,1,replace=TRUE)
  n2 <- sample(6,1,replace=TRUE)
  n3 <- sample(6,1,replace=TRUE)
  n4 <- sample(6,1,replace=TRUE)
  sum <- n1+n2+n3+n4
  number_distribution4 <- c(number_distribution4,sum)
}
hist(number_distribution4)
#5 dice
number_distribution5 <- c()
for (t in 1:1000) {
  n1 <- sample(6,1,replace=TRUE)
  n2 <- sample(6,1,replace=TRUE)
  n3 <- sample(6,1,replace=TRUE)
  n4 <- sample(6,1,replace=TRUE)
  n5 <- sample(6,1,replace=TRUE)
  sum <- n1+n2+n3+n4+n5
  number_distribution5 <- c(number_distribution5,sum)
}
hist(number_distribution5)
