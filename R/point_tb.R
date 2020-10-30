
#' Convert simple point feature into a tibble format based on original coordinate system (UTM or GCS)
#'
#' @param A point simple feature.
#'
#' @return It return a tibble containing the longitude and latitude and all the variables present in the sf object. If the original sf object was in Universal Transverse Mercator (UTM), you get the coordinates in meters and if in World Geodetic Cooridante (WGS), you get coordinate in degree. So you need to transform your simple feature in advance before based on which output you intend to get
#' @export
#'
point_tb = function(x){

  if(!sf::st_is_simple(x %>% dplyr::slice(1))){
    stop("you supplied unsupported file, only simple feature format file is acceptable")
  }else{

  x %>%
    sf::st_coordinates() %>%
    tibble::as_tibble() %>%
    dplyr::rename(lon = 1, lat = 2) %>%
    dplyr::bind_cols(x %>% sf::st_drop_geometry())
  }
}
