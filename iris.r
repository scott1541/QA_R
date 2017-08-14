library(ggplot2)

subdata <- subset(iris, select=c(Species, Sepal.Width))

#qplot(subdata[1,1], subdata[2,2])
ggplot(iris, aes(x = Species, y = (Sepal.Width * Sepal.Length)), ylab="Sepal Area") + ylab("Sepal Area") + geom_jitter()