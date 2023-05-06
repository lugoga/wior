#' Assess the shape of data
#'@description The function compute kurtosis and skewness to assess the shape of the distribution of the continuous values in the data frmae.
#' @param x a data frame or tibble with with continous variable(s)
#' @author Masumbuko Semba
#'
#' @return a table containing a column of variable(s) and kurtosis and skewness for each variable
#' @export
#'
#' @examples
#'\dontrun{
#'require(wior)
#'data = read_csv("data/meteo_coastal_station.csv")
#'data %>% measure_symetry()
#'}
measure_symetry = function(x){
  descriptr::ds_measures_symmetry(x)
}

#' Compute the central location values
#' @description This function compute the central values that help to describe the shape of distribution for continuous variable(s)
#'@author Masumbuko Semba
#' @param x  a data frame or tibble with with continous variable(s)
#'
#' @return a atibble
#' @export
#'
#' @examples
#'\dontrun{
#'require(wior)
#'data = read_csv("data/meteo_coastal_station.csv")
#'data %>% measure_location()
#'}
measure_location = function(x){
  descriptr::ds_measures_location(x)
}

#' Measure of variation
#' @description This function compute the measure of variation from the data frame
#'@author Masumbuko Semba
#' @param x  a data frame or tibble with with continuous variable(s)
#'
#' @return a data frame with metrics of measure of variation  for each variable
#' @export
#'
#' @examples
#'\dontrun{
#'require(wior)
#'data = read_csv("data/meteo_coastal_station.csv")
#'data %>% measure_variation()
#'}
#'
measure_variation = function(x){
  descriptr::ds_measures_variation(x)
}

#' Compute summary from data frame
#' @author Masumbuko Semba
#' @description This function compute measure of the center and variation and combine them into a single output
#'
#' @param x  a data frame or tibble with with continous variable(s)
#'
#' @return a tibble with computed values for center and variation
#' @export
#'
#' @examples
#'\dontrun{
#'require(wior)
#'data = read_csv("data/meteo_coastal_station.csv")
#'data %>% measure_summary()
#'}
measure_summary = function(x){
  descriptr::ds_measures_location(x) %>%
    dplyr::left_join(descriptr::ds_measures_variation(x))
}
