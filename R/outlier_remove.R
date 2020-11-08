#' Remove observations of a variables detected as outlier in a data frame
#'@description outliers are values that deviate so much from other observations.
#' @param x a variable to remove outlier
#' @param data A data frame
#'
#' @return A tibble with only observations after removing rows of outliers
#' @export
#'
#' @examples
outlier_remove = function(data, x){
  ## need a special {{ }} symbol to make functions with dplyr and ggplot2.

  data = data %>% tibble::as_tibble()
  outlier.var = data %>% dplyr::pull({{x}})

  q =  outlier.var %>% stats::quantile(na.rm = TRUE)
  iqr = outlier.var %>% stats::IQR(na.rm = TRUE)

  lower = q[2] - (1.5 * iqr)
  upper = q[4] + (1.5 * iqr)

  data %>%
    dplyr::filter({{x}} > lower & {{x}} <= upper)

}
