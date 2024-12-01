
# Loading the Shiny package

library(shiny)
  
# Defining the user interface of the shiny application

shinyUI(fluidPage(
  titlePanel("Predicting Fertility from Agriculture and Education values"),
  h4("A standard measure of Fertility on a 0 to 100 scale is the considered outcome"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderAgri", "Percentage of males as farmers", 
                  0, 100, value = 50),
      sliderInput("sliderEdu", "Percentage of People with Education beyond primary school", 
                  0, 100, value = 20),
      submitButton("Submit"),
    ),
    mainPanel(
      h3("Predicting Fertility from Agriculture"),
      textOutput("pred1"),
      h3("Predicting Fertility from Agriculture and Education"),
      textOutput("pred2"),
    )
  )
))