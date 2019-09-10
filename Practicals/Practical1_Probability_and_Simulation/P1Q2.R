test <- rnorm(10,0,1)
men <- rnorm(45,172,7)
women <- rnorm(55,158.5,6)
boxplot(men,main="box plot of the men")
boxplot(women,main="box plot of the women")

students <- c(men,women)
#c combine values into a Vector or List
boxplot(students)
max(students)
min(students)
sum(students>170)
