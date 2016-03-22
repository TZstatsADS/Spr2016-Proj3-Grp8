
test <- function(fit_train, dat_test) {
  tree.test <- data.frame(dat_test)
  pred <- predict(fit_train,tree.test,type = "class" )
  sum(predict(fit_train,tree.test,type = "class" )==label_test)/length(label_test)
  return(pred)
}
  
