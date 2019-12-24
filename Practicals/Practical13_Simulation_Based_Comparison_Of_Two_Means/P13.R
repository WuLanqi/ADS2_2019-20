trial <- read.csv("/Users/lanqi/Desktop/ADS2_2019-20/Practicals/Practical13_Simulation_Based_Comparison_Of_Two_Means/drug_trial.csv")
plot(trial)
ggplot(trial)+geom_boxplot(aes(treatment,pain,color=treatment))

index1 <- sample(nrow(trial),1)
s1 <- trial[index1,]
trial2 <- trial[-index1,]
s2 <- trial2[sample(which(trial2$treatment==s1$treatment),1),]
#within
d1 <- abs(s1$pain-s2$pain)
s3 <- trial[sample(which(trial$treatment!=s1$treatment),1),]
#between
d2 <- abs(s1$pain-s3$pain)

diffsame <- c()
diffbetween <- c()
for (i in 1:43) {
  s1i <- trial[i,]
  for (j in (i+1):44){ 
    s2i <- trial[j,]
    di <- abs(s1i$pain-s2i$pain)
    if (s1i$treatment == s2i$treatment) {
      diffsame <- c(diffsame,di)
    }else{
      diffbetween <- c(diffbetween,di)
    }
  #pick two persons and calculate the difference
  #check treatment group
  #if same, add difference to the diffsame
  #if differnet ,add difference to the diffbetween
  }
}
  
  
  # indexi <- sample(nrow(trial),1)
  # s1i <- trial[indexi,]
  # triali <- trial[-indexi,]
  # s2i <- triali[sample(which(triali$treatment==s1i$treatment),1),]
  # #within
  # d1i <- abs(s1i$pain-s2i$pain)
  # #record difference
  # diffsame <- c(diffsame,d1i)
  # s3i <- trial[sample(which(trial$treatment!=s1$treatment),1),]
  # #between
  # d2i <- abs(s1i$pain-s3i$pain)
  # #record
  # diffbetween <- c(diffbetween,d2i)
}

mean(diffsame)
mean(diffbetween)
abs(mean(diffsame)-mean(diffbetween))

#diffall <- data.frame("differnece"=c(diffsame,diffbetween))
#ggplot(diffall)+geom_boxplot(aes(difference,group=))

#------Run a simulation-based test------
diffmean <- c()
for (z in 1:1000) {
  diffsame <- c()
  diffbetween <- c()
  trial$treatment <- sample(trial$treatment,44,replace=FALSE)
  for (i in 1:43) {
    s1i <- trial[i,]
    for (j in (i+1):44){ 
      s2i <- trial[j,]
      di <- abs(s1i$pain-s2i$pain)
      if (s1i$treatment == s2i$treatment) {
        diffsame <- c(diffsame,di)
      }else{
        diffbetween <- c(diffbetween,di)
      }
    }
  }
  dmi <- abs(mean(diffsame)-mean(diffbetween))
  diffmean <- c(diffmean,dmi)
}
diffmean
hist(diffmean)
