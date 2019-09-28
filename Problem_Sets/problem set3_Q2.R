distribution <- c()
for (i in 1:1000) {
  dir <- sum(sample(c(0,1),8,replace=TRUE,p=c(0.8,0.2)))
  distribution <- c(distribution,dir)
}
hist(distribution,main = "Bean machines")

