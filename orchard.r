data("OrchardSprays")
summary(OrchardSprays)

sprays <- aggregate(decrease ~ treatment, data=OrchardSprays, FUN=function(x){max(x)})#/length(x)})

print(sprays)

#Bar chart of max
ggplot(sprays, aes(x = treatment, y = decrease)) + geom_bar(stat="identity")

#Boxplot
ggplot(OrchardSprays, aes(x = treatment, y = decrease)) + geom_boxplot()