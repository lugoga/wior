
#' Crop point simple feature that are within a polygon boundary
#'
#' @param point_sf a poing simple feature to be cropped
#' @param polygon_sf a polygon simple feature to crop point_sf
#'
#' @return A point simple feature of only point within the polygon
#' @export
#'
#' @examples
point_crop = function(point_sf, polygon_sf){

  point_sf %>%
    dplyr::filter(sf::st_contains(polygon_sf, ., sparse = FALSE))
}
