#########################################################
### Train a classification model with training images ###
#########################################################

### Author: Yuting Ma
### Project 3
### ADS Spring 2016


# train <- function(dat_train, label_train, par=NULL){
  
  ### Train a Gradient Boosting Model (GBM) using processed features from training images
  
  ### Input: 
  ###  -  processed features from images 
  ###  -  class labels for training images
  ### Output: training model specification
  
  ### load libraries
  #library("gbm")
  
  ### Train with gradient boosting model
  #if(is.null(par)){
  #  depth <- 3
  #} else {
  #  depth <- par$depth
  #}
  #fit_gbm <- gbm.fit(x=dat_train, y=label_train,
  #                   n.trees=2000,
  #                   distribution="bernoulli",
  #                   interaction.depth=depth, 
  #                   bag.fraction = 0.5,
  #                   verbose=FALSE)
  #best_iter <- gbm.perf(fit_gbm, method="OOB")

  #return(list(fit=fit_gbm, iter=best_iter))
#}
  
  

  ### Train a Linear SVM (Support Vector Machine) using processed features from training images
  
  
  # load the kernlab package
  library(kernlab)
  #library(e1071)

  # train the SVM
  
 # svm.model <- svm(y = breed_index_train[1:400], x = feature, type = "C-classification")
 #  predict(svm.model,feature.t)
  
  svm <- ksvm(x=feature,y=breed_index_train1,type="nu-svc",kernel='rbf',C=100,scaled=c())
  predict(svm,feature.t)
  sum(predict(svm,feature.t)==breed_index_test1)/n_files1

  #Look and understand what svp contains # General summary
  svp

  # Attributes that you can access
  attributes(svp)

  # For example, the support vectors
  alpha(svp)
  alphaindex(svp)
  b(svp)
#}
  # Use the built-in function to pretty-plot the classifier
  plot(svp,data=xtrain)
