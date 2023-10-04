library(tidyverse, quietly = TRUE)
library(jsonlite, quietly = TRUE)
library(dplyr)
library(ggplot2)
library(docstring)
library(purrr)
library(testthat)
library(readr)
# Used ChatGPT

# Read the CSV file into a dataframe
df <- read_csv("rquizdata.csv")

#### 1a #####
head(df, 5)

#### 1b #####
summary(df)

#### 2 #####
df <- df %>% mutate(fullname = paste(firstname, lastname, sep = " "))

#### 3 #####
df <- df %>% mutate(management = ifelse(salary > 50000 & age > 45, "Y", "N"))

#### 4a #####
map_dbl(df['age'], function(x) mean(x, na.rm  = TRUE))

#### 4b #####
map_dbl(df['salary'], function(x) max(x, na.rm  = TRUE))

#### 5a #####
females <- df %>% filter(gender == "F")
avg_salary_female <- as.double(mean(females$salary))

#### 5b #####
males <- df %>% filter(gender == "M")
avg_salary_male <- mean(males$salary)

#### 6 #####
gender_counts <- df %>%
  group_by(gender) %>%
  summarize(count = n())
ggplot(data = gender_counts, aes(x = gender, y = count)) +
  geom_bar(stat = "identity", fill = "grey") +
  labs(x = "Gender", y = "Count") +
  ggtitle("Number of Females and Males")

#### 7 #####
ggplot(df, aes(x = gender, y = salary, fill = gender)) +
  geom_boxplot() +
  labs(x = "Gender", y = "Salary") +
  ggtitle("Salary Distribution for Females and Males")
