#' Get OSCAR global surface currents at 1/3 degree spatial resolution at 5 day interval
#'
#' @param lon.min a numeric minimum longitude value
#' @param lon.max a numeric maximum longitude value
#' @param lat.min a numeric minimum latitude value
#' @param lat.max a numeric maximum latitude valu
#' @param t1 a character begin time in R-format ("year-month-day"). The minimum begin from 2002-10-01
#' @param t2 a character end time in R-format ("year-month-day").It end one day before today date. Available until 2020-03-01
#'
#' @return a tibble of daily surface current (u and V) in specified geographical area and within the time limit.
#' @export
#'
#' @examples
get_oscar = function(lon.min, lon.max, lat.min, lat.max, t1, t2){

  oscar = rerddap::griddap(datasetx = "jplOscar_LonPM180",
                           longitude = c(lon.min, lon.max),
                           latitude = c(lat.min,lat.max),
                           time = c(t1, t2),
                           fmt = "csv")
  ## seems that when run the chunk, it creates two files. So separating them solve the problem
  oscar %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(time = lubridate::as_date(time)) %>%
    dplyr::select(-c(depth, um, vm))

}
