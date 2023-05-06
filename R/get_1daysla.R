#'  Get Sea level anomalies (SLA) from Altimetry at 25 spatial resolution near the Equator
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 2017-02-13
#' @param t2 a character end time in R-format ("year-month-day"). last date is often one day behind today.
#'
#' @return a tibble of daily sla within a specified geographical area and time limit.
#' @export
#'
#' @examples
get_1daysla = function(lon.min, lon.max, lat.min, lat.max, t1, t2){

  rerddap::griddap(datasetx = "nesdisSSH1day",
                   longitude = c(lon.min, lon.max),
                   latitude = c(lat.min,lat.max),
                   time = c(t1, t2),
                   fmt = "csv") %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time))
}
