#Titanic
library(ggplot2)
library(readr)

#titanic <- read_csv("~/GitHub/QA_R/titanic.csv", 
 #                   col_types = cols(Age = col_double(), 
  #                                   Fare = col_character(), Parch = col_skip(), 
   #                                  PassengerId = col_skip(), SibSp = col_skip()), 
    #                na = "NA")

#subsdead <- subset(titanic, Survived == 0, select=c(Species, Sepal.Width))

#other <- aggregate(Survived ~ Pclass + Sex, data=titanic, FUN=function(x){sum(x)/length(x)})
#print(other)

died <- aggregate(Survived ~ ceiling(Age), data=titanic, FUN=function(x){length(x)})
print(died)

#ggplot(died, aes(x = Age))

#ggplot(died, aes(x = (Age), y = (Survived), ylab="Survive")) + xlab("Age") + geom_boxplot()
plot(died)