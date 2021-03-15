#Load libraries
library(shinydashboard)
library(shiny)
library(dashboardthemes)
library(tidyverse)
library(plotly)

#Read data from github URL and join the two datasets based on STUDYID and USUBJID
data1 <- read_tsv('https://raw.githubusercontent.com/shahronak47/data_explorer/main/Data/Random_LabValuesInfo_2020.tsv')
data2 <- read_tsv('https://raw.githubusercontent.com/shahronak47/data_explorer/main/Data/Random_PatientLevelInfo_2020.tsv')
data <- inner_join(data1, data2,  by = c("STUDYID", "USUBJID"))

ui <- dashboardPage(
  dashboardHeader(title = "Data Explorer"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    shinyDashboardThemes(
      theme = "poor_mans_flatly"
    ),
    fluidRow(
      column(4, selectInput('bmrkr2', 'Select BMRKR2', unique(data$BMRKR2)), 
                numericInput('bins', 'Select number of bins', 10)),
      column(8, plotlyOutput('plot1'))
    ), 
    br(),br(),br(),br(),br(),br(),
    fluidRow(
      column(4, selectInput('usubjID', 'Select Subject ID', unique(data$USUBJID))), 
      column(8, plotlyOutput('plot2'))
    ), 
    downloadButton("generate_report","Click to download images in pdf")
  )
)
server <- function(input, output) {
  output$plot1 <- renderPlotly({
    ggplotly(data %>%
      filter(BMRKR2 == input$bmrkr2) %>%
      ggplot() + aes(AGE) + 
      geom_histogram(bins = input$bins, fill = 'blue') + 
      theme_classic() + 
      ggtitle(paste0('Histogram of AGE variable for ', input$bmrkr2)) + 
      theme(text = element_text(size=15)))
  })
  
  output$plot2 <- renderPlotly({
    ggplotly(data %>%
      filter(USUBJID == input$usubjID) %>%
      group_by(LBCAT, AVISIT) %>%
      summarise(AVAL = mean(AVAL)) %>%
      ggplot() + aes(LBCAT, AVAL, fill = AVISIT) + 
      geom_col(position = 'dodge') + 
      theme_classic() + 
      theme(text = element_text(size=15)))
  })
}

shinyApp(ui, server)
