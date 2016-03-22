library(neuralnet)
library(MASS)
library(grid)

fittednet.results <- compute(fittednet, dat_test)

results = fittednet.results$net.result

neuralnet.outcome <- ifelse(test = results >= .5, yes = 1, no= 0)

n_length <- 2229

(sum(neuralnet.outcome == label_test) / n_length )* 100

#67.83310902% accuracy. Meh.