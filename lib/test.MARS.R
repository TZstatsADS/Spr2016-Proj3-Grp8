#Testing the Model
test <- function(fit_train, dat_test) {
  
  mars.test <- data.frame(dat_test)
  pred.mars <- predict(fit_train,dat_test)

#Rounding 
  mars.outcome <- ifelse(test = pred.mars >= .5, yes = 1, no= 0)

  
  return(pred.mars)
#Accuracy
#n_length <- 2229

#sum(mars.outcome == label_test) / n_length )* 100
}
