

#' Title A function to bin irregular simple feature into grids and weight the variables in each grid
#'
#' @param sf_object a simple feature of irregular points
#' @param cell_size the grid resolution in meters
#' @param band_width the band radius of searching for gridding in meters
#' @param min_obs minimum observation for smoothing should be integer
#' @param epsg_code the Universal Transeverse Mercator code eg 32737
#' @param crs_code the Geographical Coordianate System code eg 4326
#'
#' @return a simple feature of polygons
#' @export
#'
#' @examples
binning_points = function(sf_object = data.points, cell_size = 10000, band_width = 20000, min_obs = 20, epsg_code = 32737, crs_code = 4326){
## convert to UTM
  sf_object = sf_object %>% sf::st_transform(crs = epsg_code)

  ## convert to tibble and a column should contain x,y,and variable of interest (z)
  bb.tb = sf_object %>%
    sf::st_coordinates()%>%
    tibble::as_tibble() %>%
    dplyr::bind_cols(sf_object %>%
                       sf::st_drop_geometry() %>%
                       tibble::as_tibble()) %>%
    dplyr::rename(x = 1, y = 2)

  ## kernel smoothing at 25, 50 and 90 quantile
  output = btb::kernelSmoothing(dfObservations = bb.tb,
                               sEPSG = "32737",
                               iCellSize = cell_size,
                               iBandwidth = band_width,
                               vQuantiles = c(0.25,.50,.90),
                               iNbObsMin = min_obs) %>%
    sf::st_transform(crs = crs_code)

  ## bind the sf object of each quantile into one
  output %>% dplyr::select(nbObs , catch_025) %>% dplyr::rename(data = catch_025) %>% dplyr::mutate(quantile = "0.25") %>%
    rbind(output %>% dplyr::select(nbObs , catch_05) %>% dplyr::rename(data = catch_05) %>% dplyr::mutate(quantile = "0.5"),
          output %>% dplyr::select(nbObs , catch_09) %>% dplyr::rename(data = catch_09) %>% dplyr::mutate(quantile = "0.9"))
}
