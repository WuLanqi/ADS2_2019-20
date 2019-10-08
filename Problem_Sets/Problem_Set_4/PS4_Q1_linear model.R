set.seed(32)

x <-rnorm(1000)
y=10.8*x+0.6
plot(x,y)

index = sample(1:1000,500)
print(length(index))
y[index]=y[index]+rnorm(length(index))
plot(x,y)
