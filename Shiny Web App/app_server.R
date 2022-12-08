#loading libraries

library(shiny)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(plotly)

#loading datasets

natural_disaster_declarations <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Natural_Disaster_declaration.csv")
billion_dollar_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Billion_Dollar_Weather_and_Climate_Disasters_Events_Aug_2021.csv")
new_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/1970-2021_DISASTERS.xlsx%20-%20emdat%20data.csv")
    
#Server function that creates everything

server <- function(input, output) {
  
  #Image For Home Page 
  output$home_page <- renderImage({
    list(src = "natural_disasters_img.png",
         width = "100%",
         height = 350)
  },deleteFile = F)
  
  #Chart1
  #Makes table of different disasters in each state, and total occurrences
  agg_tbl <- natural_disaster_declarations %>%
    group_by(State, Disaster.Type) %>%
    summarise(Occurences = n())
  
  #Uses state table to make bar chart
  output$selectState <- renderUI({
    selectInput("States", "Choose State", choices = unique(agg_tbl$State))
  })
  barplot <- reactive({
    chartdata <- agg_tbl %>%
      filter(State %in% input$States)
    chartdata1 <- chartdata %>%
      arrange((Occurences), .by_group = TRUE)
    ggplot(chartdata1, aes(x = reorder(Disaster.Type,-Occurences), y = Occurences, color = Disaster.Type, fill = Disaster.Type)) +
      geom_col(width = 1) +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      labs(
        x = "Types of Natural Disasters",
        y = "Declarations",
        title = "Declared Disasters by U.S State/Territory")
  })
  output$barchart <- renderPlotly({
    barplot()
  }) 
  
  #Chart2
  #Makes table of different disasters in each country, and total occurrences
  agg_tbl3 <- new_dataset %>%
    group_by(Country, Disaster.Type) %>%
    summarise(Occurences = n())
  
  #Uses country table to make bar chart
  output$selectCountry <- renderUI({
    selectInput("Countries", "Choose Country", choices = unique(agg_tbl3$Country))
  })
  barplot3 <- reactive({
    chartdata3 <- agg_tbl3 %>%
      filter(Country %in% input$Countries)
    chartdata4 <- chartdata3 %>%
      arrange((Occurences), .by_group = TRUE)
    ggplot(chartdata3, aes(x = reorder(Disaster.Type,-Occurences), y = Occurences)) +
      geom_col(aes(color = Disaster.Type, fill = Disaster.Type)) + 
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      labs(
        x = "Different Disaster Types",
        y = "Occurences",
        title = "Declared Disasters By Each Country")
  })
  output$barchart3 <- renderPlotly({
    barplot3()
  })
  
  #Chart3
  #Makes table of each disaster in Washington State counties and total occurrences
  agg_tblWA <- natural_disaster_declarations %>%
    group_by(Declaration.Date, Disaster.Type, State) %>%
    filter("WA" %in% State) %>%
    summarise(Occurences = n())
  
  #Uses county table to create scatter plot
  output$selectWA <- renderUI({
    selectInput("Disaster_Types", "Choose Disaster", choices = unique(agg_tblWA$Disaster.Type))
  })
  barplot5 <- reactive({
    chartdataWA <- agg_tblWA %>%
      filter(Disaster.Type %in% input$Disaster_Types)
    ggplot(chartdataWA, aes(x = Declaration.Date, y = Occurences, color = Disaster.Type)) +
      geom_point() + 
      theme(axis.text.x = element_text(angle = 30, vjust = -1, hjust = 1)) +
      labs(x = "Dates", y = "Number of Declarations", title = "Declarations In Washington Counties Since 1953")
  })
  output$barchart5 <- renderPlotly({
    barplot5()
  })
}

