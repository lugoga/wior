#' Download derived primary productivity from ERDDAP server
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 2003-01-01
#' @param t2 a character end time in R-format ("year-month-day"). The maximum data end two days before today.
#' @param level represent mean average, where 1 = daily, 2 = 3 day, 3 = monthly composite. Default is daily (level = 1)
#'
#' @return a tibble
#' @export
#'
#'
#' @examples
get_ppMODIS = function(lon.min, lon.max, lat.min, lat.max, t1, t2, level = 1){

  ppid = c("erdMH1pp1day", "erdMH1pp3day", "erdMH1ppmday")

  chosenid = ppid[level]

  rerddap::griddap(datasetx = chosenid,
                   longitude = c(lon.min, lon.max),
                   latitude = c(lat.min,lat.max),
                   time = c(t1, t2),
                   fmt = "csv") %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time))
}
