
library(UseZiggurat)
library(microbenchmark)

seed <- 12345
n <- 1e5
N <- 100

set.seed(seed)
setZigguratSeed(seed)

print(res <- microbenchmark(callZiggurat(n), callrnorm(n), rnorm(n), times = N))

ggplot2::autoplot(res)

