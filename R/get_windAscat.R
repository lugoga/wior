#' Get daily gloabal wind speed and stress from ASCAT satellite data at 25 kilometer spatial resolution near the Equator
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 2009-10-03
#' @param t2 a character end time in R-format ("year-month-day"). Specify the last time as one day before today.
#' @param level whether is wind speed (level = 1) o  wind stress (level = 2)
#'
#' @return a tibble dataset contain the zonal and meridional field components
#' @export
#'
#' @examples
get_windAscat = function(lon.min, lon.max, lat.min, lat.max, t1, t2, level = 1){

  datasetid = c("erdQAwind1day_LonPM180" ,"erdQAstress1day_LonPM180")
  chosenid = datasetid[level]

  rerddap::griddap(datasetx = chosenid,
                   longitude = c(lon.min, lon.max),
                   latitude = c(lat.min,lat.max),
                   time = c(t1, t2),
                   fmt = "csv") %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time))
}
