
#' Convert binned simple feature into tibble for drawing with ggplot2
#'
#' @param x a simple feature
#'
#' @return a data frame with three column of x,y, and z
#' @export
#'
#' @examples
sf_tibble = function(x){


    aa = x %>%
      stars::st_rasterize() %>%
      cubelyr::as.tbl_cube()

    x = aa$dims$x
    y = aa$dims$y
    z = aa$mets

    # length(lon);length(lat);dim(z)

    expand.grid(x,y) %>%
      dplyr::bind_cols(expand.grid(z)) %>%
      dplyr::as_tibble() %>%
      rename(lon = 1, lat = 2, z = 3)


}



