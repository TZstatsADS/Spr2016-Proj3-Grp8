setwd("~/Desktop/train")
img <- readImage(list.files(img_train_dir)[1])
img <- resize(img, 128, 128)
img <- channel(img, mode="gray")
img1 <- thresh(img, w=50, h=50, offset=0.05)
display(img)
display(img1)
oc <- ocontour(bwlabel(img1))
plot(oc[[1]], type='l')
points(oc[[1]], col=2)

setwd("~/Desktop/train")
contour <- array(dim=c(400,1))
for (i in 1:400){
  img <- readImage(list.files(img_train_dir)[1])
  img <- resize(img, 128, 128)
  img <- channel(img, mode="gray")
  img1 <- thresh(img, w=50, h=50, offset=0.05)
  oc <- ocontour(bwlabel(img1))
  temp <- mean(oc)
  contour[i,] <- oc
}


display(img)
display(channel(img,mode = 'asred'))

