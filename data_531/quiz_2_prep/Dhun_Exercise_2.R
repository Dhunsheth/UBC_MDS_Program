library(tidyverse, quietly = TRUE)
library(jsonlite, quietly = TRUE)
library(dplyr)
library(ggplot2)
library(docstring)
library(purrr)
library(testthat)
library(readr)
# Used ChatGPT

df <- read.csv("examdata.csv")

##### 1 ######

df_nums <- select(df, "age", "height", "weight")
average_vector <- colMeans(df_nums, na.rm = TRUE)
print(average_vector)

##### 2 #####
unique_elements_list <- lapply(df, function(x) length(unique(x)))
print(unique_elements_list)

##### 3 and 7 #####
calculateBMI <- function(height_cm, weight_kg) {
  #' Calculate BMI from height (in cm) and weight (in kg)
  #'
  #' This function calculates BMI from height in centimeters
  #' and weight in kilograms.
  #'
  #' @param height_cm Height in centimeters.
  #' @param weight_kg Weight in kilograms.
  #' @return BMI.
  #' @examples
    #' calculateBMI(175, 70)
    #' returns 22.85714
  height_meters <- height_cm / 100  # Convert height to meters
  BMI <- weight_kg / (height_meters * height_meters)
  return(BMI)
}

##### 4 #####
df$weight_kg <- df$weight * 0.4535
df$BMI <- calculateBMI(df$height, df$weight_kg)

##### 5 #####
average_BMI <- mean(df$BMI, na.rm = TRUE)
print(average_BMI)

##### 6 #####
expect_error(calculateBMI("hello", 50), "Error")
expect_equal(calculateBMI(175, 70), 22.85714, tolerance = 0.02)
expect_true(as.logical(calculateBMI(155, 72)), NA)
expect_output(print(typeof(calculateBMI(155, 72))), "double")
