
#' Title:  A function that add a monsoon season column in the data frame from date
#'@description The Indian Ocean experience reversal of trade winds, which also affect the physical, biological and chemical process in the area. When you have a data frame with time variable, you can easily derive a colum with variables that shows the three common season---northeast (October--March), southeast (May--Septemeber) and inter--monsoon season (April and October). So with \code{monsoon_season}, we can easily convert any date and time into season
#'
#' @param data a Data frame
#' @param x  a time variable in the data frame
#'
#' @return a tibble with added column of season
#' @export
#'
#' @examples
#'\dontrun{
#' require(wior)
#' met = read_csv("data/met")
#' check the structure of the dataset
#' met %>% str()
#' # now we compute the monsoon
#' met %>% wior::monsoon_season(data = met, x = date)
#'
#'}
#'
#'@author Masumbuko semba
#'
monsoon_season = function(data, x){

  data %>%
    dplyr::mutate(date = lubridate::as_date({{x}}),
                  month = lubridate::month({{date}}) %>% as.integer(),
                  season = dplyr::case_when(month >= 11 ~ "NE",
                                            month <= 3 ~ "NE",
                                            month >= 5 & month <= 9 ~ "SE",
                                            month %in% c(4,10) ~ "IN")
                  #, station = stringr::str_to_title(string = station)
    )

  # %>%
  #   tidyr::separate(col = 1, into = c("station", "country"), sep = ",")%>%
  #   dplyr::select(-month, -country) %>%
  #   dplyr::relocate(season, .after = date)
}
