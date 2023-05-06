#' Get sea surface salinity (SSS) at 0.25 degree spatial resolution at 1 day interval
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 2010-06-01
#' @param t2 a character end time in R-format ("year-month-day").It end one day before today date. Available until two days before today
#'
#' @return a tibble of daily surface surface salinity in specified geographical area and within the time limit.
#' @export
#'
#' @examples
get_sss = function(lon.min, lon.max, lat.min, lat.max, t1, t2){

  sss = rerddap::griddap(datasetx = "coastwatchSMOSv662SSS3day",
                         longitude = c(lon.min, lon.max),
                         latitude = c(lat.min,lat.max),
                         time = c(t1, t2),
                         fmt = "csv")
  ## tidy the downloaded file
  sss %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time)) %>%
    dplyr::select(time, latitude, longitude, sss)

}
