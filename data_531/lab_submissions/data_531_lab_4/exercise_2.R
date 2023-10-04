library(tidyverse, quietly = TRUE)

lab4 <- read_csv("lab4.csv")

new_df <- data.frame(
  name = c("Diego", "Kim", "Nelson"),
  age = c(22,67,11),
  gender = c("M", "F", "M"),
  height = c(129,103,100),
  weight = c(50.77,32.11,22.74),
  country = c("Mexico","North Korea","Uganda"),
  email = c("diegor@mail.tfr.mx","kimlady@gmail.com","nSekitolenko@urj.com")
)
new_df <- as_tibble(new_df)

combined_df <- full_join(lab4,new_df)

num_averages <- colMeans(combined_df[sapply(combined_df, is.numeric)], na.rm = TRUE)
print(num_averages)