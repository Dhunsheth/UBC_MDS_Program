library(tidyverse, quietly = TRUE)
library(jsonlite, quietly = TRUE)
library(dplyr)
library(ggplot2)

sensor <- read_csv("sensor.csv")

for (i in seq(1,length(sensor$timestamp),1)){
  sensor$day[i] <- as.double(substr(sensor$timestamp[i],8,9))
  sensor$time[i] <- substr(sensor$timestamp[i],45,52)
}
print(sensor)

sensor$value <- as.double(sensor$value)

sensors_clean <- sensor %>% filter(value <= 100) %>% filter(value >= 0)

print(sensors_clean)

# count_valid <- length(sensors_clean$value)
# min_reading <- min(sensors_clean$value)
# mean_reading <- mean(sensors_clean$value)
# range_reading <- range(sensors_clean$value)
# max_reading_site_2 <- max(filter(sensors_clean, siteid == 2)$value)
# count_site_1_sensor_2 <- length(filter(sensors_clean, siteid == 1 & sensorid == 2)$value)

# assume summary is for sensor dataframe
count_valid <- length(sensors_clean$value)
min_reading <- min(filter(sensor, !is.na(value))$value)
mean_reading <- mean(filter(sensor, !is.na(value))$value)
range_reading <- range(filter(sensor, !is.na(value))$value)
max_reading_site_2 <- max(filter(sensor, !is.na(value) & siteid == 2)$value)
count_site_1_sensor_2 <- length(filter(sensor, siteid == 1 & sensorid == 2)$value)


data_summary <- list(count_valid, min_reading, mean_reading, range_reading, 
                     max_reading_site_2, count_site_1_sensor_2)
names(data_summary) <- c("count_valid","min_reading","mean_reading", "range_reading", 
                         "max_reading_site_2", "count_site_1_sensor_2")
print(data_summary)

sensors_clean_hist <- ggplot(sensors_clean, aes(x=value)) +
  geom_histogram( binwidth=3, fill="#69b3a2", color="#e9ecef", alpha=0.9) +
  ggtitle("Count of Values in clean_sensors")

print(sensors_clean_hist)


# assume box plot is for the total sensor data
# sensors_clean_box_plot <- ggplot(sensors_clean, aes(x=sensorid, y=value, group=sensorid)) + 
#    geom_boxplot()

sensor_box_plot <- ggplot(sensor, aes(x=sensorid, y=value, group=sensorid)) + 
  geom_boxplot()

print(sensor_box_plot)