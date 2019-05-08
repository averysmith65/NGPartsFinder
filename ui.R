#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
X350_350 <- read.csv("NGPartsFinderData.csv", stringsAsFactors = FALSE)

fluidPage(
  titlePanel("NGParts Finder"),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("StockNumber",
                       "Stock Number:",
                       c("All",
                         unique(as.character(X350_350$StockNumber))))
    ),
    column(4,
           selectInput("StockDescription1",
                       "Stock Description 1:",
                       c("All",
                         unique(as.character(X350_350$StockDescription1))))
    ),
    column(4,
           selectInput("QuantityOnHand",
                       "Quantity On Hand:",
                       c("All",
                         unique(as.character(X350_350$QuantityOnHand))))
    )
  ),
  # Create a new row for the table.
  DT::dataTableOutput("table")
)