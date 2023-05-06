#' Interpolate irregular data to regular grids.
#'
#' @param x A vector containing a element represent x value
#' @param y A vector of y-value
#' @param z A vector containing element of z-value
#' @param n determine the spacing, if you specify 10 you get 100 i.e 10*10 = 100
#'
#' @return A tibble format that is compatible with tidyverse ecosystem
#' @export
#'
#' @examples
interp_2d = function(x, y, z, n){

  # It also scale up or downscale points data. This function is faster and more accurately than the interpBarnes from oce package.
  ## define the spacing of the grids.
  x_out = seq(from = min(x), to = max(x), length.out = n)
  y_out = seq(from = min(y), to = max(y), length.out = n)

  ## the body, work out the interpolation
  metR::Interpolate(formula = z ~ x + y,
                    x.out = x_out,
                    y.out = y_out) %>%
    tibble::as_tibble()

}
