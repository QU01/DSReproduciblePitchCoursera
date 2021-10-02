#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Iris Species Histogram"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            checkboxInput("Setosa", "Setosa", TRUE),
            checkboxInput("Versicolor", "Versicolor", TRUE),
            checkboxInput("Virginica", "Virginica", TRUE)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Iris Lenght", plotlyOutput("Lenght")),
                        tabPanel("Iris Width", plotlyOutput("Width"))
            )
        )
    )
))
