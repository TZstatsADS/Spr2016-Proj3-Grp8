###Mars Model 
library(MASS)
library(mda)
library(rpart)

n_files1 <- length(dat_train)
##

#Training the Model
mars.fit <- mars(x=dat_train, y=label_train, degree = 1, prune = TRUE, forward.step = TRUE)

#Testing the Model
mars.test <- data.frame(dat_test)
pred.mars <- predict(mars.fit,dat_test)
head(pred.mars)

#Rounding 
mars.outcome <- ifelse(test = pred.mars >= .5, yes = 1, no= 0)

#Accuracy

n_length <- 2229

(sum(mars.outcome == label_test) / n_length )* 100


