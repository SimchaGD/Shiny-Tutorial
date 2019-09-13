# load shiny
library(shiny)

shinyUI(
    fluidPage(theme = "style.css",
        
        titlePanel(title = "Case"),
        sidebarLayout(
            sidebarPanel(
            conditionalPanel("1==1",
                             fileInput("file", "Upload the file", multiple = TRUE),
                             helpText("Default max. file size is 5MB"),
                             textOutput("dataCheck")
                             ),
            
            conditionalPanel("output.dataLoaded == true",
                uiOutput("selectfile"),
                h5("Select the read.table parameters below"),
                checkboxInput(inputId = "header", label = "Header", value = FALSE),
                br(),
                radioButtons("sep", label = "Separator", 
                             choices = c(Comma = ",", 
                                         Semicolon = ";",
                                         Tab = "\t",
                                         Space = " "))),
            conditionalPanel("1==1",
                             br(),
                             br(),
                             br(),
                             h6("Made by"),
                             h6(tags$a(href = "https://tauomega.nl/", tags$img(src = "TW_logo.png", width = 76, height = 50))))
            ),
            mainPanel(align="center",
                uiOutput("tb")
            )
            
        )
    )
)
