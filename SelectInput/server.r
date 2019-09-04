library(shiny)
library(stringi)
cities <- list("'s-Hertogenbosch", "Tilburg", "Woensel")
shinyServer(
    function(input, output){
        # determine output
        output$out <- renderText({
            # create if state to check if values satisfies needs
            # NOTE: if state is within the renderText
            if (stri_cmp_neq(input$city, cities[1])){
                ret <- paste("De beste stad is:", "Oeps er ging iets mis", sep = "\n")
            } else {
                ret <- paste("De beste stad is:", input$city, sep = "\n")
            }
            ret # return value
        })
    } 
)