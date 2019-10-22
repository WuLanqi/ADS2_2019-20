library(ggplot2)
data("diamonds")
g <- ggplot(diamonds,aes(clarity))
g
g + geom_bar(aes(fill = cut),stat="count",position = "stack")
g + geom_bar(aes(fill = cut),stat="count",position = "fill")
g + geom_bar(aes(fill = cut),stat="count",position = "dodge")
