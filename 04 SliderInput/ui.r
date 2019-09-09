# load shiny
library(shiny)

shinyUI(
    fluidPage(
        # content of dashboard
        titlePanel("Tekst input app"),
        sidebarLayout(
            
            sidebarPanel(h3("Enter the personal information"),
                         # Text input
                         textInput("name", "Enter your name", ""),
                         textInput("age", "Enter your age", ""),
                         # radio Buttons
                         radioButtons("gender", "Choose gender", 
                                      choices = list("Male", "Female", "Other"),""),
                         # Slider
                         # Single selection
                         sliderInput("number", "Select a number", 
                                     min = 0, max = 10, value = 2),
                         # Range selection
                         sliderInput("randint", "Select range", 
                                     min = 0, max = 10, value = c(2, 6)),
                         # Cool animations
                         sliderInput("anime", "Cool animation", 
                                     min = -1, max = 5, value = -1, animate = TRUE),
                         # Select decimal
                         sliderInput("dec", "Decimal",
                                    min = 0, max = 0.95, value = 0, step = 0.05)
                         ),
            
            mainPanel(h2("Personal information"),
                      textOutput("myName"),
                      textOutput("myAge"),
                      textOutput("myGender"),
                      textOutput("myNumber"),
                      textOutput("myRandint"),
                      textOutput("AnimationNumber"),
                      textOutput("NumberDec")
                      )
            
        )
        
    )
)
