library(tidyverse)
library(dplyr)

usa_natural_disasters <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Natural_Disaster_declaration.csv")

type_of_disaster <- usa_natural_disasters$Disaster.Type

num_drought <- sum(str_detect(type_of_disaster, "Drought", negate = FALSE))

num_tornado <- sum(str_detect(type_of_disaster, "Tornado", negate = FALSE))

num_flood <- sum(str_detect(type_of_disaster, "Flood", negate = FALSE))

num_fire <- sum(str_detect(type_of_disaster, "Fire", negate = FALSE))

num_earthquake <- sum(str_detect(type_of_disaster, "Earthquake", negate = FALSE))

num_other <- sum(str_detect(type_of_disaster, "Other", negate = FALSE))

num_hurricane <- sum(str_detect(type_of_disaster, "Hurricane", negate = FALSE))

num_volcano <- sum(str_detect(type_of_disaster, "Volcano", negate = FALSE))

num_storm <- sum(str_detect(type_of_disaster, "storm", negate = FALSE))

num_chemical <- sum(str_detect(type_of_disaster, "Chemical", negate = FALSE))

num_typhoon <- sum(str_detect(type_of_disaster, "Typhoon", negate = FALSE))

num_dam_levee_break <- sum(str_detect(type_of_disaster, "Dam/Levee Break", negate = FALSE))

num_snow <- sum(str_detect(type_of_disaster, "Snow", negate = FALSE))

num_ice <- sum(str_detect(type_of_disaster, "Ice", negate = FALSE))

num_winter <- sum(str_detect(type_of_disaster, "Winter", negate = FALSE))

num_water <- sum(str_detect(type_of_disaster, "Water", negate = FALSE))

num_mud_landslide <- sum(str_detect(type_of_disaster, "Mud/Landslide", negate = FALSE))

num_human_cause <- sum(str_detect(type_of_disaster, "Human Cause", negate = FALSE))

num_terrorism <- sum(str_detect(type_of_disaster, "Terrorism", negate = FALSE))

num_tsunami <- sum(str_detect(type_of_disaster, "Tsunami", negate = FALSE))

library(ggplot2)

install.packages("plotrix")
library(plotrix)

slices <- c(1292, 1412, 1970, 2647, 3565, 8764, 9317)
lbls <- c("Drought", "Tornado", "Ice", "Fire", "Snow", "Hurricane", "Flood")
pie3D(slices, labels = lbls,explode = 0.1,
      main = "Pie Chart of Top 7 Declared Natural Disasters since 1953")
  o + scale_fill_distiller(pallete = "Blues")
  

 







