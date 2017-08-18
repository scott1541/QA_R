#house_prices_forest
library(plyr)
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(data.table)
library(randomForest)
setwd("C:/Users/Administrator/Documents/GitHub/QA_R/HousePrices/")

dataF <- read.csv("train.csv")
test <-read.csv("test.csv")


dataF$MSSubClass <- as.factor(dataF$MSSubClass)
dataF$MSSubClass <- revalue(dataF$MSSubClass, c("30"="20","50"="45","70"="60","85"="80","150"="120","180"="160"))
dataF$MSSubClass <- revalue(dataF$MSSubClass, c("40"="20","75"="60"))

#randomforest
set.seed(415)

forestFit <- randomForest(SalePrice ~ MSSubClass + as.factor(Neighborhood) + as.factor(BldgType), data=dataF, 
                          importance=TRUE, ntree=2000)


print(predict(forestFit, data=test, type='class'))

pred <- predict(fit3, data=test, type='class')

write.csv(pred, "test_forest1.csv") #OverallQual


