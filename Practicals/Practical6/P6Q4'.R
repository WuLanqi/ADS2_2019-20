library(ggplot2)
data("diamonds")
#index <- sample(length(diamonds$carat),100,replace=F)
#sampledata <- diamonds[index,]
#above is wrong, lose one column, why?
sampledata <- diamonds[sample(nrow(diamonds),100,replace=F),]
g <- ggplot(sampledata, aes(x=clarity,y=carat))
b <- g + geom_boxplot()
b
j <- b + geom_jitter(aes(size=carat,colour=price))
j
j + scale_color_gradient(limits= c(10000,15000))
j + scale_color_gradient(limits= c(10000,15000))+scale_size_continuous(limits = c(1.2,2))
