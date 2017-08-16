#Salary Pred
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(data.table)

dataF <- censusData_train
colnames(dataF) <- c("Age", "Workclass", "Census-fw", "Education", "Educationyrs",
                    "Marital-status", "Occupation", "Relationship", "Race", "Sex",
                    "Captital-gain", "Capital-loss", "Work-hours", "Country", "Salary")

setDT(dataF)[Education == "Masters" | Education == "Bachelors", Education := "Higher"]
setDT(dataF)[Education == "Doctorate" | Education == "Assoc-acdm", Education := "Higher"]
setDT(dataF)[Education == "Assoc-voc" | Education == "Prof-school", Education := "Higher"]
setDT(dataF)[Education != "Higher", Education := "Lower"]


summary(dataF)

fit <- rpart(Salary ~ Age + Sex + Education + Educationyrs + Workclass, data=dataF, method='class')
fancyRpartPlot(fit)