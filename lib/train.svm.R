


# train <- function(dat_train, label_train, par=NULL){

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
  #svp

  # Attributes that you can access
  #attributes(svp)

  # For example, the support vectors
  #alpha(svp)
  #alphaindex(svp)
  #b(svp)
#}
  # Use the built-in function to pretty-plot the classifier
  #plot(svp,data=xtrain)

  
