#' Transform data close to log() but allows for zeros
#'
#' @param x a numeric vector, a numeric variables in data frame or numeric matrix
#'
#' @return a numeric for vector, a data frame for data frame and matrix for matrix
#' @export
#'
#' @examples
inverse_hyperbolic = function(x){
  log(x + sqrt(x^2 + 1))
}
