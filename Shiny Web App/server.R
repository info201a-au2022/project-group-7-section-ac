#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(plotly)

natural_disaster_declarations <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Natural_Disaster_declaration.csv")

billion_dollar_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Billion_Dollar_Weather_and_Climate_Disasters_Events_Aug_2021.csv")

# Define server logic required to draw a histogram
# shinyServer(function(input, output) {

# Makes table of each disaster in a state, and total occurences
agg_tbl <- natural_disaster_declarations %>%
  group_by(State, Disaster.Type) %>%
  summarise(Occurences = n())

#Makes Chart 1
server <- function(input, output) {
  
  output$selectState <- renderUI({
    selectInput("States", "Choose State", choices = unique(agg_tbl$State))
  })
  
  barplot <- reactive({
    chartdata <- agg_tbl %>%
      filter(State %in% input$States)
    
    ggplot(chartdata, aes(x = Disaster.Type, y = Occurences)) +
      geom_col(aes(color = State)) + 
      scale_x_discrete(guide = guide_axis(n.dodge = 3))
    labs(
      x = "Different Disaster Types",
      y = "Occurences",
      title = "Disasters in Each State")
  })
  
  output$barchart <- renderPlotly({
    barplot()
  })
}

# Creates table of disaster type and date they were declared
agg_tbl2 <- natural_disaster_declarations %>%
  group_by(Disaster.Type, Declaration.Date) %>%
  summarise(Frequency = n()) 

#Chart 2
server <- function(input, output) {
  
  output$selectDisaster.Type <- renderUI({
    selectInput("Disaster_Type", "Choose Disaster", choices = unique(agg_tbl2$Disaster.Type))
  })
  
  barplot2 <- reactive({
    chartdata2 <- agg_tbl2 %>%
      filter(Disaster.Type %in% input$Disaster_Type)
    
    ggplot(chartdata2, aes(x = Declaration.Date, y = Frequency)) +
      geom_col(aes(color = Disaster.Type)) + 
      scale_x_discrete(guide = guide_axis(n.dodge = 3))
    labs(
      x = "Year",
      y = "Frequencies",
      title = "Disasters in Each Year")
  })
  
  output$barchart <- renderPlotly({
    barplot2()
  })
}

