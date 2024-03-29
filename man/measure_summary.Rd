% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/measure_symetry.R
\name{measure_summary}
\alias{measure_summary}
\title{Compute summary from data frame}
\usage{
measure_summary(x)
}
\arguments{
\item{x}{a data frame or tibble with with continous variable(s)}
}
\value{
a tibble with computed values for center and variation
}
\description{
This function compute measure of the center and variation and combine them into a single output
}
\examples{
\dontrun{
require(wior)
data = read_csv("data/meteo_coastal_station.csv")
data \%>\% measure_summary()
}
}
\author{
Masumbuko Semba
}
