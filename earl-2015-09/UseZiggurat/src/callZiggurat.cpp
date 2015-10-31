#include <Rcpp.h>
#include <ZigguratLZLLV.h>

static Ziggurat::LZLLV::ZigguratLZLLV z;

// [[Rcpp::export]]
void setZigguratSeed(const int seed) {
    z.setSeed(seed);
}

// [[Rcpp::export]]
Rcpp::NumericVector callZiggurat(int n) {
    Rcpp::NumericVector X(n);
    for (int i=0; i<n; i++) {
        X(i) = z.norm();   // Ziggurat draw
    }
    return X;
}
