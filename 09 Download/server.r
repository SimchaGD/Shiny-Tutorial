library(shiny)
library(stringi)

shinyServer(
    function(input, output){
        
        varX <- reactive({
            as.numeric(input$varX)
        })
        
        varY <- reactive({
            as.numeric(input$varY)
        })
        
        x <- reactive({
            iris[, varX()]
        })
        
        y <- reactive({
            iris[, varY()]
        })
        
        
        # determine output
        output$IrisScat <- renderPlot({
            plot(x(), y(), type = "p", main = "Scatterplot of Iris dataset", 
                 xlab = names(iris[varX()]), ylab = names(iris[varY()]))
        })
        
        # create download handler
        output$download <- downloadHandler(
            # Specify filename
            filename = function() {
                # iris.png
                # iris.pdf
                paste("iris", tolower(input$format), sep = ".")
            },
            content = function(file) {
                # Decide which device to open
                if (input$format == "PNG"){
                    png(file)
                }
                else {
                    pdf(file)
                }
                # Create plot
                plot(x(), y(), type = "p", main = "Scatterplot of Iris dataset", 
                     xlab = names(iris[varX()]), ylab = names(iris[varY()]))
                # Close device
                dev.off()
            }
        )
    } 
)