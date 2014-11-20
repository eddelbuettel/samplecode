
#' @name somedat
#' @title somedat - fake data set as an example
#' @description This data set contains a columns of data, a time-trend variable
#' foo and a noise variable bar
#' @docType data
#' @usage data(somedat)
#' @source Made-up by internal function \code{.dataCreation()}
#' @author Dirk Eddelbuettel
#' @keywords datasets
NULL

.dataCreation <- function() {
    # a boring fictious data.frame
    set.seed(124)
    N <- 100
    somedat <- data.frame(date=as.Date("2001-01-01")+0:(100-1),
                          foo=100 + seq(1,N)*0.25 + rnorm(N),
                          bar=runif(100)*0.5 + 50)
    save(somedat, file="../data/somedat.RData")
    invisible(NULL)
}
