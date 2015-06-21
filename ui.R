library(shiny)
shinyUI(
  
  pageWithSidebar(
    # Application title
    headerPanel("               MPG Prediction"),
    sidebarPanel(
      h3("INPUT", align = "center"),
      numericInput('cyl', 'Number of Cylinders', 4, min = 2, max = 10, step = 2),
      numericInput('hp', 'Number of Horse Power', as.integer(mean(mtcars$hp)), min = 0, max = 1000),
      radioButtons("am", "Tranmission Type:",
                   c("Automatic" = 0,
                     "Manual" = 1)),
      numericInput('wt', 'Weight (lb/1000)', mean(mtcars$wt)),
      submitButton('Submit')
    ),
    mainPanel(
      h3("OUTPUT", align = "center"),
      h3('Predicted MPG'),
      verbatimTextOutput("predict_MPG"),
      
      plotOutput("plot")
    )
  )
)
