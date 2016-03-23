library(neuralnet)
library(MASS)
library(grid)


#I'm aware there's a faster way, but there's some bug with the neuralnet package, as documented in stack overflow.
#http://stackoverflow.com/questions/17794575/error-in-terms-formulaformula-in-formula-and-no-data-argument
traindat = cbind(dat, label_train)

traindat = as.data.frame(traindat)

n <- names(traindat)
f <- as.formula(paste("label_train ~", paste(n[!n %in% "label_train"], collapse = " + ")))



fittednet <- neuralnet(f,traindat, hidden = 10, threshold = 0.01,
               stepmax = 1e+05, rep = 5, startweights = NULL,
               learningrate.limit = NULL,
               learningrate.factor = list(minus = 0.5, plus = 1.2),
                learningrate=NULL, lifesign = "none",
                lifesign.step = 1000, algorithm = "rprop+",
              err.fct = "sse", act.fct = "logistic",
              linear.output = FALSE, exclude = NULL,
                constant.weights = NULL, likelihood = FALSE)
