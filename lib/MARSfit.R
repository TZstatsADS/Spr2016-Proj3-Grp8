###Mars Model 
library(MASS)
library(mda)
library(rpart)

n_files1 <- length(list.files(dat_test))

#Training the Model
mars.fit <- mars(dat_train, label_train, degree = 1, prune = TRUE, forward.step = TRUE)

summary(mars.fit)

#Pruning and Cut Points

cuts <- mars.fit$cuts[mars.fit$selected.terms, ]
dimnames(cuts) <- list(NULL, names(Boston)[-14]);
print(cuts);

factor <- mars.fit$factor[mars.fit$selected.terms, ];
dimnames(factor) <- list(NULL, names(dat_train));
print(factor)

#Testing the Model
mars.test <- data.frame(dat_test)
pred.mars <- predict(mars.fit,mars.test,type = "class" )

#Accuracy
sum(predict(mars.fit,mars.test,type = "class" )==label_test)/n_files1


