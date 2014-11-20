
##' Example of calling a script via system
##'
##' Uses \code{system.file()} to portably obtain the path
##' of a shell script and uses \code{system()} to execute.
##' @title Example of using system on package-supplied script
##' @return Several lines of text
##' @author Dirk Eddelbuettel
otherViaSystem <- function() {
    path <- system.file("scripts", "silly.sh", package="pkgEother")
    cmd <- paste("sh", path)
    res <- system(cmd, intern=TRUE)
}

##' Example of calling a script via pip
##'
##' Uses \code{system.file()} to portably obtain the path
##' of a shell script and uses \code{pipe()} to execute it,
##' using the command output as input to read.
##' @title Example of using pipe on package-supplied script
##' @return A data.frame read from the output
##' @author Dirk Eddelbuettel
otherViaPipe <- function() {
    path <- system.file("scripts", "silly.sh", package="pkgEother")
    cmd <- paste("sh", path)
    res <- read.csv(pipe(cmd))
}
