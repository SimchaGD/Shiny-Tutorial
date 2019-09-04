library(shiny)
library(stringi)

shinyServer(
    function(input, output){
        
        # make reactive function to reuse this variable
        colm <- reactive({
            as.numeric(input$var)
        })
        
        # determine output
        output$IrisHist <- renderPlot({
            data = iris[, colm()]
            
            hist(data, breaks = seq(0, max(data), l = input$bins + 1), col = input$colour,
                 main = "Histogram of Iris dataset", xlab = names(iris[colm()]))
        })
    } 
)