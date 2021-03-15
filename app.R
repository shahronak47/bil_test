#Load libraries
library(shinydashboard)
library(shiny)

ui <- dashboardPage(
  dashboardHeader(title = "Data Explorer"),
  dashboardSidebar(textInput("text", "Text")),
  dashboardBody(
    
  )
)
server <- function(input, output) {
  
}

shinyApp(ui, server)
