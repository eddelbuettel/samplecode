\name{myqs}
\alias{myqs}
\title{Simple quantile calculator}
\description{
  A simple demo function which returns quantiles
}
\usage{
  myqs(x, at=c(0.01, 0.05, 0.10, 0.50, 0.90, 0.95, 0.99))
}
\arguments{
  \item{x}{A vector for which quantiles are to be calculated}
  \item{at}{A vector with p-values for the desired quantiles}
}
\value{
  A named vector with the desired quantiles.
}
\details{
  This is just an examples.
}
\references{
  None.
}
\seealso{
  \link[stats:quantile]{quantile}
}
\examples{
  set.seed(123)     # be reproducible
  x <- rnorm(1000)
  myqs(x)
}
\author{Dirk Eddelbuettel}
\keyword{package}
