#Testing the Model
mars.test <- data.frame(dat_test)
pred.mars <- predict(mars.fit,dat_test)

#Rounding 
mars.outcome <- ifelse(test = pred.mars >= .5, yes = 1, no= 0)

#Accuracy
n_length <- 2229

(sum(mars.outcome == label_test) / n_length )* 100
