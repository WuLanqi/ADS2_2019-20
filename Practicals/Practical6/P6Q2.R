d <- ggplot(diamonds,aes(carat))+xlim(0,3)
d
d + stat_bin(aes(ymax=..count..),binwidth = 0.1,geom = "area")
d + stat_bin(aes(size=..density..),bindwidth = 0.1,geom = "point",position = "identity")

d1 <- d+geom_area(stat = "bin",aes(y=..count..))
d1
d2 <- d+geom_point(stat="bin",aes(size=..density..))
d2
