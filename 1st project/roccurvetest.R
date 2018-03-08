library(ROCR)

data(ROCR.simple)
pred =prediction(ROCR.simple$predictions, ROCR.simple$labels )
pred2= prediction(abs(ROCR.simple$predictions + 
                          rnorm(length(ROCR.simple$predictions), 0, 0.1)), 
                    ROCR.simple$labels)
perf <- performance( pred, "tpr", "fpr" )
perf2 <- performance(pred2, "tpr", "fpr")
plot( perf,col="green")
plot(perf2, add = TRUE,col="red")
