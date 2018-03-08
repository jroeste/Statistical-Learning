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
set.seed(1900) #to get the same order if you rerun - but you change this to your favorite number
ord = sample(1:n) #shuffle 
test = wine[ord[1:(n/2)],]
train = wine[ord[((n/2)+1):n],]

head(train)


#fit a model on the training data
glm.fits<-glm(y~x1+x2, family = binomial,data=train)
summary(glm.fits)
coef(glm.fits)
b0=glm.fits$coefficients[1]
b1=glm.fits$coefficients[2]
b2=glm.fits$coefficients[3]

#plotting training data
#plot(train$y)
#a=(log(0.5)-b0)/b2
b=-b1/b2
a=(-b0)/b2

p<-ggplot(train,mapping=aes(x=x1,y=x2,color=y))+ggtitle('Training observations')+geom_point() +
geom_abline(slope=b, intercept=a)
p
plott=stat_function(fun=function(x) exp(b0+x*b1+x*b2)/(1+exp(b0+x*b1 +x*b2)), geom="line", colour="red",linetype="dashed")
ggplot(data.frame(x=c(-6,5)), aes(x))+
  xlab(expression(x))+ 
  ylab(expression(mu))+ plott
#use model to predict testdata
coef(glm.fits)

probs_wine1<- predict(glm.fits, test,type="response") 
summary(probs_wine1)
pred_wine1<-rep("0",65)
pred_wine1[probs_wine1>0.5]="1"
table(pred_wine1,(test$y))

dim(test)

14+16+15+20
34/41
20/35
21/24
3/24
x_1=17
x_2=3
p_i=(exp(b0+b1*x_1+b2*x_2))/(1+exp(b0+b1*x_1+b2*x_2))
p_i
#compute predicted probabilities
predictions_wine1=data.frame(probs_wine1,pred_wine1,test[,1])
colnames(predictions_wine1)=c("Estimated prob","Predicted class","True class")
predictions_wine1
