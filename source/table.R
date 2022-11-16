library(tidyverse)
library(dplyr)
library(ggplot2)

disaster_details <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Billion-Dollar%20Weather%20and%20Climate%20Disasters%20Events%20Aug%202021.csv")
usa_natural_disasters <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Natural_Disaster_declaration.csv")

usa_table <- usa_natural_disasters %>% 
  group_by(State) %>% 
  summarize(max_date = max(Declaration.Date))

print(usa_table, n=59)