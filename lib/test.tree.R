
test <- function(fit_train, dat_test) {
  
  tree.test <- data.frame(feature.t)
  pred <- predict(fit_train,dat_test,type = "class" )
  sum(predict(fit_train,dat_test,type = "class" )==label_test)/n_files
  
  
  
}
  
