sm1 <- sm + scale_y_continuous(trans="log10")
sm1 <- sm1 + ylab("carat(log10 of y)")
sm1
p4 <- ggplot(data=diamonds,aes(x=clarity,y=log10(carat)))+ geom_boxplot(aes(colour=cut),position = "dodge") 
p4 <- p4 + ylab("log10 of carat")
p4


p4.3 <- ggplot(data=diamonds,aes(x=clarity,y=carat))+ geom_boxplot(aes(clarity,carat,colour=cut),position = "dodge") + geom_smooth(aes(clarity,carat,group=cut),method="lm") 
p4.3

sm1 + scale_y_continuous(limits =c(0.3,3.0))
