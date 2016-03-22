
feature <- function(img_dir, img_name, data_name=NULL){
  
  library(EBImage)
  
  n_files <- length(list.files(img_dir))
  
  
  #setwd("~/Desktop/train")
  #img_train_dir <- "~/Desktop/train"
  #n_files <- length(list.files(img_train_dir))
  dat <- array(dim=c(n_files,1))
  for (i in 1:n_files){
    img <- readImage(list.files(img_dir)[i])
    img <- resize(img, 128, 128)
    img <- channel(img, mode="gray")
    img1 <- thresh(img, w=50, h=50, offset=0.05)
    oc <- ocontour(bwlabel(img1))
    sum <- 0
    for (j in 1:length(oc)) {
      sum <- sum + sum(oc[[j]])
      }
    dat[i,1] <- sum
    }

#setwd("~/Desktop/test")
#img_test_dir <- "~/Desktop/test"
#n_files1 <- length(list.files(img_test_dir))
#contour.t <- array(dim=c(n_files1,1))
#for (i in 1:n_files1){
#  img <- readImage(list.files(img_test_dir)[i])
#  img <- resize(img, 128, 128)
#  img <- channel(img, mode="gray")
#  img1 <- thresh(img, w=50, h=50, offset=0.05)
#  oc <- ocontour(bwlabel(img1))
#  sum <- 0
#  for (j in 1:length(oc)) {
#    sum <- sum + sum(oc[[j]])
#  }
#  contour.t[i,1] <- sum
#}
  
  if(!is.null(data_name)){
    save(dat, file=paste0("./output/feature_", data_name, ".RData"))
    }
  return(dat)
}
