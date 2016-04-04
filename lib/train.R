

train <- function(dat_train, label_train, par=NULL){

## Tree Classification

library(rpart)
library(kernlab)
tree.data <- data.frame(dat_train)
adv <- rpart(label_train ~.,tree.data,method = "class",
              control = rpart.control(minsplit=30, cp=.005))

baseline <- ksvm(x=dat_train,y=label_train,type="C-svc",kernel='vanilladot',C=par$depth,scaled=c())
return(list(baseline, adv))
#printcp(tree)
#summary(tree)

}