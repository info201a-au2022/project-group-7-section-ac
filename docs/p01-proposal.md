---
editor_options: 
  markdown: 
    wrap: 72
---

Earth and Food \# Climate Change and Our Food \#### Logan Winstel, Darin
Nguyen, Rohith Sarma \#### INFO-201: Technical Foundations of
Informatics - The Information School - University of Washington \####
Autumn 2022 \## Abstract\
Natural disasters can be devastating for a country. There are numerous
types of natural disasters. They can range from earthquakes to droughts
to fires, and everything in between. We feel that it's important to
understand and recognize which types of natural disasters occur most in
a country and identify which areas of a country do these disasters tend
to happen the most. To address this question, we will wrangling datasets
and creating visualizations to showcase this problem.

## Keywords

Natural disaster, Environment, Safety, Health, Location, Frequency,
Costs

## Introduction

Our project focuses on natural disasters in the United States. The
project involves a shiny app that has different types of interactable
graphs. The graphs showcase what natural disasters have historically
occurred the most in the United States, and what states have
historically been the most vulnerable to these natural disasters. We use
R to code the website and create different graphs and interactable menu
items to showcase this information. This helps us identify the natural
disasters that are the most prevalent in this country as well as what
individual states are the most vulnerable to certain natural disasters.

## Problem Domain (needs three citations and recommends a figure)

#### Project Framing

Our project will include creating a website that will have links to take
you to different pages within the website which will then have different
types of interactable graphs. The graphs will contain different effects
natural disasters have on the world such as crop production, climate
change, and malnutrition. \#### Human Values Two important human values
regarding natural disasters would be safety and environmental stability.
Natural disasters such as earthquakes, tornados, mudslides, and tsunamis
have all caused infrastructural damage, injuries, and deaths over time.
It's important to understand what actions we can take to best protect
ourselves in these situations. Environmental stability is another human
value that's important because natural disasters can have severe impacts
across the globe. For example, earthquakes, tornados, and tsunamis can
all negatively impact things livelihood.

#### Direct and Indirect Stakeholders

A direct stakeholder when it comes to this project focused on natural
disasters would be an environmental scientist who uses the data we have
organized in order to gain intel and then use it for decisions made in
the future. An indirect stakeholder regarding natural disasters would be
people/communities who are informed by government officials or
environmental scientists on whether to relocate or take safety
precautions in order to prepare for oncoming disasters.

#### Possible Harms and Benefits

The only true harm we see with our project is if the data we collect is
inaccurate since it would lead to people making wrong decisions and
interpretations. There are many benefits to our project. People would be
more informed about safety when it comes to natural disasters. People
would be more informed about what disasters occur the most and in what
areas they occur the most. Knowledge is key and we believe this project
could help many realize the hazards we face and how we can be better
prepared to deal with them in the future. This information could help to
start a political movement in order to address important topics such as
having better emergency procedures in certain locations and safer
infrastructure developments.

## Research Questions

Our first research question is "What natural disasters occur the most in
the United States?". This is important because there are numerous types
of natural disasters but not many people in the United States are aware
of the other disasters that occur outside of the area they live in. Many
people think that the disasters the area they live in are most familiar
with, are the disasters that are the most prevalent in the country. Our
goal is to educate people on how that could vary depending on where one
lives.

Our second question is "Where do these natural disasters occur the
most?" We came to this question because we were trying to figure out
what dangerous disasters can happen near us and if there has been any
record of it. Natural disasters do not come in any orderly manner so we
were thinking of which states have the highest chance of having a
natural disaster based on historical clues such as the datasets.

Our last research question is "What natural disasters cost the most for
repairs?" We were curious about this question because we found a dataset
that provided the amount of money that went into repairs after the
natural disasters struck. We think it would be interesting to see which
disasters cost the most money to recover from and in turn, this will
help us answer the question of "which disasters are the most dangerous?"
Perhaps not meaning dangerous in the sense that they are the deadliest,
but dangerous for the economy.

## The Dataset

Our dataset allows us to answer our research questions by taking years
of natural disasters and climate change and comparing them with
information on crop production, global food prices, and malnutrition.

| Name                       | Observations (Rows) | Variables (Columns) |
|----------------------------|---------------------|---------------------|
| Crop Production            | 20565               | 7                   |
| Global Food Prices by Year | 390                 | 7                   |
| Malnutrition Estimates     | 923                 | 19                  |

<https://www.kaggle.com/datasets/thedevastator/food-prices-year-by-year>

