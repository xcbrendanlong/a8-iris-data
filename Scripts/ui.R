library(shiny)
library(plotly)
library(dplyr)
# Define UI for application that draws a chart analyzing flower sizes
shinyUI(
  
# Create a fluid page layout
  fluidPage(
    titlePanel("Flower Analysis"), 
    
# Create sidebar panel
    sidebarPanel(
      
# Dropdown offering ability to choose what goes on the x axis
      selectInput("x_axis", label = h4("Select x axis"), 
                  choices = list("Sepal Length" = "Sepal.Length", "Sepal Width" = "Sepal.Width", "Petal Length" = "Petal.Length", "Petal Width" = "Petal.Width"), 
                  selected = 1),
      
# Dropdown offering ability to choose what goes on the y axis
      selectInput("y_axis", label = h4("Select y axis"), 
                  choices = list("Sepal Length" = "Sepal.Length", "Sepal Width" = "Sepal.Width", "Petal Length" = "Petal.Length", "Petal Width" = "Petal.Width"), 
                  selected = 1),

# Button selection allowing user to pick a button
      radioButtons("flower", label = h3("Select Flower Species"),
                   choices = list("versicolor", "virginica", "setosa"),
                   selected = 1)
    ),

# Create a mainPanel
    mainPanel(
      
# Plot the output with the name "histogram"
      plotlyOutput("scatter")
    )
  )
)
