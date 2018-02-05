library(ggplot2)
library(GGally)
library(class)
library(MASS)
library(pROC)
wine=read.csv("https://www.math.ntnu.no/emner/TMA4268/2018v/data/Comp1Wine.csv",sep=" ")
wine$class=as.factor(wine$class-1)
colnames(wine)=c("y","x1","x2")
ggpairs(wine, ggplot2::aes(color=y))

n=dim(wine)[1]
set.seed(1922) #to get the same order if you rerun - but you change this to your favorite number
ord = sample(1:n) #shuffle 
test = wine[ord[1:(n/2)],]
train = wine[ord[((n/2)+1):n],]

#fit a model on the training data
glm.fits<-glm(y~x1+x2, family = binomial,data=train)
summary(glm.fits)


$#use model to predict testdata
  
glm.fits

glm.probs<- predict(glm.fi$s, test,type="response") 
summary(glm.probs)
glm.pred<-rep("0",65)
glm.pred[glm.probs>0.5]="1"
table(glm.pred,(test$y))

p<-ggplot(train,mapping=aes(x=x1,y=x2,color=y))+ggtitle('Training observations')+geom_point()
p

