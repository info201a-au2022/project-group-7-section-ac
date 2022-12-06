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

new_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/1970-2021_DISASTERS.xlsx%20-%20emdat%20data.csv")

# Define server logic required to draw a histogram
# shinyServer(function(input, output) {

# Makes table of each disaster in a state, and total occurences
agg_tbl <- natural_disaster_declarations %>%
  group_by(State, Disaster.Type) %>%
  summarise(Occurences = n())
    

#Makes Charts
server <- function(input, output) {
  
  output$page_two <- renderPlotly({
    title <- paste0("National Disaster Dataset Comparison", input$x_variable, "VS", input$y_variable)
    scatterplot <- ggplot(natural_disaster_declarations) +
      geom_point(mapping = aes_string(x = input$x_variable, y = input$y_variable),
                 size = input$size,
                 color = input$colors) +
      labs(x = input$x_variable, y = input$y_variable, title = title)
    scatterplot
  })
  
# Chart1  
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
  
#Image For Home Page 
  output$home_page <- renderImage({
    list(src = "natural_disasters_img.png",
         width = "100%",
         height = 350)
  },deleteFile = F)

#Chart2
  agg_tbl2 <- natural_disaster_declarations %>%
    group_by(Disaster.Type, Declaration.Date) %>%
    summarise(Frequency = n())
  
  output$selectDisaster_Type <- renderUI({
    selectInput("DisasterType", "Choose Disaster", choices = unique(agg_tbl2$Disaster.Type))
  })
  # Creates table of disaster type and date they were declared
  
  barplot2 <- reactive({
    chartdata2 <- agg_tbl2 %>%
      filter(Disaster.Type %in% input$DisasterType)
    
    ggplot(chartdata2, aes(x = Declaration.Date, y = Frequency)) +
      geom_col(aes(color = Disaster.Type)) + 
      labs(
        x = "Year",
        y = "Frequencies",
        title = "Disasters in Each Year")
  })
  
  output$testing_chart <- renderPlotly({
    barplot2()
  })
  
  #Creates new table of countries
  agg_tbl3 <- new_dataset %>%
    group_by(Country, Disaster.Type) %>%
    summarise(Occurences = n())
  
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
}

