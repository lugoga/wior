
# wior <img src="man/graphics/wior.svg" align="right"/>

**wior** packages several functions and utilities that make R better for
handling oceanographic data in the tidy data paradigm. It started mostly
as a packaging of assorted wrappers and tricks that I wrote for my day
to day work as a researcher in oceanographic sciences at the Institute
of Marine Sciences, Zanzibar.

The packages is basically developed to help marine and freshwater
scientist access a large and varied format of in-situ and satellite data
in easy way. In fact the package has made data access in much easy way.
We are trying to remove the barrier of data access and leave scientist
focus in much deeper thinking of their field rather than spending
several days to understand code and syntax of language. The package
contains several tools that allows scientist to get a wide array of
datasets. And the funny things is that you get a tidy format result of
the download, which is easy to handle in R and also to share it out of R
environment. The tidy format is in form that many scientist familiar
with Excel spreadsheet will find it handy.

Currently **wior** is in development but maturing. Most functions check
arguments and there are some tests. However, some functions might change
it’s interface, and functionality can be moved to other packages, so
please bear that in mind.

## Installation

You can install development version of **wior** from github:

``` r
# install.packages("devtools")
devtools::install_github("lugoga/wior")
```

## Examples

In this example we easily read a CTD file, which is in `cnv` format. For
those who have worked with CTD data understand the hurdle we often go
through the steps to process binary data from the instrument before is
in the right format for use. However, with `cnv_tibble` function from
**wior** package, that process is accomplished with one line of code and
you get tabular format with all the variables measured with the
instruement.

``` r
require(wior)
#> Loading required package: wior

ctd = wior::cnv_tibble(cnv = "e:/Data Manipulation/ctd_algoa/dstn052.cnv", interval = 10)
#> Warning in cnvName2oceName(lines[nameLines[iline]], columns, debug = debug - :
#> unrecognized SBE name 'obs'; consider using 'columns' to define this name
#> Warning in read.ctd.sbe(file, columns = columns, station = station, missingValue
#> = missingValue, : this CNV file has temperature in the IPTS-68 scale, and this
#> is stored in the object; note that [["temperature"]] and the sw* functions will
#> convert to the modern ITS-90 value

ctd %>% dplyr::slice(1:12)
#> # A tibble: 12 x 17
#>    time                 scan pressure  depth temperature temperature2
#>    <dttm>              <dbl>    <dbl>  <dbl>       <dbl>        <dbl>
#>  1 2004-08-19 13:33:31  316.        0   4.48        25.2         25.2
#>  2 2004-08-19 13:33:31 1052.       10  10.4         25.2         25.2
#>  3 2004-08-19 13:33:31 1374.       20  20.4         25.1         25.0
#>  4 2004-08-19 13:33:31 1664.       30  30.3         25.0         25.0
#>  5 2004-08-19 13:33:31 2013.       40  40.3         25.0         24.9
#>  6 2004-08-19 13:33:31 2426.       50  50.2         24.8         24.8
#>  7 2004-08-19 13:33:31 2722.       60  60.2         24.5         24.5
#>  8 2004-08-19 13:33:31 3026.       70  70.1         24.0         24.0
#>  9 2004-08-19 13:33:31 3361.       80  80.0         23.1         23.1
#> 10 2004-08-19 13:33:31 3717.       90  90.0         22.0         22.0
#> 11 2004-08-19 13:33:31 4108.      100  99.9         21.3         21.3
#> 12 2004-08-19 13:33:31 4486.      110 110.          20.5         20.5
#> # ... with 11 more variables: conductivity <dbl>, salinity <dbl>, oxygen <dbl>,
#> #   fluorescence <dbl>, obs <dbl>, spar <dbl>, par <dbl>, v2 <dbl>,
#> #   salinity2 <dbl>, density <dbl>, soundSpeed <dbl>
```

You can read more in the vignettes: [Introduction to
wior](https://github.com/lugoga/wior/blob/main/Intro.html).
