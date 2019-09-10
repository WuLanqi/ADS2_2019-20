chicago <- read.csv("/Users/lanqi/Desktop/ADS2_2019-20/Practicals/Practical1_Probability_and_Simulation/Chicago2013.csv")
head(chicago)
table(chicago$Country)
geom_histogram(chicago$Time)
hist(chicago$Time)
index <- sample(length(chicago$Name),10,replace = FALSE)
sample <- chicago[index,]
#[row,line]
hist(sample$Time)

