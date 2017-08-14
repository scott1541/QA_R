#Titanic
library(ggplot2)

subsdead <- subset(titanic, Survived == 0, select=c(Species, Sepal.Width))

died <- aggregate()

ggplot(titanic, aes(x = Age, y = (Survived), ylab="Deaths")) + xlab("Age") + geom_jitter()