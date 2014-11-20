
library(pkgEsimpletests)

set.seed(123)     # be reproducible
x <- rnorm(1000)  # some data
res <- myqs(x)    # run our function of interest
print(res)        # print result        
