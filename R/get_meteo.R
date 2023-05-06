#' Download hourly meteorological data
#'
#' @author Masumbuko Semba
#'
#'@description
#'Access surface meteorological data from the NOAA Integrated Surface Database from six stations along the coastal of Tanzania. These stations include Tanga, Pemba, Unguja, Mwalimu Nyerere International Airport, Kilwa Masoko and Mtwara.
#'
#' @param coastal_codes a numeric number that represent a station for meteorological data (i.e 1 = Zanzibar, 2 = Tanga, 3 = Mwalimu Nyerere Airport, 4 = Pemba, 5 = Kilwa Masoko and 6 = Mtwara)
#' @param begin_year specify the minimal year you wish to extract the data
#' @param end_year  specify the maximum year of the data you want to extract
#'
#' @return a tibble of meteorological data
#' @export
#'
#' @examples
#'\dontrun{
#' require(wior)
#' site = get_meteo(coastal_codes = 3, begin_year = 2018, end_year = 2019)
#'}
#'
#' @seealso \code{\link{get_sstMODIS}} and \code{\link{get_chlSeawif}}
get_meteo = function(coastal_codes = 2, begin_year, end_year){

  station.code = c("638700-99999", "638440-99999", "638940-99999" ,"638450-99999",
                   "639193-99999", "639710-99999")

  # coastal.station = c("Zanzibar", "Tanga",  "Mwalimu Julius Airport", "Pemba", "Kilwa Masoko" ,"Mtwara")

  chosen_code = station.code[coastal_codes]
  metdata = worldmet::importNOAA(code = chosen_code,
                                 year = begin_year:end_year,
                                 quiet = TRUE, hourly = TRUE )

  # metdata %>% dplyr::select(station:wd, air_temp, precip)
}
