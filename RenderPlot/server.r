library(shiny)
library(stringi)

shinyServer(
    function(input, output){
        # determine output
        output$IrisHist <- renderPlot({
            colm <- as.numeric(input$var)
            data = iris[, colm]
            
            hist(data, breaks = seq(0, max(data), l = input$bins + 1), col = input$colour,
                 main = "Histogram of Iris dataset", xlab = names(iris[colm]))
        })
    } 
)