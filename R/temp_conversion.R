
#' Convert temperature from Fahrenheit to Degree
#'
#' @param F_temp Temperature in fahrenheit
#'
#' @return
#' @export
#'
#' @examples
fahrenheit2degree <- function(F_temp){
  C_temp <- (F_temp - 32) * 5/9;
  return(C_temp);
}

#' Convert temperature from Degree to Fahrenheit
#'
#' @param C_temp Temperature in degree Celsius
#'
#' @return
#' @export
#'
#' @examples
degree2fahrenheit <- function(C_temp){
  F_temp <- (C_temp * 9/5) + 32;
  return(F_temp);
}
