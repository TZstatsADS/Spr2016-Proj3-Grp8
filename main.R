#############################################
### Main execution script for experiments ###
#############################################

### Specify directories
setwd("C:\\Users\\NMLJ\\Documents\\GitHub\\cycle3cvd-team8\\cycle3cvd-team8\\")

img_dir <- "C:\\Users\\NMLJ\\Documents\\GitHub\\Project3\\AnimalImg\\"
img_names <- list.files(img_dir)

img_train_dir <- "C:\\Users\\NMLJ\\Documents\\GitHub\\Project3\\train\\"
img_test_dir <- "C:\\Users\\NMLJ\\Documents\\GitHub\\Project3\\test\\"
img_train_names<-list.files(img_train_dir)
img_test_names<-list.files(img_test_dir)

### Import Breed Labels
label_test <- scan("data\\breed_index_test1.txt")
label_train <- scan("data\\breed_index_train1.txt")
label_test <- scan("data/breed_index_test1.txt")
label_train <- scan("data/breed_index_train1.txt")

### Construct visual features
#Color Histograms
source("lib/feature.color.R")

tm_feature_train <- system.time(dat_train <- feature(img_train_dir, img_train_names))
tm_feature_test <- system.time(dat_test <- feature(img_test_dir, img_test_names))

save(dat_train, file="./output/feature_train.RData")
save(dat_test, file="./output/feature_test.RData")

####

### Train a classification model with training images
source("./lib/train.tree.R")
source("./lib/test.tree.R")

### Model selection with cross-validation
# Choosing between different values of interaction depth for GBM
source("./lib/cross_validation.R")
depth_values <- seq(0.001, 0.01, 0.002)
err_cv <- array(dim=c(length(depth_values), 2))
K <- 5  # number of CV folds
for(k in 1:length(depth_values)){
  cat("k=", k, "\n")
  err_cv[k,] <- cv.function(dat_train, label_train, depth_values[k], K)
}
save(err_cv, file="./output/err_cv.RData")

# Visualize CV results
pdf("./fig/cv_results.pdf", width=7, height=5)
plot(depth_values, err_cv[,1], xlab="Interaction Depth", ylab="CV Error",
     main="Cross Validation Error", type="n", ylim=c(0, 0.5))
points(depth_values, err_cv[,1], col="blue", pch=16)
lines(depth_values, err_cv[,1], col="blue")
arrows(depth_values, err_cv[,1]-err_cv[,2],depth_values, err_cv[,1]+err_cv[,2], 
       length=0.1, angle=90, code=3)
dev.off()

# Choose the best parameter value
depth_best <- depth_values[which.min(err_cv[,1])]
par_best <- list(depth=depth_best)

# train the model with the entire training set
tm_train <- system.time(fit_train <- train(dat_train, label_train, par_best))
save(fit_train, file="./output/fit_train.RData")

### Make prediction 
tm_test <- system.time(pred_test <- test(fit_train, dat_test))
save(pred_test, file="./output/pred_test.RData")

### Summarize Running Time
cat("Time for constructing training features=", tm_feature_train[1], "s \n")
cat("Time for constructing testing features=", tm_feature_test[1], "s \n")
cat("Time for training model=", tm_train[1], "s \n")
cat("Time for making prediction=", tm_test[1], "s \n")
