###Mars Model 
library(MASS)
library(mda)
library(rpart)

n_files1 <- length(dat_train)

#Training the Model
mars.fit <- mars(x=dat_train, y=label_train, degree = 1, prune = TRUE, forward.step = TRUE)




