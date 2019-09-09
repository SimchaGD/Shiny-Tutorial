library(shiny)

cities <- list("'s-Hertogenbosch", "Tilburg", "Woensel")
shinyUI(
    fluidPage(
        titlePanel("Dropdown"),
        sidebarLayout(
            
            sidebarPanel(
                selectInput("city", "What city is the best?", cities)
            ),
            
            mainPanel(
                verbatimTextOutput("out")
            )
        )
    )
)