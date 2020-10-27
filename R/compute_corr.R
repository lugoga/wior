#' Compute correlation of two independent variables
#'
#' @param data input tibble or data frame
#' @param var1 name of the first variable
#' @param var2 name of the second variable
#'
#' @return a tibble with correlation coefficient and the p-value
#' @export
#'
#' @examples
compute_corr <- function(data = cars, var1 = speed, var2 = dist){

  # compute correlation ----
  cor.test(
    x = data %>% dplyr::pull({{var1}}),
    y = data %>% dplyr::pull({{var2}})
  ) %>%
    # tidy up results ----
  broom::tidy() %>%
    # retain and rename relevant bits ----
  dplyr::select(
    correlation = estimate,
    pval = p.value
  ) %>%
    dplyr::mutate(intepretation = dplyr::if_else(condition = pval < 0.05,
                                        true = "Significant: since the pval is less than 0.05",
                                        false = "Insignificant: since the pval is greater than 0.05"))

}
