#Salary Pred
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(data.table)
library(randomForest)

dataF <- censusData_train
colnames(dataF) <- c("Age", "Workclass", "Census-fw", "Education", "Educationyrs",
                    "Marital-status", "Occupation", "Relationship", "Race", "Sex",
                    "Captital-gain", "Capital-loss", "Workhours", "Country", "Salary")

setDT(dataF)[Education == "Masters" | Education == "Bachelors", Education := "Higher"]
setDT(dataF)[Education == "Doctorate" | Education == "Assoc-acdm", Education := "Higher"]
setDT(dataF)[Education == "Assoc-voc" | Education == "Prof-school", Education := "Higher"]
setDT(dataF)[Education != "Higher", Education := "Lower"]

#Bodge it for randomforest
setDT(dataF)[Occupation == "?", Occupation := "Other"]
setDT(dataF)[Workclass == "?", Workclass := "Private"]
setDT(dataF)[Country == "?", Country := "Unknown"]

#summary(dataF)

#One attempt
fit1 <- rpart(Salary ~ Age + Sex + Education + Workhours, data=dataF, method='class')
fancyRpartPlot(fit1)


fit2 <- rpart(Salary ~ Age + Education + Workclass + Country, data=dataF, method='class', 
             control=rpart.control(minsplit=100, cp=0.005))
fancyRpartPlot(fit2)

fit3 <- rpart(Salary ~ Race + Educationyrs + Workclass, data=dataF, method='class', 
             control=rpart.control(minsplit=100, cp=0.005))
fancyRpartPlot(fit3)

#Forests
forestFit <- randomForest(as.factor(Salary) ~ Age + Race, data=dataF, 
                          importance=TRUE, ntree=2000, maxnodes=10, mtry=20)
#fancyRpartPlot(forestFit)
varImpPlot(forestFit)