<https://www.kaggle.com/datasets/ruchi798/malnutrition-across-the-globe>

<https://www.kaggle.com/datasets/thedevastator/the-relationship-between-crop-production-and-cli>

The data files come from two creators on Kaggle. The first is user who
goes by the name The Devastator and the second is a graduate student
named Ruchi Bhatia. All of the datasets are actively being updated,
except one which was collected from 2010 to 2016. It seems as though the
purpose was solely to practice work with datasets. I obtained the data
by browsing data sets that fit our interest on Kaggle.

## Expected Limitations

Implications for people who choose to use our website will be that they
will be able to look at the data and create ideas for what to do if a
certain natural disaster happens. It will also assist them in trying to
focus on a certain disaster over another. Using our graphs and data,
they will be able to dictate which disasters they should create policies
for a designer on how to create buildings in the area for a certain type
of disaster if they are more prone to it. We think our graphs and data
will help to create a sense of urgency and preparation needed for
certain groups of individuals.

## Limitations

Our limitations consist of any coding that we may not learn how to do
over the course of the quarter. Limitations will also be if we cannot
find any data sets to support our research questions well enough. For
example, if there is something we have not learned to code in, then we
would not be able to add it to the website despite our understanding and
ideas for the topic. This will limit us to only create what we know how
to create in terms of the website and the graphs.

## Findings
Our first research question was "what disasters have been declared the most in each state in the US?" To answer this, we are not going to go through all 50 states but we were able to get the answers from the graph that we have created. With the graph, it is possible to filter each and every state so that we can see which disasters have occurred in each state. For some states, it could be storms and in other states it could be floods. It is all dependent on location and situation but it would simply take too long to list out which is the top disaster for each and every state.

Our second research question is "what disasters have been declared the most around the globe?" This is also another question that we can see through the graphs that we have created. Again, it is simply too much to list out the countries and which natural disasters have been declared the most in each and every one. However, we can say that there is not one specific disaster that is dominant across the globe in that every country has different disasters that are the top declared and each country has a different amount whereas some may be solely at the top and some may have one or more disasters at the top of their list. 

## Discussion
While doing the project we have figured out a lot of new things about our topic. The importance of our data is that it will be able to be used for various things. With this project we have learned that there are a lot of disasters and that based on our data, the amount of disaster does not vary based on location. Of course we think location has a factor in the types of disasters but in terms of raw statistical data, the amount of disasters that happen is not patterned and we could not find a pattern for location and amount of disasters declared. In our summary takeaways page on the shiny app, we can see that the state of Colorado has many more disasters than that of the state of Alaska. This comes to show that the location of a state does not matter when it comes to natural disasters. There is no way we can predict which disasters will happen where with this data but there is a chance that someone who is viewing our website will be able to detect the risk factor of each state to see which states are safer from disasters than others. 

## Conclusion
In conclusion, natural disasters are random. There is no way to detect if a natural disaster will come solely looking at the graphs and data of this project. There is however a way to detect risk level of each state in the United States as well as countries given the data that we have worked with. With this project, we think that a key takeaway should be that the amount of disasters that happen are not patterned but the type of disaster itself would vary from location to location. We would like our audience to leave knowing that the data in this project is nothing professional and people should not take it as official knowledge that is going to benefit them. We have tried our very best to do what we could to the best of our abilities and there are in fact some things to learn from the data as mentioned before. 

## Acknowledgments

## References

Henderson, J. D. R. by E. (2021, November 26). Investigating the impact
of disasters on Food and Agriculture. News-Medical.net. Retrieved
October 30, 2022, from
<https://www.azolifesciences.com/article/Investigating-the-Impact-of-Disasters-on-Food-and-Agriculture.aspx>

Hunger in emergencies - food insecurity in crisis settings. CARE. (2021,
April 2). Retrieved October 30, 2022, from
<https://www.care.org/our-work/disaster-response/hunger-in-emergencies/#>:\~:text=Hunger%20and%20malnutrition%20are%20often,flee%20their%20homes%20and%20livelihoods.

Tirivangasi, H. M. (2018, May 3). Regional disaster risk management
strategies for food security: Probing Southern African development
community channels for influencing national policy. Jamba
(Potchefstroom, South Africa). Retrieved October 30, 2022, from
<https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6014128/#>:\~:text=Consequently%2C%20this%20has%20an%20impact,put%20food%20security%20at%20risk.
\## Questions Is there anything we need to know or add to this
presentation to have a better project outcome?

How can I validate data from Kaggle?

What information needs to be included for project framing?
