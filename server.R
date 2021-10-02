#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
data("iris")
library(dplyr)
library(ggplot2)
library(tidyverse)
library(caret)
library(plotly)

#Create Model

irisSetosa <- subset(iris, Species == 'setosa')
irisVirginica <- subset(iris, Species == 'virginica')
irisVersicolor <- subset(iris, Species == 'versicolor')



# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$Lenght <- renderPlotly({

        # generate bins based on input$bins from ui.R
        fig <- plot_ly(alpha = 0.8)
        
        if (input$Setosa) {
            fig <- fig %>% add_histogram(x = irisSetosa$Sepal.Length, name = 'Setosa')
        }
        
        if (input$Versicolor) {
            fig <- fig %>% add_histogram(x = irisVersicolor$Sepal.Length, name = 'Versicolor')
        }
        
        
        if (input$Virginica) {
            fig <- fig %>% add_histogram(x = irisVirginica$Sepal.Length, name = 'Virginica')
        }
        
        fig <- fig %>% layout(barmode = "overlay")
        
        fig

    })
    
    output$Width <- renderPlotly({
        
        # generate bins based on input$bins from ui.R
        fig <- plot_ly(alpha = 0.8)
        
        if (input$Setosa) {
            fig <- fig %>% add_histogram(x = irisSetosa$Sepal.Width, name = 'Setosa')
        }
        
        if (input$Versicolor) {
            fig <- fig %>% add_histogram(x = irisVersicolor$Sepal.Width, name = 'Versicolor')
        }
        
        
        if (input$Virginica) {
            fig <- fig %>% add_histogram(x = irisVirginica$Sepal.Width, name = 'Virginica')
        }
        fig <- fig %>% layout(barmode = "overlay")
        
        fig
        
    })

})
