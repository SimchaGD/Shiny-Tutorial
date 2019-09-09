# load shiny
library(shiny)

shinyUI(
    fluidPage(
        
        titlePanel(title = "Zet hier de titel neer"),
        sidebarLayout( position = "left",
            
            sidebarPanel(h3("Dit is een soort menu"), 
                         h4("Hier komen widgets"),
                         h5("Widget 1"),
                         h5("Widget 2")),
            mainPanel(h1("Hier komt alle output te staan"))
            
        )
    )
)
