#########################################################
### Train a classification model with training images ###
#########################################################

### Author: Yuting Ma
### Project 3
### ADS Spring 2016


train <- function(dat_train, label_train, par=NULL){

  library(kernlab)

  # train the SVM
  svm <- ksvm(x=dat_train,y=label_train,type="C-svc",kernel='vanilladot',C=par,scaled=c())
  return(svm)
  
}

