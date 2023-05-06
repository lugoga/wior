#' Download precipation value at global scale with 5 kilometer resolution from Climate Hazards Group InfraRed Precipitation with Station data (CHIRPS) since 1981
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 1981-01-01
#' @param t2 a character end time in R-format ("year-month-day"). The maximum data, when this function was written was 2020-01-01.
#' @param level represent mean average precipitation, where 1 = daily, 2 =  5-day composite, 3 = monthly composite, 4 = Annual composite. Default is daily (level = 1)
#'
#' @return a tibble
#' @export
#'
#' @examples
#' \dontrun{
#' require(tidyverse)
#' require(wior)
#' pangani = wior::get_precip(lon.min = 38.8, lon.max = 39.01, lat.min = -5.45, lat.max = -5.37, t1 = "1981-01-01", t2 = "2019-12-31", level = 4)
#' pangani %>% group_by(time) %>% summarise(precip = mean(precip, na.rm = TRUE)) %>% ggplot(aes(x = time, y = precip))+geom_path()
#' }
#'
#' @examples
get_precip = function(lon.min, lon.max, lat.min, lat.max, t1, t2, level = 1){

  precid = c("chirps20GlobalDailyP05",
             "chirps20GlobalPentadP05",
             "chirps20GlobalMonthlyP05",
             "chirps20GlobalAnnualP05")

  chosenid = precid[level]

  rerddap::griddap(datasetx = chosenid,
                   longitude = c(lon.min, lon.max),
                   latitude = c(lat.min,lat.max),
                   time = c(t1, t2),
                   fmt = "csv") %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time))
}
