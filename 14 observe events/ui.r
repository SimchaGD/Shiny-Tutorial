# load shiny
library(shiny)

shinyUI(
    fluidPage(
        
        titlePanel(title = "Zet hier de titel neer"),
        sidebarLayout(
            
            sidebarPanel()
            mainPanel()
            
        )
    )
)
