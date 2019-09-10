birthday <- sample(365,26,replace=TRUE)
length(birthday)
length(unique(birthday))


nl <- c()
for (n in 1:50) {
  l <- c()
  for (t in 1:1000) {
    birthday <- sample(365,n,replace=TRUE)
    if (length(unique(birthday)) < n) {s=1
    } else {
      s=0}
    l <- c(l,s)
  }
  op <- sum(l)/length(l)
  nl <- c(nl,op)
}
plot(nl,main = "Birthday problem", xlab = "class size", ylab = "probability of a shared birthday")
