library(tidyverse)
library(readxl)
library(here)
library(skimr) 
library(kableExtra)

setwd('C:/Users/nicol/OneDrive/Augustana College/3 year/Spring term/DATA 332/Data')
lobsters <- read.csv('Lobster_Abundance_All_Years_20230831.csv')

skimr::skim(lobsters)

#grouping
lobsters %>%
  group_by(YEAR) %>%
  summarize(count_by_year = n())

#number of rows
lobsters %>%
  summarize(count =  n())

lobsters %>%
  group_by(YEAR)

lobsters %>%
  group_by(SITE, YEAR) %>%
  summarize(count_by_siteyear =  n())

#mean
lobsters %>%
  group_by(SITE, YEAR) %>%
  summarize(count_by_siteyear =  n(),
            mean_size_mm = mean(SIZE_MM))

#standard deviation
lobsters %>%
  group_by(SITE, YEAR) %>%
  summarize(count_by_siteyear =  n(), 
            mean_size_mm = mean(SIZE_MM, na.rm=TRUE), 
            sd_size_mm = sd(SIZE_MM, na.rm=TRUE))

#saving ALL the summary info in a variable
siteyear_summary <- lobsters %>%
  group_by(SITE, YEAR) %>%
  summarize(count_by_siteyear =  n(), 
            mean_size_mm = mean(SIZE_MM, na.rm = TRUE), 
            sd_size_mm = sd(SIZE_MM, na.rm = TRUE))

# make a table with our new variable
siteyear_summary %>%
  kable()

siteyear_summary <- lobsters %>%
  filter(SIZE_MM >= 0) %>%
  group_by(SITE, YEAR) %>%
  summarize(count_by_siteyear =  n(), 
            mean_size_mm = mean(SIZE_MM, na.rm = TRUE), 
            sd_size_mm = sd(SIZE_MM, na.rm = TRUE), 
            median_size_mm = median(SIZE_MM, na.rm = TRUE))

# a ggplot option:
ggplot(data = siteyear_summary, aes(x = YEAR, y = median_size_mm, color = SITE)) +
  geom_line() 

ggsave(here("figures", "lobsters-line.png"))

# another option:
ggplot(siteyear_summary, aes(x = YEAR, y = median_size_mm)) +
  geom_col() + facet_wrap(~SITE)

ggsave(here("figures", "lobsters-col.png"))

