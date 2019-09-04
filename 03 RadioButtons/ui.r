# load shiny
library(shiny)

shinyUI(
    fluidPage(
        # content of dashboard
        titlePanel("Tekst input app"),
        sidebarLayout(
            
            sidebarPanel(h3("Enter the personal information"),
                         textInput("name", "Enter your name", ""),
                         textInput("age", "Enter your age", ""),
                         radioButtons("gender", "Choose gender", 
                                      choices = list("Male", "Female", "Other"),"")
                         ),
            mainPanel(h2("Personal information"),
                      textOutput("myName"),
                      textOutput("myAge"),
                      textOutput("myGender")
                      )
            
        )
        
    )
)