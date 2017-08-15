#CO2
library(ggplot2)

data("CO2")

class(CO2$Plant)

mean_uptake <- mean(CO2$uptake)

print(mean_uptake)

ggplot(CO2, aes(x = Type, y = uptake, fill=Type, ylab="CO2 Uptake")) + geom_boxplot(outlier.colour="black", outlier.shape=22, outlier.size=2)


#Create subset data frames
quebec_df <- subset.data.frame(CO2, CO2$Type == "Quebec")

missis_df <- subset.data.frame(CO2, CO2$Type == "Mississippi")


#Mean checker
mean_checker <- function(vect1, vect2)
{
  if(mean(vect1) > mean(vect2)){
    print(cat("Quebec has greater uptake, at: ", mean(vect1)))
  } else {
    print(cat("Mississippi has greater uptake at: ", mean(vect2)))
  }
}

mean_checker(quebec_df$uptake, missis_df$uptake)
                              