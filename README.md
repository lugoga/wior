
# wior <img src="man/graphics/wior.svg" align="right"/>

One of the major challenge of the digital age is handling large amount
of data that are generated. Marine and freshwater scientist are not left
behind with these challenges. They spend most of their time searching
the right data to use in their projects. These data are provided in
various format that makes data preparation and manipulating even harder
than the time of obtaining them. Indeed, many find it the most tedious
and least enjoyable part of their work. Therefore, we decided to develop
a unified package in R—a Language and Environment for Statistical
Computing called **wior**.

The main goal of developing this package hinges to provide a way of
tackling the data access and manipulating data problem that has hindered
scientist, particularly in the western Indian Ocean region. **wior**
packages several functions and utilities that make R better for handling
oceanographic data in the tidy data paradigm. The package will ease the
burden of getting your data in the right format ready for your project.

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
instrument. We simply parse `cnv_tibble(cnv = "data/dstn054.cnv",
interval = 10)` whtere `cnv` is the path of the file and `interval` is
the standard depth you with the vertical profile to have. For this case
I have used 10 as standard depth, which mean after every ten meters, a
mean values is computed and create a binned profile at ten meter
interva.

``` r
require(wior)

ctd = wior::cnv_tibble(cnv = "data/dstn054.cnv", interval = 10)
```

We can then have glimpse of the dataset

``` r

ctd %>% 
  dplyr::mutate(dplyr::across(is.numeric,round,2)) %>% 
  # dplyr::slice(1:12) %>%
  dplyr::select(time, pressure, temperature2:fluorescence)
# A tibble: 66 x 7
   time                pressure temperature2 conductivity salinity oxygen
   <dttm>                 <dbl>        <dbl>        <dbl>    <dbl>  <dbl>
 1 2004-08-19 17:39:39        0         25.1         5.3      34.9   4.64
 2 2004-08-19 17:39:39       10         25.1         5.3      34.9   4.64
 3 2004-08-19 17:39:39       20         25.0         5.29     34.9   4.65
 4 2004-08-19 17:39:39       30         24.8         5.27     34.9   4.47
 5 2004-08-19 17:39:39       40         24.7         5.26     34.9   4.36
 6 2004-08-19 17:39:39       50         24.7         5.26     34.9   4.34
 7 2004-08-19 17:39:39       60         24.7         5.26     34.9   4.33
 8 2004-08-19 17:39:39       70         24.5         5.24     34.9   4.27
 9 2004-08-19 17:39:39       80         24.0         5.2      34.9   4.14
10 2004-08-19 17:39:39       90         23.5         5.15     35.0   3.94
# ... with 56 more rows, and 1 more variable: fluorescence <dbl>
```

We see that we got a tabular format vertical profile of the CTD cast
with all the variable. You can read more of the functions in this
package through the documents of [Introduction to
wior](https://github.com/lugoga/wior/blob/main/Intro.html) and [package
manual](https://github.com/lugoga/wior/blob/main/wior_manual.pdf).

## Citation

Please cite the package when you make use of its function. You can cite
in the format here below:

> Masumbuko Semba and Nyamisi Peter (2020). *wior*: Easy Tidy and
> Process Oceanographic Data. R package version 0.0.0.1.
