#' Plot vertical profile of CTD
#'
#' @param data data frame
#' @param x a variable in data frame in the x-axis
#' @param y a variable in data frame in the y-axis
#'
#' @return a vertical profile plot of the selected variables
#' @export
#'
#' @examples
plot_profile = function(data, x, y){
  # need a special {{ }} symbol to make functions with dplyr and ggplot2.
  data = data %>% tidyr::drop_na()


  value.y = data %>% dplyr::pull({{y}})
  value.x = data %>% dplyr::pull({{x}})

   data %>%
    ggplot2::ggplot(aes(x = {{x}}, y = {{y}})) +
    ggplot2::geom_path()+
    ggplot2::geom_point(size = 3)+
    ggplot2::scale_x_continuous(name = expression(Temperature~(degree*C)),
                                position = "top",
                                breaks = seq(value.x %>% min(),
                                             value.x %>% max(),
                                             length.out = 5) %>%  round(2))+
     ggplot2::scale_y_reverse(name = "Pressure [m]",
                              breaks = seq(value.y %>% min(),
                                           value.y %>% max(),
                                           length.out = 5) %>% round(2))+
     cowplot::theme_cowplot()+
     ggplot2::theme(axis.text = element_text(size = 11),
                   axis.title = element_text(size = 12),
                   legend.position = c(.15,.8), axis.title.y = element_blank())
}
