### Exercise 2 ###

library(shiny)

## Check out shiny widgets
## http://shiny.rstudio.com/gallery/widget-gallery.html 

## Create a shiny server that creates a scatterplot. 

## It should takes as an input the number of observations, and a color
## It should return a rendered plot
shinyServer(function(input, output) {
  # You can access the value of the widget with input$select, e.g.
  output$scatter <- renderPlot({ 
    x <- rnorm(input$num)
    y <- rnorm(input$num)
    plot(x,y, col=input$color)
  })
})
