#ChickWeight
library(ggplot2)
data("ChickWeight")

summary(ChickWeight)
#All chicks weight against time

diet1 <- subset(ChickWeight, ChickWeight$Diet == 1)
diet2 <- subset(ChickWeight, ChickWeight$Diet == 2)
diet3 <- subset(ChickWeight, ChickWeight$Diet == 3)
diet4 <- subset(ChickWeight, ChickWeight$Diet == 4)

#diet1$Diet <- NULL
#diet2$Diet <- NULL
#diet3$Diet <- NULL
#diet4$Diet <- NULL

#Aggregate subsets for each diet, remove below 75 as assumed to have died (or probably will be soon)
chicks1 <- aggregate(weight ~ Chick + Diet, data=diet1, FUN=function(x){if(max(x) >= 75){max(x)}else{0}}) 
chicks2 <- aggregate(weight ~ Chick + Diet, data=diet2, FUN=function(x){if(max(x) >= 75){max(x)}else{0}}) 
chicks3 <- aggregate(weight ~ Chick + Diet, data=diet3, FUN=function(x){if(max(x) >= 75){max(x)}else{0}}) 
chicks4 <- aggregate(weight ~ Chick + Diet, data=diet4, FUN=function(x){if(max(x) >= 75){max(x)}else{0}}) 

chicksP <- aggregate(weight~ Diet, data=ChickWeight, FUN=function(x){(sum(max(x))/length(max(x)))/ 21})
print(chicksP)

chicks <- rbind(chicks1, chicks2, chicks3, chicks4)


#Make Graphs
#Chick weight over time
cWeights <- ggplot(ChickWeight, aes(x = Time, y = weight, group=Chick, colour=Diet)) + geom_line() 
cWeights + geom_point() + ggtitle("Individual Chick Weights over Time")

#Final chick weights boxplot
fWeights <- ggplot(chicks, aes(x = Diet, y = weight, fill=Diet)) + geom_boxplot(outlier.colour="black", outlier.shape=22, outlier.size=2)
fWeights + ggtitle("Final Weights for Chicks on each Diet")

#Weird piechart of growth rates per diet
grRate <- ggplot(chicksP, aes(x = weight, colour=Diet)) +
  geom_bar(width = 1.00, colour=Diet)
grRate + coord_polar() + ggtitle("Average Growth Rates per Diet")
