library(tidyverse)
library(dplyr)
library(ggplot2)

usa_natural_disasters <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Natural_Disaster_declaration.csv")

type_of_disaster <- usa_natural_disasters$Disaster.Type

#Total number of drought disasters 
num_drought <- sum(str_detect(type_of_disaster, "Drought", negate = FALSE))

#Total number of tornado disasters 
num_tornado <- sum(str_detect(type_of_disaster, "Tornado", negate = FALSE))

#Total number of flood disasters
num_flood <- sum(str_detect(type_of_disaster, "Flood", negate = FALSE))

#Total number of fire disasters 
num_fire <- sum(str_detect(type_of_disaster, "Fire", negate = FALSE))

#Total number of earthquake disasters
num_earthquake <- sum(str_detect(type_of_disaster, "Earthquake", negate = FALSE))

#Total number of "other" disasters 
num_other <- sum(str_detect(type_of_disaster, "Other", negate = FALSE))

#Total number of hurricane disasters
num_hurricane <- sum(str_detect(type_of_disaster, "Hurricane", negate = FALSE))

#Total number of volcano disasters
num_volcano <- sum(str_detect(type_of_disaster, "Volcano", negate = FALSE))

#Total number of storm disasters
num_storm <- sum(str_detect(type_of_disaster, "storm", negate = FALSE))

#Total number of chemical disasters
num_chemical <- sum(str_detect(type_of_disaster, "Chemical", negate = FALSE))

#Total number of typhoon disasters
num_typhoon <- sum(str_detect(type_of_disaster, "Typhoon", negate = FALSE))

#Total number of dam/levee break disasters
num_dam_levee_break <- sum(str_detect(type_of_disaster, "Dam/Levee Break", negate = FALSE))

#Total number of snow disasters 
num_snow <- sum(str_detect(type_of_disaster, "Snow", negate = FALSE))

#Total number of ice disasters
num_ice <- sum(str_detect(type_of_disaster, "Ice", negate = FALSE))

#Total number of winter disasters
num_winter <- sum(str_detect(type_of_disaster, "Winter", negate = FALSE))

#Total number of water disasters 
num_water <- sum(str_detect(type_of_disaster, "Water", negate = FALSE))

#Total number of mud/landslide disasters
num_mud_landslide <- sum(str_detect(type_of_disaster, "Mud/Landslide", negate = FALSE))

#Total number of human caused disasters
num_human_cause <- sum(str_detect(type_of_disaster, "Human Cause", negate = FALSE))

#Total number of terrorist disasters 
num_terrorism <- sum(str_detect(type_of_disaster, "Terrorism", negate = FALSE))

#Total number of tsunmai disasters
num_tsunami <- sum(str_detect(type_of_disaster, "Tsunami", negate = FALSE))

usa_nd <- data.frame(
  Disasters = c("Flood", "Hurricane", "Snow", "Fire", "Ice", "Tornado", "Drought"),
  Declarations = c(9317, 8764, 3565, 2647, 1970, 1412, 1292 )
)
head(usa_nd)

bp <- ggplot(usa_nd, aes(x = "", y = Declarations, fill = Disasters))+ 
  geom_bar(width = 1, stat = "identity")
bp

pie <- bp + coord_polar("y", start = 0)
pie


 







