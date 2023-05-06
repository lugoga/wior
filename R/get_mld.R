#' Get climatological gridded mixed layer depth (MLD) from WOA
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 not required for climatology
#' @param t2 not required for climatology
#'
#' @return a tibble of daily MLD in a chosen geographical area.
#' @export
#'
#' @examples
get_mld = function(lon.min, lon.max, lat.min, lat.max, t1 = NULL, t2 = NULL){

  if(lon.max < 0 | lon.min < 0){
    lon.min = metR::ConvertLongitude(lon.min)
    lon.max = metR::ConvertLongitude(lon.max)


    mld = rerddap::griddap(datasetx = "noaa_esrl_12a4_5e5f_007a",
                           longitude = c(lon.min, lon.max),
                           latitude = c(lat.min,lat.max),
                           # time = c(t1, t2),
                           fmt = "csv")
    ## tidy the downloaded file

    mld %>%
      dplyr::as_tibble() %>%
      dplyr::mutate(longitude = longitude - 360)


  }else {

    mld = rerddap::griddap(x = "noaa_esrl_12a4_5e5f_007a",
                           longitude = c(lon.min, lon.max),
                           latitude = c(lat.min,lat.max),
                           # time = c(t1, t2),
                           fmt = "csv")
    ## tidy the downloaded file

  }

}
