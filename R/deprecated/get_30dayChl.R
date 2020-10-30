#' Get monthly mosaic chlorophyll concentration from MODIS satellite data at four kilometer spatial resolution
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 2003-01-01
#' @param t2 a character end time in R-format ("year-month-day"). To be safe, you should set three months behind today date.
#'
#' @return a tibble of daily chlorophyll concentration in specified geographical area and within the time limit.
#' @export
#'
#' @examples
get_30dayChl = function(lon.min, lon.max, lat.min, lat.max, t1, t2){

  rerddap::griddap(x = "erdMH1chlamday",
                   longitude = c(lon.min, lon.max),
                   latitude = c(lat.min,lat.max),
                   time = c(t1, t2),
                   fmt = "csv") %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time)) %>%
    select(time, latitude, longitude, chlorophyll)
}
