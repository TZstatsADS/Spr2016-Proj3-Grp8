

train <- function(dat_train, label_train, par=NULL){

library("gbm")

### Train with gradient boosting model
#par=NULL
#if(is.null(par)){
#  depth <- 3
#} else {
#  depth <- par$depth
#}
#fit_gbm <- gbm.fit(x=feature, y=breed_index_train1,
#                   n.trees=2000,
#                   distribution="bernoulli",
#                   interaction.depth=depth, 
#                   bag.fraction = 0.5,
#                   verbose=FALSE)
#best_iter <- gbm.perf(fit_gbm, method="OOB")

#return(list(fit=fit_gbm, iter=best_iter))
#}


## Tree Classification

library(rpart)
tree.data <- data.frame(dat_train)
tree <- rpart(label_train ~.,tree.data,method = "class",
              control = rpart.control(minsplit=30, cp=par$depth))
return(tree)
#printcp(tree)
#summary(tree)

}