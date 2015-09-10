#include <Rcpp.h>

// [[Rcpp::export]]
Rcpp::NumericVector callrnorm(int n) {
    // have to call set.seed at the R level ...
    return Rcpp::rnorm(n);
}

