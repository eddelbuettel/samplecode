
#include <RQuantLib.h>

// [[Rcpp::depends(RQuantLib)]]

// [[Rcpp::export]]
QuantLib::Date calDemo(QuantLib::Date day, int delta) {
  QuantLib::Calendar cal = QuantLib::Argentina(); // or any other calendar
  QuantLib::Date newDate = cal.advance(day, delta, QuantLib::Days);
  return newDate;
}
