#Looking at student grades
marks <- rnorm(100,86,5)
hist(marks,xlab = "marks",ylab = "frequency",col = "lightblue")
grade_81_91 <- sum(marks<81 | marks>91)
grade_81_91
grade_76_96 <- sum(marks<76 | marks>96)
grade_76_96

#Getting good grades
pass = 0
for (i in 1:1000000) {
  correct <- sample(1:4,20,replace=TRUE)
  guesses <- sample(1:4,20,replace=TRUE)
  score <- sum(correct==guesses)
  if (score >=10) {
    pass = pass +1
  }
}
pass/1000000

p_passing = 0
for (s in 10:20) {
  p_s = 0.25^s*0.75^(20-s)*choose(20,s)
  p_passing = p_passing + p_s
}
p_passing

#each of the answers is chosen as the correct answer the same number of times
while(correct <-sample(1:4,20,replace=TRUE) ) {
  if (sum(correct==1)==5 &sum(correct==2)==5& sum(correct==3)==5&sum(correct==4)==5) {
    break
  }
}
correct