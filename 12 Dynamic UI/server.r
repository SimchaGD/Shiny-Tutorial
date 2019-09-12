library(shiny)
library(ggplot2)
library(stringi)

shinyServer(
    function(input, output){
        # determine variable names
        cNames <- reactive({
            # Use switch-case
            switch(input$dataset, 
                   "iris" = names(iris),
                   "mtcars" = names(mtcars),
                   "trees" = names(trees)
            )
        })
        
        # Determine what UI should change 
        output$vx <- renderUI({
            selectInput("variableX", "Select X variable", choices = cNames())
        })
        output$vy <- renderUI({
            selectInput("variableY", "Select Y variable", choices = cNames())
        })
        
        # plot the data
        output$plot <- renderPlot({
            attach(get(input$dataset))
            
            #plot(x = get(input$variableX), y = get(input$variableY),
            #     xlab = input$variableX, ylab = input$variableY)
            ggplot(get(input$dataset), aes_string(input$variableX, input$variableY)) +
                geom_point() + geom_smooth(method='lm', se = TRUE)
        })  
    } 
)