library(tidyverse)
library(readxl)
library(here)
library(skimr) 
library(kableExtra)
library(dplyr)
library(ggplot2)

setwd('C:/Users/nicol/OneDrive/Augustana College/3 year/Spring term/DATA 332/Data')
billing <- read_xlsx('Billing.xlsx')
patient <- read_xlsx('Patient.xlsx')
visit <- read_xlsx('Visit.xlsx')
kelp_abur <- read_xlsx('kelp_fronds.xlsx', sheet = 'abur')
fish <- read.csv('fish.csv')

#FILTERING!!!!!!!!!!

fish_garibaldi <- fish %>% 
  filter(common_name == "garibaldi")

fish_mohk <- fish %>% 
  filter(site == "mohk")

fish_over50 <- fish %>% 
  filter(total_count >= 50)

fish_3sp <- fish %>% 
  filter(common_name == "garibaldi" | 
           common_name == "blacksmith" | 
           common_name == "black surfperch")

fish_3sp <- fish %>% 
  filter(common_name %in% c("garibaldi", "blacksmith", "black surfperch"))

fish_gar_2016 <- fish %>% 
  filter(year == 2016 | common_name == "garibaldi")

aque_2018 <- fish %>% 
  filter(year == 2018, site == "aque")

fish_bl <- fish %>% 
  filter(str_detect(common_name, pattern = "black"))


#JOINING!!!!!!!!!!!
abur_kelp_fish <- kelp_abur %>% 
  full_join(fish, by = c("year", "site")) 

kelp_fish_left <- kelp_abur %>% 
  left_join(fish, by = c("year","site"))

kelp_fish_injoin <- kelp_abur %>% 
  inner_join(fish, by = c("year", "site"))

my_fish_join <- fish %>% 
  filter(year == 2017, site == "abur") %>% 
  left_join(kelp_abur, by = c("year", "site")) %>% 
  mutate(fish_per_frond = total_count / total_fronds)

my_fish_join %>% 
  kable() %>% 
  kable_styling(bootstrap_options = "striped", 
                full_width = FALSE)
