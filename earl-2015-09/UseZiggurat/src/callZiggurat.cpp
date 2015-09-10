#include <Rcpp.h>
#include <ZigguratLZLLV.h>

static Ziggurat::LZLLV::ZigguratLZLLV z;

// [[Rcpp::export]]
bool setZigguaratSeed(const int seed) {
    z.setSeed(seed);
    return true;
}

// [[Rcpp::export]]
Rcpp::NumericVector callZiggurat(Rcpp::NumericVector X) {
    int n = X.length();
    for (int i=0; i<n; i++) {
        X(i) = z.norm();   // Ziggurat draw
    }
    return X;
}
