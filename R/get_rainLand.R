#' Download rainfall average on land at 6 km resolution
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 1981-01-01
#' @param t2 a character end time in R-format ("year-month-day"). The maximum data end on 2019-10-01.
#' @param level represent mean average, where 1 = daily, 2 = 5 day, 3 = monthly, and 4 = annual average of precipitation. Default is daily (level = 1)
#'
#' @return a tibble
#' @export
#'
#' @examples
get_rainLand = function(lon.min, lon.max, lat.min, lat.max, t1, t2, level = 1){

  # id = 1:5
  # period = c("day", "5 day", "month", "annual")

  rainid = c("chirps20GlobalDailyP05","chirps20GlobalPentadP05",
             "chirps20GlobalMonthlyP05","chirps20GlobalAnnualP05")

  chosenid = rainid[level]

  rerddap::griddap(datasetx = chosenid,
                   longitude = c(lon.min, lon.max),
                   latitude = c(lat.min,lat.max),
                   time = c(t1, t2),
                   fmt = "csv") %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time),
                  precip = dplyr::na_if(precip, y = 0))
}
