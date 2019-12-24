trial <- read.csv("/Users/lanqi/Desktop/ADS2_2019-20/Practicals/Practical14_ANOVA/drug_trial.csv")
library(ggplot2)
ggplot(trial)+geom_boxplot(aes(treatment,pain,color=treatment))
##Independent random sampling

##Normality of residuals
model <- aov(pain~treatment,data = trial)
hist(resid(model),main = "residuals")
##Equality of Variances
plot(model,1)
#if you plot a model, it will be 4 plots, and "1" means the first plot

summary(model)
TukeyHSD(model)

mouse <- read.csv("/Users/lanqi/Desktop/ADS2_2019-20/Practicals/Practical14_ANOVA/mouse_experiment.csv")
ggplot(mouse)+geom_boxplot(aes(genotype,weight_gain,color=diet))
model2 <- aov(weight_gain~genotype*diet,data = mouse)
plot(model2,1)
summary(model2)
TukeyHSD(model2)

#BB unrestricted is significantly different from AB unrestricted
#For AB and BB, there are significant differences between restricted and unrestricted diet

a <- TukeyHSD(model2)
b <- a$`genotype:diet`
b[b[,4]<0.05,]
