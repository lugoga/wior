#' Download Southern Oscillation Index Data
#' @param begin_date a begin date value you wish to download the data. Should be in a R format ("YYYY-MM-DD")
#' @param end_date an end date value you wish to download the data. Should be in a R format ("YYYY-MM-DD")
#'
#'@author Masumbuko Semba
#'@description The Southern Oscillation Index (SOI) is defined as the standardized difference between barometric pressure between Tahiti and Darwin, Australia. The SOI is one measure of the large-scale fluctuations in air pressure occurring between the western and eastern tropical Pacific (i.e., the state of the Southern Oscillation) during El Niño and La Niña episodes. In general, smoothed time series of the SOI correspond very well with changes in ocean temperatures across the eastern tropical Pacific.
#' @return  a tibble contains;
#' + date a date variable,
#' + condition whether is warm or cool condition of the oceans,
#' + phase whether is El-Nino or La-Nina and
#' + soi variables
#' @export
#'
#' @examples
#' \dontrun{
#' require(wior)
#' enso(begin_date = "2000-08-01", end_date = "2020-05-01")
#'
#' }
enso = function(begin_date, end_date){

  x = lubridate::ymd(end_date)

  enso = rsoi::download_enso()

  enso.last.date = enso %>% dplyr::slice(nrow(enso)) %>% dplyr::distinct(Date) %>% dplyr::pull()

  if(x >= enso.last.date){
    stop("i am sorry, the date ", x, " is higher than the date in the data. Please supply end date below ", enso %>% dplyr::slice(nrow(enso)) %>% dplyr::distinct(Date) %>% dplyr::pull())
  }

  enso %>%
    janitor::clean_names() %>%
    dplyr::filter(date >= begin_date & date <= end_date) %>%
    dplyr::select(date, phase,soi) %>%
    tidyr::separate(col = phase, into = c("condition", "phase"), sep = "/") %>%
    dplyr::mutate(phase = replace(phase, is.na(phase), "Neutral"),
                  condition = stringr::str_remove(string = condition, pattern = " Phase"))
}
