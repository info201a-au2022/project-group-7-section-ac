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
library(shinythemes)

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
  sidebarPanel(
    h1(strong("About Us")),
    hr(),
    h4("Rohith Sarma"),
    p("rsarma18@uw.edu"),
    br(),
    h4("Darin Nguyen"),
    p("dnguye0@uw.edu"),
    br()
  ),
  mainPanel(
  imageOutput("home_page"),
  h2(strong("INTRODUCTION")),
  br(),
  p("Natural disasters can ruin lives. This is why something needs to be done about detecting natural disasters to see which ones can be the most costly. Our project focuses on natural disasters in the United States. The project involves a shiny app that has different types of interactable graphs. The graphs showcase what natural disasters have historically occurred the most in the United States, and what states have historically been the most vulnerable to these natural disasters. We use R to code the website and create different graphs and interactable menu items to showcase this information. This helps us identify the natural disasters that are the most prevalent in this country as well as what individual states are the most vulnerable to certain natural disasters."),
  hr(),
  h2(strong("ABSTRACT")),
  p("Natural disasters are devastating. There are numerous types of natural disasters. They can range from earthquakes to droughts to fires, and everything in between. We feel that it’s important to identify which types of natural disasters occur most in countries around the world and which natural disasters occur most in states across America. To address this question, we will wrangling datasets and creating visualizations to showcase this problem."),
  hr(),
  h2(strong("RESEARCH QUESTIONS")),
  br(),
  p(strong("WHAT NATURAL DISASTERS HAVE BEEN DECLARED MOST IN EACH STATE IN AMERICA?")),
  p("This is important because there are numerous types of natural disasters but not many people in the United States are aware of the other disasters that occur outside of the area they live in. People are often familiar with the common disasters that occur in the state they live in but aren't aware of the disasters that occur in other states. Our goal is to educate people on how that could vary depending on where one lives."),
  br(),
  p(strong("WHAT NATURAL DISASTERS HAVE BEEN DECLARED MOST IN COUNTRIES ACROSS THE GLOBE?")),
  p("This expands on the idea of our first research question. It's important to recognize what disasters are most common in places hundreds and thousands of miles away from the United States."),
  br(),
  p(strong("WHAT NATURAL DISASTERS HAVE BEEN DECLARED THE MOST IN WASHINGTON BY COUNTY?")),
  p("This question is a little more specific than the rest of our questions. We wanted to do something that was localized because we think that there should be some data here that benefits us as Washington residents. "),
))

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
  "Declared Disasters Domestically",
  mainPanel(
    titlePanel("Declared Disasters In The USA Since 1953"),
      sidebarPanel(
        uiOutput("selectState")
      ),
      mainPanel(
        plotlyOutput("barchart", width = 700, height = 500),
        hr(),
        h3(strong("About the Graph")),
        p("This graph shows the different disasters that have been declared in each state since 1953. The dropdown menu allows you to choose which state you want to see statistics for, and then produces a bargraph that shows what disasters have been declared for that specific state since 1953. The graph is formatted so that it shows the highest to lowest amount of occurrences for each type of disaster.")
      )
    )
  )

#4th page, graph of costs

fourth_page <- tabPanel(
  "Declared Disasters Globally",
  mainPanel(
    titlePanel("Declared Disasters In The World Since 1970"),
    sidebarPanel(
      uiOutput("selectCountry")
    ),
    mainPanel(
      plotlyOutput("barchart3", width = 700, height = 500),
      hr(),
      h3(strong("About the Graph")),
      p("This graph shows the different disasters that have been declared in the world since 1970. The dropdown menu allows you to choose which country you want to see statistics for, and then produces a bargraph that shows what disasters have been declared for that specific country since 1970. The graph is formatted so that it shows the highest to lowest amount of occurrences for each type of disaster.")
    )
  )
)

fifth_page <- tabPanel(
  "Declared Disasters by WA Counties",
  mainPanel(
    titlePanel("Declared Disasters By Washington Counties Since 1953"),
    sidebarPanel(
      uiOutput("selectWA")
    ),
    mainPanel(
      plotlyOutput("barchart5", width = 900, height = 500),
      hr(),
      h3(strong("About the Graph")),
      p("This graph shows the different disasters that have been declared in Washington state counties since 1953. The dropdown menu allows you to pick the type of disaster you want to see statistics for, and then produces a bargraph showing the different amount of times that disaster has been declared in Washington counties as well since 1953.")
    )
  )
)
  
