# load shiny
library(shiny)

shinyUI(
    fluidPage(theme = "style.css",
        
        titlePanel(title = "Case"),
        sidebarLayout(
            sidebarPanel(
                # Deze panel moet er altijd zijn
                conditionalPanel(
                    "true",
                    fileInput("file", "Upload the file", multiple = TRUE),
                    helpText("Default max. file size is 5MB")
                ),
                
                # Alleen wanneer een bestand ingeladen is willen we een keuze maken 
                # of welk bestand we willen
                conditionalPanel(
                    "output.dataLoaded == true",
                    uiOutput("selectfile")
                ), 
                
                # Alleen wanneer we de data voor ons hebben kunnen we beslissen hoe deze ingelezen
                # moet worden, daarom is het alleen mogelijk om op tablad 2 die opties te kiezen
                conditionalPanel("input.selectedtablad == 2",
                    h5("Select the read.table parameters below"),
                    checkboxInput(inputId = "header", label = "Header", value = FALSE),
                    br(),
                    radioButtons("sep", label = "Separator", 
                                 choices = c(Comma = ",", 
                                             Semicolon = ";",
                                             Tab = "\t",
                                             Space = " ")
                                 )
                    ),
                
                # Deze panel moet er altijd zijn
                conditionalPanel("true",
                                 br(),
                                 br(),
                                 br(),
                                 h6("Made by"),
                                 h6(tags$a(href = "https://tauomega.nl/", 
                                           tags$img(src = "TW_logo.png", 
                                                    width = 76, height = 50)
                                           )
                                    )
                                 )
            ),
            mainPanel(align="center",
                uiOutput("tb")
            )
            
        )
    )
)
