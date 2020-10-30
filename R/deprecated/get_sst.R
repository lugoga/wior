
#' Get daily satellite data at one kilometer spatial resolution
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 2002-06-01
#' @param t2 a character end time in R-format ("year-month-day").It end one day before today date.
#'
#' @return a tibble of daily sst in specified geographical area and within the time limit.
#' @export
#'
#' @examples
get_sst = function(lon.min, lon.max, lat.min, lat.max, t1, t2){

  rerddap::griddap(x = "jplMURSST41",
                longitude = c(lon.min, lon.max),
                latitude = c(lat.min,lat.max),
                time = c(t1, t2),
                fmt = "csv") %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time)) %>%
    select(-c(analysis_error:sea_ice_fraction))
}
