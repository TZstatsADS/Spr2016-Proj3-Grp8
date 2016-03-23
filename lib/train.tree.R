

train <- function(dat_train, label_train, par=NULL){



## Tree Classification

library(rpart)
tree.data <- data.frame(dat_train)
tree <- rpart(label_train ~.,tree.data,method = "class",
              control = rpart.control(minsplit=30, cp=par$depth))
return(tree)
#printcp(tree)
#summary(tree)

}