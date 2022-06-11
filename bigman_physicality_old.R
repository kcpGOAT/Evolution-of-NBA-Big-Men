library(tidyverse)
library(ggthemes)

# Note: only limited sample of players, and it only goes to 2018

## HEIGHT
player_data <- player_physical %>%
  separate(height, c("feet", "inches"), sep = "-")
player_data$feet <- as.numeric(player_data$feet)
player_data$inches <- as.numeric(player_data$inches)
player_data$height <- 12 * player_data$feet + player_data$inches
player_data <- player_data %>%
  select(name, season, height, colnames(player_data))

player_height <- player_data %>%
  filter(position %in% c("F-C", "C-F", "C")) %>%
  group_by(season, name) %>% 
  group_by(season) %>%
  summarize(height = mean(height))
  
## WEIGHT
player_weight <- player_data %>%
  filter(position %in% c("F-C")) %>%
  group_by(season, name) %>%
  group_by(season) %>%
  summarize(weight = mean(weight))
