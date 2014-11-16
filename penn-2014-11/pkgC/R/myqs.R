
## simple function to return quantiles of a vector
myqs <- function(x, at=c(0.01, 0.05, 0.10, 0.50, 0.90, 0.95, 0.99)) {

    ## should do some sanity checks on x here
    res <- quantile(x, probs=at)
}
