library(tidyverse)
library(shiny)

## Define UI for application that draws a histogram
ui <- fluidPage(
   ## Application title
   titlePanel("Explore iris data"),
   ## Sidebar with widgets at left, the plot on right
   sidebarLayout(
      sidebarPanel(
         sliderInput("n",
                     "Number of observations:",
                     min = 1,
                     max = nrow(iris),
                     value = 50),
         ## x-variable
         selectInput("xVar", label = "X variable", 
                     choices = list("Sepal length" = "Sepal.Length",
                                    "Sepal width" = "Sepal.Width",
                                    "Petal length" = "Petal.Length",
                                    "Petal width" = "Petal.Width"),
                     selected = "Sepal.Length"),
         ## y-variable
         radioButtons("yVar", label = "Y variable", 
                      choices = list("Sepal length" = "Sepal.Length",
                                     "Sepal width" = "Sepal.Width",
                                     "Petal length" = "Petal.Length",
                                     "Petal width" = "Petal.Width"),
                      selected = "Sepal.Width"),
         ## jitter the points?
         checkboxInput("jitter", "Jitter", FALSE),
         ## how big dots?
         sliderInput("size",
                     "Point size:",
                     min = 0, max = 10, step=0.1,
                     value = 1)

      ),
      ## Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

## Define server logic required to draw a histogram
server <- function(input, output) {
   output$distPlot <- renderPlot({
      data <- iris %>%
         sample_n(input$n)
                           # select random subsample of size n
      p <- ggplot(data, aes_string(input$xVar, input$yVar,
                           # aes_string let's you to input indirect variable names
                                   col="Species")) +
         labs(title = paste(input$xVar, "vs", input$yVar))
      if(input$jitter) {
                           # if jitter, use geom_jitter
         p <- p + geom_jitter(size=input$size)
      } else {
                           # otherwise use geom_point
         p <- p + geom_point(size=input$size)
      }
      p
   })
}

## Run the application 
shinyApp(ui = ui, server = server)
