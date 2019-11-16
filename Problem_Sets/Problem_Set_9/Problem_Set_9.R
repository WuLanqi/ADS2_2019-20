barley <- readLines("/Users/lanqi/Desktop/barley.txt")
barley <- as.numeric(barley)
hist(barley)
test <- t.test(barley,mu=50,alternative = "less")
test

for (i in 50:1) {
  sample <- sample(barley,i,replace=T)
  testi <- t.test(sample,mu=50,alternative = "less")
  if (testi$p.value >0.05) {
    print(i)
    break
  }
}