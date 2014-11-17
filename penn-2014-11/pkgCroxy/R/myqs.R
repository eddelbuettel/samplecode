
##' A simple demo function which returns quantiles
##'
##' This is just an examples.
##' @title Simple quantile calculator
##' @param x A vector for which quantiles are to be calculated
##' @param at A vector with p-values for the desired quantiles 
##'
##' @return A named vector with the desired quantiles.
##'
##' @seealso \link[stats:quantile]{quantile}
##' @references None
##' @author Dirk Eddelbuettel
##' @examples
##' set.seed(123)     # be reproducible
##' x <- rnorm(1000)
##' myqs(x)
myqs <- function(x, at=c(0.01, 0.05, 0.10, 0.50, 0.90, 0.95, 0.99)) {

    ## should do some sanity checks on x here
    res <- quantile(x, probs=at)
}
