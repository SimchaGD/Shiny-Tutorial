# load shiny
library(shiny)

shinyUI(
    fluidPage(
        
        titlePanel(title = "File input"),
        sidebarLayout(
            
            sidebarPanel(
                fileInput("file", "Upload the file"),
                helpText("Default max. file size is 5MB"),
                br(),
                h5("Select the read.table parameters below"),
                checkboxInput(inputId = "header", label = "Header", value = FALSE),
                br(),
                radioButtons("sep", label = "Separator", 
                             choices = c(Comma = ",", 
                                         Semicolon = ";",
                                         Tab = "\t",
                                         Space = " "))
            ),
            mainPanel(
                uiOutput("tb")
            )
            
        )
    )
)
