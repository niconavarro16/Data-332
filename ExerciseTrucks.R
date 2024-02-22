library(readxl)
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)
library(stringr)

rm(list = ls())
#setting up working directory
setwd('C:/Users/nicol/OneDrive/Augustana College/3 year/Spring term/DATA 332/Data')

df_truck <- read_excel('NP_EX_1-2.xlsx', sheet = 2, skip = 3, .name_repair = 'universal')

#selecting columns
df <- df_truck[, c(4:15)]
#deselecting columns
df <- subset(df, select = -c(...10))

#getting difference in days within a column
date_min <- min(df$Date)
date_max <- max(df$Date)

numer_of_days_on_the_road <- date_max - date_min
print(numer_of_days_on_the_road)

#other day of getting the days
days <- difftime(max(df$Date), min(df$Date))
print(days)

number_of_days_recorded <-nrow(df)

total_hours <- sum(df$Hours)
avg_hrs_per_day_rec <- round(total_hours / number_of_days_recorded, digits = 3)
print(avg_hrs_per_day_rec)

#add column to show the cost of fuel
df$fuel_cost <- df$Gallons * df$Price.per.Gallon

#add total cost of fuel summing it 
total_cost <- df$Tolls + df$Misc + df$fuel_cost

#new column getting each city and state
df[c('warehouse', 'city_state')] <- str_split_fixed(df$Starting.Location, ',', 2)

#calculate total gallons consumed
total_gallons_consumed <- sum(df$Gallons)
print(total_gallons_consumed)

#calculate total miles driven
total_miles_driven <- sum(df$Odometer.Ending - df$Odometer.Beginning)

#calculate the miles per gallon
miles_per_gallon <- total_miles_driven - total_gallons_consumed

#total cost per mile
sum_price_gallon <- sum(df$Price.per.Gallon)
total_cost_per_mile <- total_miles_driven / sum_price_gallon
