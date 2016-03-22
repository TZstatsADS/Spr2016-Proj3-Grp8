library(neuralnet)
library(MASS)
library(grid)


#I'm aware there's a faster way, but there's some bug with the neuralnet package, as documented in stack overflow.
#http://stackoverflow.com/questions/17794575/error-in-terms-formulaformula-in-formula-and-no-data-argument
dat = cbind(dat_train, label_train)

dat = as.data.frame(dat)

n <- names(dat)
f <- as.formula(paste("label_train ~", paste(n[!n %in% "label_train"], collapse = " + ")))
f


fittednet <- neuralnet(f,dat, hidden = 1, threshold = 0.01,
               stepmax = 1e+05, rep = 1, startweights = NULL,
               learningrate.limit = NULL,
               learningrate.factor = list(minus = 0.5, plus = 1.2),
                learningrate=NULL, lifesign = "none",
                lifesign.step = 1000, algorithm = "rprop+",
              err.fct = "sse", act.fct = "logistic",
              linear.output = TRUE, exclude = NULL,
                constant.weights = NULL, likelihood = FALSE)
