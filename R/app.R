#Load libraries
library(shinydashboard)
library(shiny)
library(tidyverse)

#Read data 

data1 <- read_tsv('')

ui <- dashboardPage(
  dashboardHeader(title = "Data Explorer"),
  dashboardSidebar(textInput("text", "Text")),
  dashboardBody(
    
  )
)
server <- function(input, output) {
  
}

shinyApp(ui, server)