#Summary Page 
summary_page <- tabPanel(
  "Summary Page",
  mainPanel(
    h2(strong("Summary Takeaways")),
    p("The first thing we learned is that some states are hit by natural disasters much more often than other states. This comes to show with our first graph and that if clicked, something like Alaska will have much more declared disasters than something like Wyoming. This makes sense when you take into account location. The location, however, is not always the case. For a state like Colorado, which is located near the same area as Wyoming, it has many more disasters declared and can be compared to those states that are near water or are in an area that people think should have more disasters than others."),
    p("The second takeaway we have learned comes from our second chart. As we were testing and learning about the different countries, we realized that every country has one or two types of disaster that are much more prevalent than others. For example, if the statistics of the United States are filtered, we can see that there are many more storms compared to that of any other disaster with the jump being from about 600 to 100. This is different for Afghanistan though because when Afghanistan is filtered we can see that the top disaster is flood at 96 and then the other closest one is with an amount of 31. "),
    p("")
  )
)

#Report Page
report_page <- tabPanel(
  "Report Page",
  mainPanel(
    titlePanel("Report"),
    h3(strong("Key Words")),
    p("Natural disaster, Environment, Safety, Health, Location, Frequency"),
    hr(),
    h3(strong("Problem Domain")),
    h4("Project Framing"),
    p("Our project will include creating a website that will have links to take you to different pages within the website which will then have different types of interactable graphs. The graphs will contain different effects natural disasters have on the world such as crop production, climate change, and malnutrition.Two important human values regarding natural disasters would be safety and environmental stability. Natural disasters such as earthquakes, tornados, mudslides, and tsunamis have all caused infrastructural damage, injuries, and deaths over time. It's important to understand what actions we can take to best protect ourselves in these situations. Environmental stability is another human value that's important because natural disasters can have severe impacts across the globe. For example, earthquakes, tornados, and tsunamis can all negatively impact things livelihood."),
    h4("Direct and Indirect Stakeholders"),
    p("A direct stakeholder when it comes to this project focused on natural disasters would be an environmental scientist who uses the data we have organized in order to gain intel and then use it for decisions made in the future. An indirect stakeholder regarding natural disasters would be people/communities who are informed by government officials or environmental scientists on whether to relocate or take safety precautions in order to prepare for oncoming disasters."),
    h4("Possible Harms and Benefits"),
    p("The only true harm we see with our project is if the data we collect is inaccurate since it would lead to people making wrong decisions and interpretations. There are many benefits to our project. People would be more informed about safety when it comes to natural disasters. People would be more informed about what disasters occur the most and in what areas they occur the most. Knowledge is key and we believe this project could help many realize the hazards we face and how we can be better prepared to deal with them in the future. This information could help to start a political movement in order to address important topics such as having better emergency procedures in certain locations and safer infrastructure developments."),
    hr(),
    h3("The Datasets"),
    p("The datasets we have chosen to wrk with deal with declarations of all natural disasters ranging from 1970 to 2016. The datasets were found on kaggle and introduce a few different aspects that we have used for this project. Our next dataset was also found on kaggle and we used this dataset to filter out all of the different states as well as the types of disasters that have happened in the US."),
    hr(),
    h3("Expected Limitations"),
    p("Implications for people who choose to use our website will be that they will be able to look at the data and create ideas for what to do if a certain natural disaster happens. It will also assist them in trying to focus on a certain disaster over another. Using our graphs and data, they will be able to dictate which disasters they should create policies for a designer on how to create buildings in the area for a certain type of disaster if they are more prone to it. We think our graphs and data will help to create a sense of urgency and preparation needed for certain groups of individuals."),
    hr(),
    h3("Limitations"),
    p("Our limitations consist of any coding that we may not learn how to do over the course of the quarter. Limitations will also be if we cannot find any data sets to support our research questions well enough. For example, if there is something we have not learned to code in, then we would not be able to add it to the website despite our understanding and ideas for the topic. This will limit us to only create what we know how to create in terms of the website and the graphs."),
    hr(),
    
  )
)


ui <- navbarPage(
  theme = shinytheme("flatly"),
  "Natural Disasters Declarations",
  first_page,
  fourth_page,
  third_page,
  fifth_page,
  summary_page,
  report_page
)


