
feature <- function(img_dir, img_name, data_name=NULL){
  
  library("EBImage")
  
  n_files <- length(list.files(img_dir))
  
  ### Feature Extraction
  nR <- 10
  nG <- 8
  nB <- 10
  dat1 <- array(dim=c(n_files,nR*nG*nB))
  dat2 <- array(dim=c(n_files,1))
  for (i in 1:n_files){
    
    ##Color Feature
    
    img <- readImage(list.files(img_dir)[i])
    mat <- imageData(img)
    # A multi-dimensional arrays containing the pixel intensities
    # 394 by 500 by 3
    # 450 by 313 by 3
    # 500 by 402 by 3
    
    rBin <- seq(0, 1, length.out=nR)
    gBin <- seq(0, 1, length.out=nG)
    bBin <- seq(0, 1, length.out=nB)
    freq_rgb <- as.data.frame(table(factor(findInterval(mat[,,1], rBin), levels=1:nR), 
                                    factor(findInterval(mat[,,2], gBin), levels=1:nG), 
                                    factor(findInterval(mat[,,3], bBin), levels=1:nB)))
    rgb_feature <- as.numeric(freq_rgb$Freq)/(ncol(mat)*nrow(mat)) 
    dat1[i,] <- rgb_feature
    
    ##Contour Deature
    img <- resize(img, 128, 128)
    img <- channel(img, mode="gray")
    img1 <- thresh(img, w=50, h=50, offset=0.05)
    oc <- ocontour(bwlabel(img1))
    sum <- 0
    for (j in 1:length(oc)) {
      sum <- sum + sum(oc[[j]])
    }
    dat2[i,1] <- sum
    
  }
  
  dat <- cbind(dat1,dat2)
  
  ### output constructed features
  if(!is.null(data_name)){
    save(dat, file=paste0("./output/feature_", data_name, ".RData"))
  }
  return(dat)
}

############################################################################################







n_files1 <- length(list.files(img_test_dir))

### Feature Extraction
nR <- 10
nG <- 8
nB <- 10
dat1.t <- array(dim=c(n_files1,nR*nG*nB))
dat2.t <- array(dim=c(n_files1,1))
for (i in 1:n_files1){
  
  ##Color Feature
  
  img <- readImage(list.files(img_test_dir)[i])
  mat <- imageData(img)
  
  rBin <- seq(0, 1, length.out=nR)
  gBin <- seq(0, 1, length.out=nG)
  bBin <- seq(0, 1, length.out=nB)
  freq_rgb <- as.data.frame(table(factor(findInterval(mat[,,1], rBin), levels=1:nR), 
                                  factor(findInterval(mat[,,2], gBin), levels=1:nG), 
                                  factor(findInterval(mat[,,3], bBin), levels=1:nB)))
  rgb_feature <- as.numeric(freq_rgb$Freq)/(ncol(mat)*nrow(mat)) 
  dat1.t[i,] <- rgb_feature
  
  ##Contour Deature
  img <- resize(img, 128, 128)
  img <- channel(img, mode="gray")
  img1 <- thresh(img, w=50, h=50, offset=0.05)
  oc <- ocontour(bwlabel(img1))
  sum <- 0
  for (j in 1:length(oc)) {
    sum <- sum + sum(oc[[j]])
  }
  dat2.t[i,1] <- sum
  
}

dat.t <- cbind(dat1.t,dat2.t)

