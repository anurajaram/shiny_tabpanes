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

# Define UI for random distribution application 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Test Project"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the br()
  # element to introduce extra vertical spacing
  sidebarPanel(
    selectInput("plotseln", 
                label = " Selection pane for graphs",
                choices = c("Option1 - iris$SepalLength", 
                            "Option1 - iris$PetalLength",
                            "Option3 - iris$SepalWidth"),
                # also specifying default selection
                selected = "Option1 - iris$PetalLength")
    
  ),
  
  # Show a tabset that includes a plot, summary, and table view
  # of the generated distribution
  mainPanel(
    tabsetPanel(
      
      tabPanel("Graphs", 
#                selectInput("plotseln", 
#                            label = " Select plot for viewing",
#                            choices = c("Salary by State", 
#                                        "Salary by Visa class",
#                                        "Salary by Industry"),
#                            # also specifying default selection
#                            selected = "Salary by Visa class"),
#                
               plotOutput("plot")), 
      
      tabPanel("Summary", verbatimTextOutput("summary")), 
      
      tabPanel("Table", tableOutput("table"))
    )
  )
))