library(shiny)

# Loading all required libraries
library(sqldf)
library(tcltk)
library(plyr)
library(car)
library(lattice) 
attach(mtcars)
library(ggplot2)
library(vcd)
library(scatterplot3d)
library(plotly)

statechart <- function(){
  p3 <- ggplot(data = loanf, aes(x = State, fill = Loan_Type_Description)) +
    geom_bar(position = "dodge")
  ggplotly(p3, width = 840)
}

# Define server logic for random distribution application
shinyServer(function(input, output) {
  
  # Reactive expression to generate the requested distribution. This is 
  # called whenever the inputs change. The renderers defined 
  # below then all use the value computed from this expression
  
  
  # Generate a plot of the data. Also uses the inputs to build the 
  # plot label. Note that the dependencies on both the inputs and
  # the 'data' reactive expression are both tracked, and all expressions 
  # are called in the sequence implied by the dependency graph
  output$plot <- renderPlot({
    
    data <- switch(input$plotseln, 
                   "Option1 - iris$SepalLength" = 
                      plot(iris$Sepal.Length,iris$Sepal.Width),
                   
                   "Option1 - iris$PetalLength" = 
                      plot(iris$Petal.Length, iris$Petal.Width), 
                   # call to pre-defined function
                   
                   "Option3 - iris$SepalWidth" = 
                      plot(iris$Sepal.Width,iris$Sepal.Length)
    )
    
    print(p)
      
    })
    
   

  
  # Generate a summary of the data
  output$summary <- renderPrint({
      summary(iris)
  })
  
  # Generate an HTML table view of the data
  output$table <- renderTable({
    iris
  })

  
})