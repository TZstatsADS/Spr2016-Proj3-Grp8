###Mars Model 

train <- function(dat_train, label_train, par=NULL){
  
library(MASS)
library(mda)
library(rpart)


#Training the Model
mars.fit <- mars(x=dat_train, y=label_train, degree = 1, prune = TRUE, forward.step = TRUE)


return(mars.fit)

}

