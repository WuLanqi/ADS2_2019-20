#don't add "group=cut", group = "clarity" automatically
p <- ggplot(data=diamonds,aes(x=clarity,y=carat))
p1 <- p+geom_boxplot(aes(colour=cut),position = "dodge") 
p1
sm <- p1 + geom_smooth(aes(group=cut),method="lm")
sm

#divede according to cut and present in vertical way
sm + facet_grid(.~cut)

#present in horizontal way
sm + facet_grid(color~.)

sm + facet_grid(color~cut)

sm + labs(title="carats vs clarity box plot")

plot <- sm + scale_color_brewer()

png(file="my_plot.png",width = 500,height = 500,units = "px")
dev.off()
