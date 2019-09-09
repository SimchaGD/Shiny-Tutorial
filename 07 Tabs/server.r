library(shiny)
library(stringi)

shinyServer(
    function(input, output){
        #determine five number summary
        output$summary <- renderPrint(summary(iris))
        
        # determine strucure of dataset
        output$struct <- renderPrint(str(iris))
        
        # determine datatable visualisation
        output$IrisData <- renderTable({
            colm <- as.numeric(input$var)
            iris[colm]
            
        }, bordered = TRUE, rownames = TRUE)
        
        # determine histogram
        output$IrisHist <- renderPlot({
            colm <- as.numeric(input$var)
            data = iris[, colm]
            hist(data, breaks = seq(0, max(data), l = input$bins + 1), col = input$colour,
                 main = "Histogram of Iris dataset", xlab = names(iris[colm]))
        })
    } 
)