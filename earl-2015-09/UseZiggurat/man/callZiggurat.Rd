\name{callZiggurat}
\alias{callZiggurat}
\alias{callrnorm}
\alias{setZigguratSeed}
\title{Using Ziggurat Random Number Generator}
\description{
  The \code{callZiggurat} function returns \code{n} draws from the Ziggurart generator for
  (standard) normal random deviates.

  The \code{callrnorm} function provides a simple comparison by calling the standard
  generator from R

  The \code{setZigguratSeed} function allows setting of a seed for the generator.
}
\usage{
callZiggurat(n)
callrnorm(n)
setZigguratSeed(seed)
}
\arguments{
  \item{n}{Integer for the number requested N(0,1) draws}
  \item{seed}{Integer seed for the generator}
}
\details{See the RcppZiggurat package and its vignette for more.}
\value{
  The \code{callZiggurat} and \code{callrnorm} functions each return a vector of length
  \code{n} containing a vector with the requested random draws.

  The \code{setZigguratSeed} function does not return a value.
}
\author{Dirk Eddelbuettel}
\examples{
   setZigguratSeed(123)
   callZiggurat(5)
}
\keyword{random}
