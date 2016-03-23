setwd<-"E://W4249 Applied Data Science//cycle3cvd-team8"
dir_images<-"E://W4249 Applied Data Science//images//"
dir_names <- list.files(dir_images)

train_set <- sample(dir_names, 5161, replace=FALSE)
test_set <- dir_names[!dir_names %in% train_set]
library("EBImage")

n_files <- length(dir_names)

img0 <-  readImage(paste0(dir_images, train_set[1]))
mat1 <- as.matrix(img0)
n_r <- nrow(img0)
n_c <- ncol(img0)

### store vectorized pixel values of images
#dat <- array(dim=c(n_files, n_r*n_c)) 
for(i in  1 :length(dir_names)){
  file.copy(paste0(dir_images, train_set[i]),"E:\\W4249 Applied Data Science\\cycle3cvd-team8\\train")
  #dat[i,] <- as.vector(img)
}
for(i in  1 :length(dir_names)){
  file.copy(paste0(dir_images, test_set[i]),"E:\\W4249 Applied Data Science\\cycle3cvd-team8\\test")
  #dat[i,] <- as.vector(img)
}