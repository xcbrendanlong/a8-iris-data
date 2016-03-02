library(rsconnect)
library(shiny)
library(plotly)
library(dplyr)

# Create shinyServer function that takes in input and output info
shinyServer(function(input, output) {

# Filter data to specific flower species
  flower_type <- reactive ({
    flower_type <- filter(iris, Species == toString(input$flower)) 
  })

# Create renderPlotly function
  output$scatter <- renderPlotly({

# Create plot_ly scatter plot based on user inputs
    plot_ly(data = flower_type(),
            x = eval(parse(text = input$x_axis)), 
            y = eval(parse(text = input$y_axis)),
            mode = "markers"
    ) %>%

# Rename title and axis titles
            layout (
              title='Flower Sizes',
              xaxis = list(title = toString(input$x_axis)),
              yaxis = list(title = toString(input$y_axis))
    
            )
  })
})

