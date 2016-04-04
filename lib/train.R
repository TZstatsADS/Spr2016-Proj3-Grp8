

train <- function(dat_train, label_train, par=NULL){

## Tree Classification

library(rpart)
tree.data <- data.frame(dat_train)
adv <- rpart(label_train ~.,tree.data,method = "class",
              control = rpart.control(minsplit=30, cp=.005))


  
library(kernlab)
# train the SVM
baseline <- ksvm(x=dat_train,y=label_train,type="C-svc",kernel='vanilladot',C=par$depth,scaled=c())
return(baseline)
return(adv)
#printcp(tree)
#summary(tree)

}