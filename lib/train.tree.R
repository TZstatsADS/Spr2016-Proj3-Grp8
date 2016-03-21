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
tree.data <- data.frame(feature)
tree <- rpart(breed_index_train1 ~.,tree.data,method = "class",
              control = rpart.control(minsplit=50, cp=0.001))
printcp(tree)
summary(tree)
tree.test <- data.frame(feature.t)
pred <- predict(tree,tree.test,type = "class" )
sum(predict(tree,tree.test,type = "class" )==breed_index_test1)/n_files1
