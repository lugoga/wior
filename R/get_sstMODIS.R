#' Get SST at global level for daily, 8 days and monthly composite from MODIS satellite data at 9 kilometer spatial resolution near the Equator
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude value
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 2003-01-16
#' @param t2 a character end time in R-format ("year-month-day"). last date is on 2919-10-16.
#' @param level dataset of SST for day (level = 1)  for 8 day (level = 2) and monthyl composite (level = 3)
#'
#' @return a tibble dataset contain the gridded sst
#' @export
#'
#' @examples
get_sstMODIS = function(lon.min, lon.max, lat.min, lat.max, t1, t2, level = 1){

  datasetid = c("erdMH1sstd1day","erdMH1sstd8day" ,"erdMH1sstdmday")
  chosenid = datasetid[level]

  rerddap::griddap(datasetx = chosenid,
                   longitude = c(lon.min, lon.max),
                   latitude = c(lat.min,lat.max),
                   time = c(t1, t2),
                   fmt = "csv") %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time))
}
