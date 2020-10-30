
#' Download SeaWIFS chlorophyll at 11 km resolution near equator
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 1997-09-04
#' @param t2 a character end time in R-format ("year-month-day"). The maximum data end on 210-12-11.
#' @param level represent mean average, where 1 = daily, 2 = 8 day compositie, 3 = monthly composite. Default is daily (level = 1)
#'
#' @return a tibble
#' @export
#'
#' @examples
get_chlSeawif = function(lon.min, lon.max, lat.min, lat.max, t1, t2, level = 1){


  # chlModisId = c("erdMH1chla1day", "erdMH1chla8day", "erdMH1chlamday")
  chlseawifId = c("erdSW2018chla1day", "erdSW2018chla8day", "erdSW2018chlamday")

  chosenid = chlseawifId[level]

  rerddap::griddap(x = chosenid,
                   longitude = c(lon.min, lon.max),
                   latitude = c(lat.min,lat.max),
                   time = c(t1, t2),
                   fmt = "csv") %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time))
}
