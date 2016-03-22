
test <- function(fit_train, dat_test){
  library(kernlab)
  predict(fit_train,dat_test)

}