library(tidyverse, quietly = TRUE)
library(jsonlite, quietly = TRUE)
library(dplyr)
library(ggplot2)
library(docstring)
library(purrr)
library(testthat)


# map_dbl(mtcars, min)
# map_dbl(mtcars_NA, function(x) median(x, na.rm  = TRUE))



#### DATA-580 Stuff ######

# N <- 1000; n <- 5; mu <- 3; sigma <- 7
# normalsamples <- matrix(rnorm(N*n, mean = mu, sd = sigma), nrow=n)
# 
# xbar <- apply(normalsamples, 2, mean)
# std <- apply(normalsamples, 2, sd)
# 
# tstat <- (xbar - mu)/(std/sqrt(n))
# 
# hist(tstat, freq = FALSE)
# curve(dt(x, df = n - 1), add = TRUE)


# x<-runif(100000,min=10,max=11)
# t<-runif(100000,min=15,max=20)
# 
# mean(3*x*t*((x+(t/5)- 13)/5))*(20-15)*(11-10)




