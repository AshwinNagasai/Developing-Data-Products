# Loading the shiny package

library(shiny)
  
# Loading the data  

data(swiss)  

# Defining the server-logic of the shiny application

shinyServer(function(input, output) {
  model1 <- lm(Fertility ~ Agriculture, data = swiss)
  model2 <- lm(Fertility ~ Agriculture, Education, data = swiss)

  model1pred <- reactive({
    Agri_Input <- input$sliderAgri
    predict(model1, newdata = data.frame(Agriculture = Agri_Input))
  })
  
  model2pred <- reactive({
    Edu_Input <- input$sliderEdu
    predict(model2, newdata = data.frame(Agriculture = Edu_Input))
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
  
  output$pred2 <- renderText({
    model2pred()
  })
})