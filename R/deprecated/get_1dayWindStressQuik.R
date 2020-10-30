#' Get global daily zonal and meridional wind stress from QUIKSCAT satellite data at 12.5 kilometer spatial resolution near the Equator
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 1999-07-21
#' @param t2 a character end time in R-format ("year-month-day"). End a day before today.
#'
#' @return a tibble of daily wind stress at 10m from the surface within a specified geographical area and time limit.
#' @export
#'
#'
#' @examples
get_1dayWindStressQuik = function(lon.min, lon.max, lat.min, lat.max, t1, t2){

  rerddap::griddap(x = "erdQAstress1day_LonPM180",
                   longitude = c(lon.min, lon.max),
                   latitude = c(lat.min,lat.max),
                   time = c(t1, t2),
                   fmt = "csv") %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time))
}
