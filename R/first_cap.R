#' Capitalizing first letter
#'
#' @param x a vector containing string or strings
#'
#' @return a vector of character(s) with each word begin with a capital letter
#' @export
#'
#' @examples
first_cap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1, 1)), substring(s, 2),
        sep = "", collapse = " ")
}
