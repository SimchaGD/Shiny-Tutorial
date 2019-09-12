# load shiny
library(shiny)

shinyUI(
    fluidPage(
        
        titlePanel(title = "Zet hier de titel neer"),
        sidebarLayout( position = "left",
                       
                       sidebarPanel(
                           textInput("name", "Wat is je naam?"),
                           textInput("mail", "Wat is je mail?"),
                           textInput("message", "Bericht:"),
                           submitButton("Submit")
                       ),
                       mainPanel(
                           textOutput("nameOut"),
                           textOutput("mailOut"),
                           br(),
                           textOutput("msgOut")
                       )
                       
        )
    )
)
