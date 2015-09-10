
# swc April 17, 2015

# version
fahr_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5/9)) + 273.15
  return(kelvin)
}

# version 2
fahr_to_kelvinV2 <- function(temp) {
  kelvin <- ((temp - 32) * (5/9)) + 273.15
  invisible(kelvin)
}


# version
fahr_to_celsius <- function(temp) {
  kelvin <- fahr_to_kelvin(temp)
  celsius <- kelvin - 273.15
}



## centering
center <- function(data, desired=0) {
  ## test that desired is scalar
  new_data <- (data - mean(data)) + desired
  return(new_data)
}

set.seed(123)
x <- log(rnorm(100) + 60)
