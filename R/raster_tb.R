#' Convert raster file to tibble
#'
#' @param path a character vector of full path name of the raster file
#'
#' @return A tibble of longitude, latitude and a z value
#' @export
#'
#' @examples
raster_tb = function(path){

  raster::raster(path) %>%
    raster::as.data.frame(xy = TRUE) %>%
    dplyr::as_tibble() %>%
    dplyr::rename(lon = 1, lat = 2, z = 3)
}
