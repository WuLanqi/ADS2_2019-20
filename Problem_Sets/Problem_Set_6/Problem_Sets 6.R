library("tidyr")
library("dplyr")
library("ggplot2")
gdp <- read.csv("/Users/lanqi/Desktop/GDP.csv",na.strings = " ",header = T,check.names = F)
#na.strings: a character vector of strings which are to be interpreted as NA values. 
#header: a logical value indicating whether the file contains the names of the variables as its first line.
#check.names: If TRUE then the names of the variables in the data frame are checked to ensure that they are syntactically valid variable names. 
gdp <- gather(gdp,key = "Year",value = "GDP",factor_key = T,-CountryName,convert = T)
gdp1 <- drop_na(gdp)
gdp_sub <- dplyr::filter(gdp1,CountryName %in% c("France","Germany","Italy","Greece"),Year %in% c(1960,1970,1980,1990,2000,2010,2018))
summary(gdp_sub)
g <- ggplot(gdp_sub,aes(x=Year,y=GDP,colour=CountryName))
g1 <- g+geom_point()+geom_line()+geom_text(aes(label=GDP),hjust=0.1,nudge_x = 0.05,size=2)+labs(title = "GDP trends in the countries")
g1
#in geom_text, teacher adds:hjust = 0.1, nudge_x = 0.05 ,size=2
g2 <- g1+scale_y_continuous(trans = "log2")+facet_grid(.~CountryName)
g2
#facet_wrap(~CountryName,ncol = 4)
g+geom_point()+geom_smooth(method = "loess")
g+geom_area(aes(fill=CountryName),position = "fill")
#aes(fill=CountryName)
g+geom_bar(stat="identity",aes(group=CountryName,fill=CountryName),position = "dodge")
#stat = "identity",aes(group=CountryName,fill=CountryName)

#-----------------------optional------------------------
library(maps)
eu_map <- map_data("world", region = c("France","Germany","Italy","Greece"))
gdp_map <- dplyr::filter(gdp1,CountryName %in% c("France","Germany","Italy","Greece"),Year =="2018")
#gdp.2018 <- dplyr::filter(gdp.sub, Year == "2018")
ggplot(eu_map, aes(x=long, y=lat,group=group)) + geom_polygon(aes(fill=region))
#fill = region, not fill=CountryName
gdp_m <- dplyr::left_join(eu_map,gdp_map,by=c("region"="CountryName"))
#from notes
#Warning message:
#Column `region`/`CountryName` joining character vector and factor, coercing into character vector 
gmap <- ggplot(gdp_m, aes(x=long, y=lat, group=group)) + geom_polygon(aes(fill=GDP))
gmap
gmap+labs(title="2018 GDP in eu countries")+scale_fill_gradient(low = "dark blue",high = "red",breaks=c(1e+12,2e+12,3e+12),labels=c("1 Trillion","2 Trillion","3 Trillion"))

#save the file
png("GDP map.png", width = 600, height = 600)
gmap
dev.off()




