# load shiny lib
library(shiny)

shinyServer(
    function(input, output) {
        data <- reactive({
            file1 <- input$file
            if (is.null(file1)){return()}
            read.table(file = file1$datapath, 
                       sep = input$sep, header = input$header)
        })
        
        output$filedf <- renderTable({
            if (is.null(data())){return()}
            input$file
        })
        
        output$summary <- renderPrint({
            if(is.null(data())){return()}
            summary(data())
        })
        
        output$table <- renderTable({
            if(is.null(data())){return()}
            head(data(), n = 10)
        })
        
        output$tb <- renderUI({
            if(is.null(data())){
                h5("Powered by", tags$img(src = "https://tauomega.nl/images/TW_logo.jpg", 
                                          height = 200, width = 200))
            }
            else{
                tabsetPanel(
                    tabPanel("Data preview", 
                             tableOutput("table")),
                    tabPanel("Summary", 
                             verbatimTextOutput("summary")),
                    tabPanel("meta", 
                             tableOutput("filedf"))
                )
                }
            
        })
    }   
)
