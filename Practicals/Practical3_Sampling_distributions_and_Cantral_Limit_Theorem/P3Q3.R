wing_spans <- read.csv("/Users/lanqi/Documents/ADS2/semester1/week3/dragons.csv")
hist(wing_spans$wingspan)
sampling_distribution <- c()
for (t in 1:1000) {
  index <- sample(500,10,replace=FALSE)
  sample_dragons <- (wing_spans$wingspan)[index]
  mean <- mean(sample_dragons)
  sampling_distribution <- c(sampling_distribution,mean)
}
hist(sampling_distribution,xlab = "means")
