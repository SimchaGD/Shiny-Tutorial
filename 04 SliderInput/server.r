# load shiny
library(shiny)


shinyServer(
    function(input, output){
        # set output as the text values of the input
        output$myName <- renderText(input$name)
        output$myAge <- renderText(input$age)
        output$myGender <- renderText(input$gender)
        output$myNumber <- renderText(paste("You selected ", input$number))
        output$myRandint <- renderText(paste("I selected ", 
                                             sample(input$randint[1]:input$randint[2], 1), 
                                             " as a random integer"))
        output$AnimationNumber <- renderText(input$anime)
        output$NumberDec <- renderText(input$anime + input$dec)
    }
)