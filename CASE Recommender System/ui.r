# load shiny
library(shiny)

shinyUI(
    fluidPage(theme = "style.css",
        
        titlePanel(title = "File input"),
        sidebarLayout(
            
            sidebarPanel(
                fileInput("file", "Upload the file", multiple = TRUE),
                uiOutput("selectfile"),
                helpText("Default max. file size is 5MB"),
                br(),
                h5("Select the read.table parameters below"),
                checkboxInput(inputId = "header", label = "Header", value = FALSE),
                br(),
                radioButtons("sep", label = "Separator", 
                             choices = c(Comma = ",", 
                                         Semicolon = ";",
                                         Tab = "\t",
                                         Space = " ")),
                br(),
                br(),
                br(),
                h6("Made by"),
                h6(tags$a(href = "https://tauomega.nl/", tags$img(src = "TW_logo.png", width = 76, height = 50)))
            ),
            mainPanel(align="center",
                uiOutput("tb")
            )
            
        )
    )
)
