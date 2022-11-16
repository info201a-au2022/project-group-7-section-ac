library(tidyverse)
library(dplyr)
library(ggplot2)

usa_natural_disasters <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Natural_Disaster_declaration.csv")

states_disaster <- usa_natural_disasters$State

num_alabama <- sum(str_detect(states_disaster, "AL", negate = FALSE))

num_alaska <- sum(str_detect(states_disaster, "AK", negate = FALSE))

num_arizona <- sum(str_detect(states_disaster, "AZ", negate = FALSE))

num_arkansas <- sum(str_detect(states_disaster, "AR", negate = FALSE))

num_california <- sum(str_detect(states_disaster, "CA", negate = FALSE))

num_colorado <- sum(str_detect(states_disaster, "CO", negate = FALSE))

num_connecticut <- sum(str_detect(states_disaster, "CT", negate = FALSE))

num_delaware <- sum(str_detect(states_disaster, "DE", negate = FALSE))

num_florida <- sum(str_detect(states_disaster, "FL", negate = FALSE))

num_georgia <- sum(str_detect(states_disaster, "GA", negate = FALSE))

num_hawaii <- sum(str_detect(states_disaster, "HI", negate = FALSE))

num_idaho <- sum(str_detect(states_disaster, "ID", negate = FALSE))

num_illinois <- sum(str_detect(states_disaster, "IL", negate = FALSE))

num_indiana <- sum(str_detect(states_disaster, "IN", negate = FALSE))

num_iowa <- sum(str_detect(states_disaster, "IA", negate = FALSE))

num_kansas <- sum(str_detect(states_disaster, "KS", negate = FALSE))

num_kentucky <- sum(str_detect(states_disaster, "KY", negate = FALSE))

num_louisiana <- sum(str_detect(states_disaster, "LA", negate = FALSE))

num_maine <- sum(str_detect(states_disaster, "ME", negate = FALSE))

num_maryland <- sum(str_detect(states_disaster, "MD", negate = FALSE))

num_massachusetts <- sum(str_detect(states_disaster, "MA", negate = FALSE))

num_michigan <- sum(str_detect(states_disaster, "MI", negate = FALSE))

num_minnesota <- sum(str_detect(states_disaster, "MN", negate = FALSE))

num_mississippi <- sum(str_detect(states_disaster, "MS", negate = FALSE))

num_missouri <- sum(str_detect(states_disaster, "MO", negate = FALSE))

num_montana <- sum(str_detect(states_disaster, "MT", negate = FALSE))

num_nebraska <- sum(str_detect(states_disaster, "NE", negate = FALSE))

num_nevada <- sum(str_detect(states_disaster, "NV", negate = FALSE))

num_new_hampshire <- sum(str_detect(states_disaster, "NH", negate = FALSE))

num_new_jersey <- sum(str_detect(states_disaster, "NJ", negate = FALSE))

num_new_mexico <- sum(str_detect(states_disaster, "NM", negate = FALSE))

num_new_york <- sum(str_detect(states_disaster, "NY", negate = FALSE))

num_north_caroline <- sum(str_detect(states_disaster, "NC", negate = FALSE))

num_north_dakota <- sum(str_detect(states_disaster, "ND", negate = FALSE))

num_ohio <- sum(str_detect(states_disaster, "OH", negate = FALSE))

num_oklahoma <- sum(str_detect(states_disaster, "OK", negate = FALSE))

num_oregon <- sum(str_detect(states_disaster, "OR", negate = FALSE))

num_pennsylvania <- sum(str_detect(states_disaster, "PA", negate = FALSE))

num_rhode_island <- sum(str_detect(states_disaster, "RI", negate = FALSE))

num_south_carolina <- sum(str_detect(states_disaster, "SC", negate = FALSE))

num_south_dakota <- sum(str_detect(states_disaster, "SD", negate = FALSE))

num_tennessee <- sum((str_detect(states_disaster, "TN", negate = FALSE))) 

num_texas <- sum(str_detect(states_disaster, "TX", negate = FALSE))

num_utah <- sum(str_detect(states_disaster, "UT", negate = FALSE))

num_vermont <- sum(str_detect(states_disaster, "VT", negate = FALSE))

num_virginia <- sum(str_detect(states_disaster, "VA", negate = FALSE))

num_washington <- sum(str_detect(states_disaster, "WA", negate = FALSE))

num_west_virginia <- sum(str_detect(states_disaster, "WV", negate = FALSE))

num_wisconsin <- sum(str_detect(states_disaster, "WI", negate = FALSE))

num_wyoming <- sum(str_detect(states_disaster, "WY", negate = FALSE))

top7 <- data.frame(
  States = c("Texas", "Missouri", "Kentucky", "Virginia", "Oklahoma", "Iowa", "Georgia"),
  Disasters = c(3842, 2263, 2026, 1982, 1882, 1471, 1406 )
)
head(top7)

p<-ggplot(data=top7, aes(x = States, y = Disasters)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal() +
  labs(x = "States", y = "Amount of Disasters", title = "Top 7 Most Disastrous States")
p








































