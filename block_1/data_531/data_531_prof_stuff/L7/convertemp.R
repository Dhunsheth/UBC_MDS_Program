#' Convert Fahrenheit to Kelvin
#'
#' Convert a temperature from Fahrenheit to Kelvin
#'
#' @param temp numeric
#'
#' @return numeric
#' @export
#' @examples
#' fahr_to_kelvin(32)
fahr_to_kelvin <- function(temp) {
  if(!is.numeric(temp)) {
        stop("Cannot convert temperature for non-numerical values")
    }
  (temp - 32) * (5 / 9) + 273.15
}

#' Convert Kelvin to Celsius
#'
#' Convert a temperature from Kelvin to Celsius
#'
#' @param temp numeric
#'
#' @return numeric
#' @export
#' @examples
#' kelvin_to_celsius(273.15)
kelvin_to_celsius <- function(temp) {
  if(!is.numeric(temp)) {
        stop("Cannot convert temperature for non-numerical values")
    }
  temp - 273.15
}

#' Convert Celsius to Fahrenheit
#'
#' Convert a temperature from Celsius to Fahrenheit
#'
#' @param temp numeric
#'
#' @return numeric
#' @export
#' @examples
#' celsius_to_fahr(0)
celsius_to_fahr <- function(temp) {
  if(!is.numeric(temp)) {
        stop("Cannot convert temperature for non-numerical values")
    }
  (temp * (9 / 5)) + 32
}

#' Convert Fahrenheit to Celsius
#'
#' Convert a temperature from Fahrenheit to Celsius
#'
#' @param temp numeric
#'
#' @return numeric
#' @export
#' @examples
#' fahr_to_celsius(32)
fahr_to_celsius <- function(temp) {
  if(!is.numeric(temp)) {
        stop("Cannot convert temperature for non-numerical values")
    }
  temp_k <- fahr_to_kelvin(temp)
  kelvin_to_celsius(temp_k)
}

#' Convert Kelvin to Fahrenheit
#'
#' Convert a temperature from Kelvin to Fahrenheit
#'
#' @param temp numeric
#'
#' @return numeric
#' @export
#' @examples
#' kelvin_to_fahr(273.15)
kelvin_to_fahr <- function(temp) {
  if(!is.numeric(temp)) {
        stop("Cannot convert temperature for non-numerical values")
    }  
  celsius <- kelvin_to_celsius(temp)
  celsius_to_fahr(celsius)
}

#' Convert Celsius to Kelvin
#'
#' Convert a temperature from Celsius to Kelvin
#'
#' @param temp numeric
#'
#' @return numeric
#' @export
#' @examples
#' celsius_to_kelvin(0)
celsius_to_kelvin <- function(temp) {
  if(!is.numeric(temp)) {
        stop("Cannot convert temperature for non-numerical values")
    }
  fahr <- celsius_to_fahr(temp)
  fahr_to_kelvin(fahr)
}