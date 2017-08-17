#Kaggle House Prices
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(data.table)
library(randomForest)

dataF <- train

fit1 <- rpart(SalePrice ~ MSSubClass + LotArea + Neighborhood + BldgType, data=dataF, method='class',
                control=rpart.control(minsplit=25, cp=0.002))
fancyRpartPlot(fit1)

fit2 <- rpart(SalePrice ~ BldgType + OverallQual + LotArea + Neighborhood, data=dataF, method='class',
              control=rpart.control(minsplit=25, cp=0.002))

print(predict(fit1, data=test, type='class'))

pred <- predict(fit1, data=test, type='class')

write.csv(pred, "test_res4.csv") #OverallQual