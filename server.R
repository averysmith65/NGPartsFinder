#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
X350_350 <- read.csv("NGPartsFinderData.csv", stringsAsFactors = FALSE)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- X350_350
    if (input$StockNumber != "All") {
      data <- data[data$StockNumber == input$StockNumber,]
    }
    if (input$StockDescription1 != "All") {
      data <- data[data$StockDescription1 == input$StockDescription1,]
    }
    if (input$QuantityOnHand != "All") {
      data <- data[data$QuantityOnHand == input$QuantityOnHand,]
    }
    data
  }))
  
})
