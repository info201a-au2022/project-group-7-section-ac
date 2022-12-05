#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

national_disaster_declaration <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Natural_Disaster_declaration.csv")
billion_dollar_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/Billion_Dollar_Weather_and_Climate_Disasters_Events_Aug_2021.csv")
new_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-ac/main/data/1970-2021_DISASTERS.xlsx%20-%20emdat%20data.csv")

library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)

#Inputs for the UI
x_var <- colnames(national_disaster_declaration)

y_var <- colnames(national_disaster_declaration)

y_var_start <- national_disaster_declaration %>% 
  group_by(Disaster.Type) %>% 
  summarize(count=n())


#X Input
x_values <- selectInput(
  "x_variable",
  label = "X Variable",
  selected = "Disaster.type",
  choices = x_var
)

#Y Input
y_values <- selectInput(
  "y_variable",
  label = "Y Variable",
  selected = "count",
  choices = y_var
)

#Colors
colors <- selectInput(
  "colors",
  label = "Color of Graph",
  choices = list("Blue" = "blue", "Green" = "green", "Orange" = "orange", "Black" = "black")
)
#Size Slider
sizes <- sliderInput(
  "size",
  label = "Size of Points on the Graph", value = 5, max = 10, min = 1
)


#Introduction Page

first_page <- tabPanel(
  "Project Overview",
  imageOutput("home_page"),
  h1("About the Project"),
  h2("Introduction to the Project"),
  br(),
  p("Natural disasters can ruin lives. This is why something needs to be done about detecting natural disasters to see which ones can be the most costly. Our project focuses on natural disasters in the United States. The project involves a shiny app that has different types of interactable graphs. The graphs showcase what natural disasters have historically occurred the most in the United States, and what states have historically been the most vulnerable to these natural disasters. We use R to code the website and create different graphs and interactable menu items to showcase this information. This helps us identify the natural disasters that are the most prevalent in this country as well as what individual states are the most vulnerable to certain natural disasters."),
  br(),
  h2("Abstract"),
  p("Natural disasters can be devastating for a country. There are numerous types of natural disasters. They can range from earthquakes to droughts to fires, and everything in between. We feel that it’s important to understand and recognize which types of natural disasters occur most in a country and identify which areas of a country do these disasters tend to happen the most. To address this question, we will wrangling datasets and creating visualizations to showcase this problem."),
  h2("Research Questions"),
  br(),
  p("Our first research question is “What natural disasters occur the most in the United States?”. This is important because there are numerous types of natural disasters but not many people in the United States are aware of the other disasters that occur outside of the area they live in. Many people think that the disasters the area they live in are most familiar with, are the disasters that are the most prevalent in the country. Our goal is to educate people on how that could vary depending on where one lives."),
  p("Our second question is “Where do these natural disasters occur the most?” We came to this question because we were trying to figure out what dangerous disasters can happen near us and if there has been any record of it. Natural disasters do not come in any orderly manner so we were thinking of which states have the highest chance of having a natural disaster based on historical clues such as the datasets."),
  p("Our last research question is “What natural disasters cost the most for repairs?” We were curious about this question because we found a dataset that provided the amount of money that went into repairs after the natural disasters struck. We think it would be interesting to see which disasters cost the most money to recover from and in turn, this will help us answer the question of “which disasters are the most dangerous?” Perhaps not meaning dangerous in the sense that they are the deadliest, but dangerous for the economy.")
)

#2nd Page, First graph of choosing x, y 

second_page <- tabPanel(
  titlePanel("Natural Declarations"),
  h1("Natural Disaster Declarations"),
  x_values,
  y_values,
  colors,
  sizes,
  plotlyOutput("page_two")
)

#3rd page, state VS times happen, and type VS time happen, 2 graphs

third_page <- tabPanel(
  "Disaster Type Occurances",
  mainPanel(
    titlePanel("Disaster Type Occurances"),
      sidebarPanel(
        uiOutput("selectState")
      ),
      mainPanel(
        plotlyOutput("barchart")
      )
    )
  )

#4th page, graph of costs

fourth_page <- tabPanel(
  "Disaster Types Dropdown",
  mainPanel(
    titlePanel("Disaster Types Dropdown"),
    sidebarPanel(
      uiOutput("selectCountry")
    ),
    mainPanel(
      plotlyOutput("barchart3")
    )
  )
)


ui <- navbarPage(
  "Natural Disasters Declarations",
  first_page,
  third_page,
  fourth_page
)


