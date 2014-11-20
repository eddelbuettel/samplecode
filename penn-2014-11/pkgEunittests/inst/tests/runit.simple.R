
#.setUup <- function() {
#    # can run some code needed below here, eg a database connection,
#    # a dataloader etc pp
#}

#.tearDown <- function() {
#    # similar function to clean up at end
#}

test01leftTail <- function() {

    set.seed(123)     # be reproducible
    x <- rnorm(1000)  # some data
    res <- myqs(x)    # run our function of interest

    comp <- quantile(x, probs=c(0.01, 0.05, 0.10, 0.50, 0.90, 0.95, 0.99))

    checkEquals(res[1],   comp[1],   msg="checking 1%-tile")
    checkEquals(res[2:3], comp[2:3], msg="checking 5% and 10%-tile")
}

test02rightTail <- function() {
    set.seed(123)     # be reproducible
    x <- rnorm(1000)  # some data
    res <- myqs(x)    # run our function of interest

    comp <- quantile(x, probs=c(0.01, 0.05, 0.10, 0.50, 0.90, 0.95, 0.99))

    checkEquals(res[7],   comp[7],   msg="checking 99%-tile")
    checkEquals(res[5:6], comp[5:6], msg="checking 90% and 95%-tile")
}
