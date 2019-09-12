# load shiny lib
library(shiny)
    
shinyServer(
    function(input, output) {
        output$nameOut <- renderText(paste("Naam: ", input$name))
        output$mailOut <- renderText(paste("Mail: ", input$mail))
        output$msgOut <- renderText(paste("Bericht: ", input$message))
    }   
)
