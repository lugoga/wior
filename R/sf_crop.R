
#' Crop point simple feature that are within a polygon boundary
#'
#' @param polygon_sf a polygon simple feature to crop point_sf
#' @param sf_feature a simple feature (point, line or polygon)
#'
#' @return A point simple feature of only point within the polygon
#' @export
#'
#' @examples
sf_crop = function(sf_feature, polygon_sf){

  sf_feature %>%
    dplyr::filter(sf::st_contains(polygon_sf, ., sparse = FALSE))
}
