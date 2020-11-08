

#' Convert table of longitude and latitude values into simple feature
#'
#' @param data data frame
#' @param lon  longitude values
#' @param lat latitude values
#'
#' @return a simple feature with WGS84
#' @export
#'
#' @examples
tibble_sf = function(data, lon, lat){

  data %>%
    sf::st_as_sf(coords = c("lon", "lat")) %>%
    sf::st_set_crs(4326)
}
