# load shiny
library(shiny)


shinyServer(
    function(input, output){
        # set output as the text values of the input
        output$myName <- renderText(input$name)
        output$myAge <- renderText(input$age)
        
    }
)