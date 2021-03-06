
#' Convert simple point feature into a tibble
#'@author Masumbuko Semba
#'@description A wrapper function that convert point simple feature to a tibble. The function drop the geometry field and transform it to make columns of longitude and latitude. So you get a tibble of coordinates and the attributes from the simple feature in tidy format
#' @param a point simple feature format is the only format accepted.
#'
#' @return It return a tibble containing the longitude and latitude and all the variables present in the sf object. If the original sf object was in Universal Transverse Mercator (UTM), you get the coordinates in meters and if in World Geodetic Cooridante (WGS), you get coordinate in degree. So you need to transform your simple feature in advance before based on which output you intend to get
#' @export
#'
#' @examples
#'\dontrun{
#' require(wior)
#' data("sample_data")
#' # check the list of data
#' ls()
#'data.points %>% class()
#'data.points %>% point_tb()
#'}
#'@description
#' It depend on point simple feature and the output format is based on original coordinate system (UTM or GCS). It return a tibble containing the longitude and latitude and all the variables present in the sf object. If the original sf object was in Universal Transverse Mercator (UTM), you get the coordinates in meters and if in World Geodetic Cooridante (WGS), you get coordinate in degree. So you need to transform your simple feature in advance before based on which output you intend to get
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
