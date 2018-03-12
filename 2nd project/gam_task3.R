library(gam)
library(ISLR)
library(GGally)
library(leaps)
library(glmnet)
library(ggplot2)
library(plyr)
library(ISLR)
Auto
Auto$origin=mapvalues(Auto$origin, from = c("1.Am", "2.Eur","3.Jap"), to = c('Am','Eu','Jap'))
ourAuto=data.frame("mpg"=Auto$mpg,"cylinders"=factor(cut(Auto$cylinders,2)),
                   "displace"=Auto$displacement,"horsepower"=Auto$horsepower,
                   "weight"=Auto$weight,"acceleration"=Auto$acceleration, 
                   "year"=Auto$year,"origin"=as.factor(Auto$origin))
View(Auto)
colnames(ourAuto)
ntot=dim(ourAuto)[1]
ntot
set.seed(4268)
testids=sort(sample(1:ntot,ceiling(0.2*ntot),replace=FALSE))
ourAutoTrain=ourAuto[-testids,]
ourAuto
ourAutoTest=ourAuto[testids,]
factor(ourAutoTrain$origin)
res=regsubsets(mpg~.,nbest=1,data=ourAutoTrain)
sumres=summary(res)
which.min(sumres$bic)
?Auto
coef(res,id=which.min(sumres$bic))
?s()
?gam

gamobject <- gam(mpg~bs(displace, knots = 290)+poly(horsepower,2)+weight+s(acceleration, 3)+factor(origin),data=ourAutoTrain)
?par
(par(mfrow=c(2,3)))
plot(gamobject,se=TRUE,col="blue")

displ=data.frame('displace'=ourAutoTrain$displace,'mpg'=ourAutoTrain$mpg)

ggplot(displ, aes(x=displace,y=mpg))+geom_point()
min(ourAutoTrain$displace)
max(ourAutoTrain$displace)

ggplot(ourAutoTrain, aes(x=horsepower,y=mpg))+ geom_point()
ggplot(ourAutoTrain, aes(x=weight,y=mpg))+ geom_point()
ggplot(ourAutoTrain, aes(x=acceleration,y=mpg))+ geom_point()
ggplot(ourAutoTrain, aes(x=origin,y=mpg))+ geom_point()
