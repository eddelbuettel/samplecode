
stopifnot(require(RUnit, quietly=TRUE))
stopifnot(require(pkgEunittests, quietly=TRUE))

set.seed(42)				# Set a seed to make the test deterministic

## Define tests
testSuite <- defineTestSuite(name="pkgEunittests Unit Tests",
                             dirs=system.file("tests", package="pkgEunittests"),
                             testFuncRegexp = "^[Tt]est+")

tests <- runTestSuite(testSuite)        # Run tests
printTextProtocol(tests)		# Print results
if (getErrors(tests)$nFail > 0) {       # Return success or failure to R CMD CHECK
    stop("TEST FAILED!")
}
if (getErrors(tests)$nErr > 0) {
    stop("TEST HAD ERRORS!")
}
if (getErrors(tests)$nTestFunc < 1) {
    stop("NO TEST FUNCTIONS RUN!")
}

