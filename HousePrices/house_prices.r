#Kaggle House Prices
library(plyr)
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(data.table)
library(randomForest)

dataF <- train

dataF$MSSubClass <- as.factor(dataF$MSSubClass)
dataF$MSSubClass <- revalue(dataF$MSSubClass, c("30"="20","50"="45","70"="60","85"="80","150"="120","180"="160"))
dataF$MSSubClass <- revalue(dataF$MSSubClass, c("40"="20","75"="60"))



#fit1 <- rpart(SalePrice ~ MSSubClass + LotArea + Neighborhood + BldgType, data=dataF, method='class',
 #               control=rpart.control(minsplit=25, cp=0.002))
#fancyRpartPlot(fit1)


#Best
fit2 <- rpart(SalePrice ~ MSSubClass + as.factor(OverallQual) + as.factor(LotArea) + as.factor(Neighborhood), data=dataF, method='class',
              control=rpart.control(minsplit=20, cp=0.002))


fit3 <- rpart(SalePrice ~  MSSubClass + GarageCars + BldgType + OverallQual + LotArea + Neighborhood + BsmtUnfSF, data=dataF, method='class',
              control=rpart.control(minsplit=15, cp=0.002))

print(predict(fit3, data=test, type='class'))

pred <- predict(fit3, data=test, type='class')

write.csv(pred, "test_res9.csv") #OverallQual