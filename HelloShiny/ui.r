# load shiny
library(shiny)

shinyUI(
    fluidPage(
        
        titlePanel(title = "This is my first shiny app. Hello Shiny!"),
        sidebarLayout( position = "right",
            
            sidebarPanel(h3("This is side bar panel"), 
                         h4("widget4"), 
                         p("heeeeeeeeeeeel veel tekst. NOGGGGGGGGGGGGGGMEEER TEKST")),
            mainPanel(h1("This is the main panel text. Output is displayed here"))
            
        )
    )
)