
#' Create a html variable for use as popups in interactive maps created with leaflet
#'
#' @param data a data frame containing longitude and latitude
#' @param label a variable name of the data frame
#'
#' @return a tibble with html format label that works well with leaflet
#' @export
#'
#' @examples
add_label <- function(data, label) {

  data$label <- paste0(
    '<b>',  '</b><br>
    <table style="width:120px;">
    <tr><td>Name:</td><td align="right">', data %>% dplyr::pull({{label}}), '</td></tr>
    </table>'
  )

  data$label <- lapply(data$label, HTML)
  data %>% tibble::as_tibble()

}

