#' Convert CTD profile data to tibble
#'
#' @param cnv a scientific format of cnv after being converted from hex
#' @param interval  depth interval to create standard depth
#'
#' @return a tibble with temperature, depth conductivity as standard CTD variables and additional variables depending on the sensors configured in the instrument
#' @export
#'
#' @examples
#'
cnv_tibble = function(cnv = cnv, interval = 2){

  ## read a cast
  ctd = oce::read.ctd(cnv)
  ## process the cast
  ctd = ctd %>%
    oce::ctdTrim(method = "downcast") %>%
    oce::ctdDecimate(p = interval)

  ## tidy the cast data
  ctd@data %>%
    dplyr::bind_cols(time = ctd@metadata$startTime)  %>%
    dplyr::select(time, everything())%>%
    tibble::as_tibble()
}
