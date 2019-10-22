library(ggplot2)
#import the data
data("diamonds")
g <- ggplot(data = diamonds,aes(x=carat,y=price,group=cut))
g1 <- g+geom_point(stat = "identity",aes(colour = cut))
g1
g2 <- g1+geom_point(aes(size=0.1,color=cut,alpha=1/5))
g2
