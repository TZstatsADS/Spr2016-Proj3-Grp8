library(EBImage)

trainvec <- rep(NA, length(list.files(img_train_dir)))

testvec <- rep(NA, length(list.files(img_test_dir)))

setwd("~/Columbia University/Spring 2016/Data Science/Project 3/train/train")

for(i in 1:length(list.files(img_train_dir))){
  
    img <- readImage(list.files(img_train_dir)[i])

    colorMode(img) = Grayscale
    
    intens <- getFrame(img,1)
    trainvec[i] <- mean(intens)
    

}

setwd("~/Columbia University/Spring 2016/Data Science/Project 3/test/test")

for(i in 1:length(list.files(img_test_dir))){
  
  img <- readImage(list.files(img_test_dir)[i])
  
  colorMode(img) = Grayscale
  
  intens <- getFrame(img,1)
  testvec[i] <- mean(intens)
  
  
}

