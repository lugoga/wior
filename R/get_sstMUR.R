#' Download Multi-scale Ultra-high Resolution SST at 1 km resolution
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 2002-06-01
#' @param t2 a character end time in R-format ("year-month-day"). The maximum data end a day before today.
#' @param level represent mean average, where 1 = daily, 2 =  monthly composite, 3 = daily anomaly, 4 = monthly anomaly and 5 = climate. Default is daily (level = 1)
#'
#' @return a tibble
#' @export
#'
#' @examples
get_sstMUR = function(lon.min, lon.max, lat.min, lat.max, t1, t2, level = 1){

  sstmurid = c("jplMURSST41", "jplMURSST41mday", "jplMURSST41anom1day",
               "jplMURSST41anommday", "jplMURSST41clim")

  chosenid = sstmurid[level]

  rerddap::griddap(datasetx = chosenid,
                   longitude = c(lon.min, lon.max),
                   latitude = c(lat.min,lat.max),
                   time = c(t1, t2),
                   fmt = "csv") %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time))
}
