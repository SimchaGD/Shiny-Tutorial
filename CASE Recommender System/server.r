# load shiny lib
library(shiny)
library(stringi)

shinyServer(
    function(input, output) {
        
        output$selectfile <- renderUI({
            if (is.null(input$file)){return()}
            if (length(input$file$name) < 2){
                return()
            } else {
            list(hr(),
                 helpText("Choose for which file you need to see the data"),
                 selectInput("Select", "Select", choices = input$file$name))    
            }
        })
        
        output$dataLoaded <- reactive({
            if (is.null(input$file)){
                return(FALSE)
            } else{
                return(TRUE)
            }
        })
        outputOptions(output, "dataLoaded", suspendWhenHidden = FALSE)
        output$dataCheck <- renderText(dataLoaded())
        
        data <- reactive({
            file1 <- input$file
            if (is.null(file1)){return()}
            if (length(input$file$name) < 2){
                inputFile <- file1$datapath
            } else{
                inputFile <- file1$datapath[input$file$name == input$Select]
            }
            
            read.table(file = inputFile, 
                       sep = input$sep, header = input$header, quote = "\"", comment.char = "")
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
                if (stri_cmp_eq(input$sep, " ")){
                    media <- "https://i.giphy.com/media/TZf4ZyXb0lXXi/giphy.webp"
                }
                else{
                    media <- "https://media1.tenor.com/images/e8cf8b3a86d03c87a7c5b371924e509d/tenor.gif"
                }
                
                h3("No data loaded", 
                   br(), br(), br(), br(), br(),
                   tags$img(src = media))
            }
            else{
                tabsetPanel(
                    tabPanel("meta", 
                             tableOutput("filedf"), value = 1),
                    tabPanel("Data preview", 
                             tableOutput("table"), value = 2),
                    tabPanel("Summary", 
                             verbatimTextOutput("summary"), value = 3),
                    id = "selectedtablad"
                )
            }
            
        })
        
    }   
)
