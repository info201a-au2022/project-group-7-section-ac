library(tidyverse)
library(dplyr)
library(ggplot2)

usa_natural_disasters <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Natural_Disaster_declaration.csv")
disaster_details <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Billion-Dollar%20Weather%20and%20Climate%20Disasters%20Events%20Aug%202021.csv")


get_max_deaths <- function(){
  max_deaths <- disaster_details %>%
  filter(Deaths == max(Deaths, na.rm = T)) %>%
  select(Deaths) %>% 
  pull(Deaths)
  return(max_deaths)
}


event_max_deaths <- function(){
  type_max_deaths <- disaster_details %>% 
  filter(Deaths == max(Deaths, na.rm=TRUE)) %>% 
  select(Event) %>% 
  pull(Event)
  return(type_max_deaths)
}


get_most_money_event <- function() {
  most_money_spent_event <- disaster_details %>% 
  select(Event,CPI.Adjusted.Estimated.Cost..In.Billions.) %>% 
  filter(CPI.Adjusted.Estimated.Cost..In.Billions. == max(CPI.Adjusted.Estimated.Cost..In.Billions., na.rm=T)) %>% 
  pull(Event)
  return(most_money_spent_event)
}

usa_nd <- data.frame(
  Disasters = c("Flood", "Hurricane", "Snow", "Fire", "Ice", "Tornado", "Drought"),
  Declarations = c(9317, 8764, 3565, 2647, 1970, 1412, 1292 )
)
head(usa_nd)

bp <- ggplot(usa_nd, aes(x = "", y = Declarations, fill = Disasters))+ 
  geom_bar(width = 1, stat = "identity",position = "stack") +
  labs(x = "", y = "Number of Declarations", title = "Top 7 Declared Disasters in the US Since 1953")
bp

pie <- bp + coord_polar("y", start = 0)
pie


