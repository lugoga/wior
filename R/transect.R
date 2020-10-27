
#' Create transect from vector of longitude and latitude
#'
#' @param lon a vector with minimum and maximum value of longitude
#' @param lat a vector with minimum and maximum value of latitude
#' @param n the number of points representing quadrants along the transect
#'
#' @return
#' @export
#'
#' @examples
transect = function(lon, lat, n){

  metR::as.path(x = lon,
                y = lat,
                n) %>%
    dplyr::as_tibble() %>%
    dplyr::select(lon = x, lat = y)

}


